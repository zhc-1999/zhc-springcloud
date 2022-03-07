package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.system.domain.mysql.SysMenuPO;
import com.zhc.cloud.system.domain.mapper.SysMenuMapper;
import com.zhc.cloud.system.service.ISysMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 * 菜单权限表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenuPO> implements ISysMenuService {
    @Autowired
    private SysMenuMapper sysMenuPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysMenuPO>> selectList(SysMenuPO sysMenuPO) {
        LambdaQueryWrapper<SysMenuPO> entityWrapper = new LambdaQueryWrapper<SysMenuPO>();
        return Result.success(sysMenuPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysMenuPO> selectOne(SysMenuPO sysMenuPO) {
        LambdaQueryWrapper<SysMenuPO> entityWrapper = new LambdaQueryWrapper<SysMenuPO>();
        return Result.success(sysMenuPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysMenuPO> selectById(Integer id) {
        return Result.success(sysMenuPOMapper.selectById(id));
    }

    /**
     * 根据用户ID查询菜单
     *
     * @param userId 用户名称
     * @return 菜单列表
     */
    @Override
    public Result<?> selectMenuTreeByUserId(String userId) {
        List<SysMenuPO> menus = sysMenuPOMapper.selectMenuTreeByUserId(userId);
        List<SysMenuPO> childPerms = getChildPerms(menus, 0);
        return Result.success(childPerms);
    }

    /**
     * 根据父节点的ID获取所有子节点
     *
     * @param list 分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<SysMenuPO> getChildPerms(List<SysMenuPO> list, int parentId) {
        List<SysMenuPO> returnList = new ArrayList<>();
        for (Iterator<SysMenuPO> iterator = list.iterator(); iterator.hasNext();) {
            SysMenuPO t = iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId) {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private void recursionFn(List<SysMenuPO> list, SysMenuPO t) {
        // 得到子节点列表
        List<SysMenuPO> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenuPO tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysMenuPO> getChildList(List<SysMenuPO> list, SysMenuPO t) {
        List<SysMenuPO> tlist = new ArrayList<>();
        Iterator<SysMenuPO> it = list.iterator();
        while (it.hasNext()) {
            SysMenuPO n = it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenuPO> list, SysMenuPO t) {
        return getChildList(list, t).size() > 0;
    }


}

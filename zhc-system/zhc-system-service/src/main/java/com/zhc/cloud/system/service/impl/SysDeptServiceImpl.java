package com.zhc.cloud.system.service.impl;

import com.zhc.cloud.common.utils.SecurityUtils;
import com.zhc.cloud.system.api.dto.TreeSelectDTO;
import com.zhc.cloud.system.api.entity.SysDeptVO;
import com.zhc.cloud.system.domain.mysql.SysDeptPO;
import com.zhc.cloud.system.domain.mapper.SysDeptMapper;
import com.zhc.cloud.system.service.ISysDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 部门表 服务实现类
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDeptPO> implements ISysDeptService {
    @Autowired
    private SysDeptMapper sysDeptPOMapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<SysDeptPO>> selectList(SysDeptPO sysDeptPO) {
        LambdaQueryWrapper<SysDeptPO> entityWrapper = new LambdaQueryWrapper<SysDeptPO>();
        return Result.success(sysDeptPOMapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<SysDeptPO> selectOne(SysDeptPO sysDeptPO) {
        LambdaQueryWrapper<SysDeptPO> entityWrapper = new LambdaQueryWrapper<SysDeptPO>();
        return Result.success(sysDeptPOMapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<SysDeptPO> selectById(Integer id) {
        return Result.success(sysDeptPOMapper.selectById(id));
    }

    @Override
    public Result<?> treeselect(SysDeptVO dept) {
        LambdaQueryWrapper<SysDeptPO> entityWrapper = new LambdaQueryWrapper<SysDeptPO>();
        entityWrapper.eq(StringUtils.isNotBlank(SecurityUtils.getDeptId()),SysDeptPO::getDeptId,dept.getDeptId())
                .eq((dept.getParentId()!=null &&dept.getParentId()!=0),SysDeptPO::getParentId,dept.getDeptId())
                .like(StringUtils.isNotBlank(dept.getDeptName()),SysDeptPO::getDeptName,dept.getDeptName())
                .eq(StringUtils.isNotBlank(dept.getStatus()),SysDeptPO::getStatus,dept.getStatus())
                .orderByAsc(SysDeptPO::getParentId,SysDeptPO::getOrderNum);
        List<SysDeptPO> sysDeptPO = sysDeptPOMapper.selectList(entityWrapper);
        return Result.success(buildTree(sysDeptPO,0L));
    }

    /***
     * 构建树形结构
     * @param sysDeptPO
     * @param parentId
     * @return
     */
    public List<TreeSelectDTO> buildTree(List<SysDeptPO> sysDeptPO, Long parentId){
        List<TreeSelectDTO> result = sysDeptPO
                .stream()
                .filter(node -> parentId.equals(node.getParentId()))
                .map(node -> {
                    TreeSelectDTO treeSelectDTO = new TreeSelectDTO();
                    treeSelectDTO.setChildren(buildTree(sysDeptPO, node.getDeptId()));
                    treeSelectDTO.setId(node.getDeptId());
                    treeSelectDTO.setLabel(node.getDeptName());
                    return treeSelectDTO;
                })
                .collect(Collectors.toList());
        return result;
    }



}

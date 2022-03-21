package com.zhc.cloud.system.api.entity;

import com.zhc.cloud.common.page.PageVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author zhc
 * @description 前端用户列表参数
 * @date 2022-03-16 15:42
 */
@Data
public class SysUserVO extends PageVO {

    private Long userId;
    private String userName;
    private Long deptId;

    private Date beginTime;
    private Date endTime;

    private String remark;
    /** 用户昵称 */
    private String nickName;

    /** 用户邮箱 */
    private String email;

    /** 手机号码 */
    private String phone;

    /** 用户性别 */
    private String sex;

    /** 用户头像 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 帐号状态（0正常 1停用） */
    private String status;

    /** 角色组 */
    private Long[] roleIds;

    /** 岗位组 */
    private Long[] postIds;

    /** 角色ID */
    private Long roleId;

}

package com.zhc.cloud.system.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author zhc
 * @since 2022-01-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysDeptVO  implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long deptId;

    private Long parentId;

    private String ancestors;

    private String deptName;

    private Integer orderNum;

    private String leader;

    private String phone;

    private String email;

    private String status;


}

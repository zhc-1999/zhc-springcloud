package com.zhc.cloud.common.page;

import lombok.Data;

/**
 * @author zhc
 * @description 分页封装
 * @date 2022-03-16 15:55
 */
@Data
public class PageVO {

    private Integer pageNum = 1;

    private Integer pageSize = 10;
}

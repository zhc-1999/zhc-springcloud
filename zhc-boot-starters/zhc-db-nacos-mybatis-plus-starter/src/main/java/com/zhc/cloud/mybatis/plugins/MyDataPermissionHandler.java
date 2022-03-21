package com.zhc.cloud.mybatis.plugins;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.handler.DataPermissionHandler;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.utils.SecurityUtils;
import lombok.SneakyThrows;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import org.apache.commons.lang3.StringUtils;

import static com.zhc.cloud.common.utils.SecurityUtils.getLoginUser;

/**
 * mybatis 数据权限处理
 * @author zhc
 * @description MyDataPermissionHandler
 * @date 2022-03-18 16:29
 */
public class MyDataPermissionHandler  implements DataPermissionHandler {
    /**
     * 全部数据权限
     */
    public static final String DATA_SCOPE_ALL = "1";

    /**
     * 自定数据权限
     */
    public static final String DATA_SCOPE_CUSTOM = "2";

    /**
     * 部门数据权限
     */
    public static final String DATA_SCOPE_DEPT = "3";

    /**
     * 部门及以下数据权限
     */
    public static final String DATA_SCOPE_DEPT_AND_CHILD = "4";

    /**
     * 仅本人数据权限
     */
    public static final String DATA_SCOPE_SELF = "5";

    /**
     * 数据权限过滤拼接 sql
     * @param where             原SQL Where 条件表达式
     * @param mappedStatementId Mapper接口方法ID
     * @return
     */
    @SneakyThrows
    @Override
    public Expression getSqlSegment(Expression where, String mappedStatementId) {
        String dataScope = SecurityUtils.getDataScope();
        if (!SecurityConstants.DATA_SCOPE.equals(dataScope)){
            return where;
        }
        JSONObject loginUser = getLoginUser();
        if (loginUser == null){
            return where;
        }
        Integer deptId = loginUser.getInteger("deptId");
        String userId = loginUser.getString("userId");
        JSONArray roles = loginUser.getJSONArray("roles");
        StringBuilder sqlString = new StringBuilder();
        for (Object role : roles) {
            JSONObject roleJson = JSONObject.parseObject(role.toString());
            String dataScopeNum = roleJson.getString(SecurityConstants.DATA_SCOPE);
            Integer roleId = roleJson.getInteger("roleId");
            if (DATA_SCOPE_ALL.equals(dataScopeNum)) {
                // 全部数据权限
                sqlString = new StringBuilder();
                break;
            } else if (DATA_SCOPE_CUSTOM.equals(dataScopeNum)) {
                sqlString.append(" OR `sys_dept`.dept_id IN ( SELECT dept_id FROM `sys_role_dept` WHERE role_id = ")
                        .append(roleId)
                        .append("' ) ");
            } else if (DATA_SCOPE_DEPT.equals(dataScopeNum)) {
                sqlString.append(" OR `sys_dept`.dept_id = '").append(deptId).append("' ");
            } else if (DATA_SCOPE_DEPT_AND_CHILD.equals(dataScopeNum)) {
                sqlString.append(" OR `sys_dept`.dept_id IN ( SELECT dept_id FROM `sys_dept` WHERE dept_id = '")
                        .append(deptId)
                        .append("' or find_in_set( '")
                        .append(deptId)
                        .append("' , ancestors ) ) ");
            }else if (DATA_SCOPE_SELF.equals(dataScopeNum)) {
                //TODO 暂时有问题
                sqlString.append(" OR `sys_user`.user_id = '").append(userId).append("' ");
            }
        }
        if (StringUtils.isNotBlank(sqlString.toString())) {
            sqlString.insert(0," AND (");
            sqlString.append(")");
            sqlString = sqlString.delete(7,9);
            return CCJSqlParserUtil.parseCondExpression(where + sqlString.toString());
        }else {
            return where;
        }
    }


}

package com.zhc.cloud.mybatis.intercept;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhc.cloud.common.constant.SecurityConstants;
import com.zhc.cloud.common.utils.SecurityUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.HexValue;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Signature;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.ItemsList;
import net.sf.jsqlparser.parser.CCJSqlParserManager;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectBody;
import net.sf.jsqlparser.statement.select.SetOperationList;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.io.StringReader;
import java.util.List;
import java.util.Properties;

import static com.zhc.cloud.common.utils.SecurityUtils.getLoginUser;

/**
 * @author zhc
 * @description 数据权限插件
 * @date 2022-04-01 17:03
 */
@Intercepts(
        {
                @Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}),
                @Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class, CacheKey.class, BoundSql.class}),
        }
)
@Slf4j
public class MybatisDataPermissionIntercept implements Interceptor {
    CCJSqlParserManager parserManager = new CCJSqlParserManager();

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

    @Override
    public Object intercept(Invocation invocation) throws Throwable {

        try {
            Object[] args = invocation.getArgs();
            MappedStatement ms = (MappedStatement) args[0];
            Object parameter = args[1];
            RowBounds rowBounds = (RowBounds) args[2];
            ResultHandler resultHandler = (ResultHandler) args[3];
            Executor executor = (Executor) invocation.getTarget();
            CacheKey cacheKey;
            BoundSql boundSql;
            //由于逻辑关系，只会进入一次
            if (args.length == 4) {
                //4 个参数时
                boundSql = ms.getBoundSql(parameter);
                cacheKey = executor.createCacheKey(ms, parameter, rowBounds, boundSql);
            } else {
                //6 个参数时
                cacheKey = (CacheKey) args[4];
                boundSql = (BoundSql) args[5];
            }
            //TODO 自己要进行的各种处理
            String sql = boundSql.getSql();
            log.info("原始SQL： {}", sql);
            //判断线程内是否有权限信息
            String dataScope = SecurityUtils.getDataScope();
            if (SecurityConstants.DATA_SCOPE.equals(dataScope)){
                // 增强sql
                Select select = (Select) parserManager.parse(new StringReader(sql));
                SelectBody selectBody = select.getSelectBody();
                if (selectBody instanceof PlainSelect) {
                    this.setWhere((PlainSelect) selectBody);
                } else if (selectBody instanceof SetOperationList) {
                    SetOperationList setOperationList = (SetOperationList) selectBody;
                    List<SelectBody> selectBodyList = setOperationList.getSelects();
                    selectBodyList.forEach((s) -> {
                        this.setWhere((PlainSelect) s);
                    });
                }
                String dataPermissionSql = select.toString();
                log.info("增强SQL： {}", dataPermissionSql);
                BoundSql dataPermissionBoundSql = new BoundSql(ms.getConfiguration(), dataPermissionSql, boundSql.getParameterMappings(), parameter);
                return executor.query(ms, parameter, rowBounds, resultHandler, cacheKey, dataPermissionBoundSql);
            }
            //注：下面的方法可以根据自己的逻辑调用多次，在分页插件中，count 和 page 各调用了一次
            return executor.query(ms, parameter, rowBounds, resultHandler, cacheKey, boundSql);
        } finally {
            //清除线程中权限参数
            SecurityUtils.cleanDataScope();
        }
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
    }

    protected void setWhere(PlainSelect plainSelect) {
        Expression sqlSegment = this.getSqlSegment(plainSelect.getWhere());
        if (null != sqlSegment) {
            plainSelect.setWhere(sqlSegment);
        }
    }

    @SneakyThrows
    public Expression getSqlSegment(Expression where) {
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
                sqlString.append(" OR `sys_dept`.dept_id IN ( SELECT dept_id FROM `sys_role_dept` WHERE role_id = '")
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
            if (where == null){
                where = new HexValue(" 1 = 1 ");
            }
            sqlString.insert(0," AND (");
            sqlString.append(")");
            sqlString.delete(7, 9);
            //判断是不是分页， 分页完成之后 清除权限标识
            return CCJSqlParserUtil.parseCondExpression(where + sqlString.toString());
        }else {
            return where;
        }
    }


    /**
     * 构建Column
     *
     * @param dataTableAlias 表别名
     * @param columnName     字段名称
     * @return 带表别名字段
     */
    public static Column buildColumn(String dataTableAlias, String columnName) {
        if (StringUtils.isNotEmpty(dataTableAlias)) {
            columnName = dataTableAlias + StringPool.DOT + columnName;
        }
        return new Column(columnName);
    }
}


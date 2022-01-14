package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import com.zhc.cloud.common.result.Result;

import java.util.List;

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {
 /***
 * 查询列表
 * @return Result
 */
 Result<List<${entity}>> selectList(${entity} entity);
 /***
 * 查询单个
 * @return Result
 */
 Result<${entity}> selectOne(${entity} entity);
 /***
 * 根据id查询
 * @return Result
 */
 public Result<${entity}> selectById(Integer id);

}
</#if>

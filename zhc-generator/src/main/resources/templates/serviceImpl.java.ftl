package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import com.zhc.cloud.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {
    @Autowired
    private ${table.mapperName} ${table.entityPath}Mapper;

    /***
    * 查询列表
    * @return Result
    */
    @Override
    public Result<List<${entity}>> selectList(${entity} ${table.entityPath}) {
        LambdaQueryWrapper<${entity}> entityWrapper = new LambdaQueryWrapper<${entity}>();
        return Result.success(${table.entityPath}Mapper.selectList(entityWrapper));
    }
    /***
    * 查询单个
    * @return Result
    */
    @Override
    public Result<${entity}> selectOne(${entity} ${table.entityPath}) {
        LambdaQueryWrapper<${entity}> entityWrapper = new LambdaQueryWrapper<${entity}>();
        return Result.success(${table.entityPath}Mapper.selectOne(entityWrapper));
    }
    /***
    * 根据id查询
    * @return Result
    */
    @Override
    public Result<${entity}> selectById(Integer id) {
        return Result.success(${table.entityPath}Mapper.selectById(id));
    }


}
</#if>

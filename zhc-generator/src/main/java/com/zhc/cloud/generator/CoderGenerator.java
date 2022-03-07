package com.zhc.cloud.generator;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.fill.Column;
import com.baomidou.mybatisplus.generator.keywords.MySqlKeyWordsHandler;
import org.apache.commons.lang.StringUtils;

import java.util.*;


/**
 * @author zhc
 * @description 代码生成
 * @date 2022-01-13 17:07
 */
public class CoderGenerator  {

    // 基础信息配置
    // 数据库连接字符
    private static final String URL = "jdbc:mysql://192.144.238.212:3306/zhc?useUnicode=true&serverTimezone=UTC&useSSL=false&characterEncoding=utf8";
    // 数据库用户名
    private static final String USERNAME = "root";
    // 数据库密码
    private static final String PASSWORD = "KoammO*Nnts0EsSD";
    // 项目根路径。生成结果如：D:\MyProject\spring-boot
    private static final String projectRootPath = System.getProperty("user.dir");
    // 子项目名称
    private static final String projectPath = "zhc-system";

    private static final String projectName = "system";
    // 父包名。用于生成的java文件的import。
    private static final String parentPackageName = "com.zhc.cloud."+projectName;

    /**
     * 执行此处
     */
    public static void main(String[] args) {
        // 简单示例，适用于单模块项目
//        simpleGenerator();
        // 完整示例，适用于多模块项目
        // 配置模板
        completeGenerator();
    }

    /**
     * 【单模块】简单的实现方案
     */
    protected static void simpleGenerator() {

        // 包路径
        String packagePath = projectRootPath + "/src/main/java";
        // XML文件的路径
        String mapperXmlPath = projectRootPath + "/src/main/resources/mapper";
        // 4.模板配置
        // 使用Freemarker引擎模板，默认的是Velocity引擎模板

        // 开始执行代码生成
        FastAutoGenerator
                .create(URL, USERNAME, PASSWORD)
                // 1. 全局配置
                .globalConfig(builder -> builder
                        // 作者名称
                        .author("zhc")
                        // 开启覆盖已生成的文件。注释掉则关闭覆盖。
                        // .fileOverride()
                        // 禁止打开输出目录。注释掉则生成完毕后，自动打开生成的文件目录。
                        .disableOpenDir()
                        // 指定输出目录。如果指定，Windows生成至D盘根目录下，Linux or MAC 生成至 /tmp 目录下。
                        .outputDir(packagePath)
                        // 开启swagger2.注释掉则默认关闭。
                         .enableSwagger()
                        // 指定时间策略。
                        .dateType(DateType.TIME_PACK)
                        // 注释时间策略。
                        .commentDate("yyyy-MM-dd")
                )

                // 2. 包配置
                .packageConfig((scanner, builder) -> builder
                        // 设置父表名
                        .parent(parentPackageName)
                        .moduleName(scanner.apply("请输入模块名："))
                        // mapper.xml 文件的路径。单模块下，其他文件路径默认即可。
                        .pathInfo(Collections.singletonMap(OutputFile.mapperXml, mapperXmlPath))
                )

                // 3. 策略配置
                .strategyConfig((scanner, builder) -> builder.addInclude(getTables(scanner.apply("请输入表名，多个英文逗号分隔？生成所有表，请输入[all]：")))
                        // 阶段1：Entity实体类策略配置
                        .entityBuilder()
                        // 开启生成实体时生成字段注解。
                        // 会在实体类的属性前，添加[@TableField("nickname")]
                        .enableTableFieldAnnotation()
                        // 逻辑删除字段名(数据库)。
                        .logicDeleteColumnName("deleted")
                        // 逻辑删除属性名(实体)。
                        // 会在实体类的该字段属性前加注解[@TableLogic]
                        .logicDeletePropertyName("deleted")
                        // 会在实体类的该字段上追加注解[@TableField(value = "create_time", fill = FieldFill.INSERT)]
                        .addTableFills(new Column("create_time", FieldFill.INSERT))
                        // 会在实体类的该字段上追加注解[@TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)]
                        .addTableFills(new Column("update_time", FieldFill.INSERT_UPDATE))
                        // 阶段2：Mapper策略配置
                        .mapperBuilder()
                        // 开启 @Mapper 注解。
                        // 会在mapper接口上添加注解[@Mapper]
                        .enableMapperAnnotation()
                        // 启用 BaseResultMap 生成。
                        // 会在mapper.xml文件生成[通用查询映射结果]配置。
                        .enableBaseResultMap()
                        // 启用 BaseColumnList。
                        // 会在mapper.xml文件生成[通用查询结果列 ]配置
                        .enableBaseColumnList()
                        // 阶段4：Controller策略配置
                        .controllerBuilder()
                        // 会在控制类中加[@RestController]注解。
                        .enableRestStyle()
                        // 开启驼峰转连字符
                        .enableHyphenStyle()
                        .build()
                )

                // 4. 模板引擎配置，默认 Velocity 可选模板引擎 Beetl 或 Freemarker
                //.templateEngine(new BeetlTemplateEngine())
                .templateEngine(new FreemarkerTemplateEngine())

                // 5. 执行
                .execute();
    }

    /**
     * 【多模块使用】完整的实现方案
     */
    protected static void completeGenerator() {
        //【1】基础信息配置
        // 指定模块名，用于生成的java文件的import。
        String moduleName = scanner(1,"请输入模块名：");
        // 六个文件的路径。多模块项目下，一般来说每个文件的路径都是不同的（根据项目实际，可能在不同的模块下）。
        String entityPath = projectRootPath + "/"+projectPath+"/"+projectPath+"-domain/src/main/java/com/zhc/cloud/"+projectName+"/domain/mysql/" + moduleName;
        String mapperPath = projectRootPath + "/"+projectPath+"/"+projectPath+"-domain/src/main/java/com/zhc/cloud/"+projectName+"/domain/mapper/" + moduleName;
        String mapperXmlPath = projectRootPath + "/"+projectPath+"/"+projectPath+"-start/src/main/resources/mapper/mysql/" + moduleName;
        String servicePath = projectRootPath + "/"+projectPath+"/"+projectPath+"-service/src/main/java/com/zhc/cloud/"+projectName+"/service/" + moduleName;
        String serviceImplPath = projectRootPath + "/"+projectPath+"/"+projectPath+"-service/src/main/java/com/zhc/cloud/"+projectName+"/service/" + moduleName + "/impl";
        String controllerPath = projectRootPath + "/"+projectPath+"/"+projectPath+"-web/src/main/java/com/zhc/cloud/"+projectName+"/web/controller/" + moduleName;
        // 关于以上写法的解释：
        // --- 假设我们的项目有四个模块：project-entity、project-dao、project-service、project-controller
        // --- project-entity 的包路径：com.yourdomain.projectname.eneity，
        // ---则生成system模块下的sys_user表，生成的实体文件将放在：com.yourdomain.projectname.entity.system包下，SysUser.java。
        // --- project-dao 的包路径：com.yourdomain.projectname.mapper，
        // ---则生成system模块下的sys_user表，生成的mapper接口文件将放在：com.yourdomain.projectname.mapper.system包下，类名为：SysUserMapper.java。
        // --- 其他文件以此类推，即每个模块放MVC结构中对应的类型文件。
        // --- 注意：这里最后的文件路径修改了，下文配置中的【2 包配置】中的包路径也要同步修改！否则生成的java文件，首句import会报错。原因是路径错误。

        // 【2】开始执行代码生成
        FastAutoGenerator.create(URL, USERNAME, PASSWORD)
                // 1. 全局配置
                .globalConfig(builder -> builder
                        // 作者名称
                        .author("zhc")
                        // 开启覆盖已生成的文件。注释掉则关闭覆盖。请谨慎开启此选项！
                        // .fileOverride()
                        // 禁止打开输出目录。注释掉则生成完毕后，自动打开生成的文件目录。
                        .disableOpenDir()
                        // 指定输出目录。多模块下，每个类型的文件输出目录不一致，在包配置阶段配置。
//                         .outputDir(packagePath)
                        // 开启swagger2。注释掉则默认关闭。
                         .enableSwagger()
                        // 开启 kotlin 模式。注释掉则关闭此模式
                        // .enableKotlin()
                        // 指定时间策略。
                        .dateType(DateType.TIME_PACK)
                        // 注释时间策略。
                        .commentDate("yyyy-MM-dd")
                )

                // 2. 包配置
                .packageConfig((scanner, builder) -> builder
                        // 阶段1：各个文件的包名设置，用来拼接每个java文件的第一句：package com.XXX.XXX.XXX.xxx;
                        // 父包名配置
                        .parent(parentPackageName)
                        // 输入模块名。此模块名会在下面的几个包名前加。多模块项目，请根据实际选择是否添加。
                        // .moduleName(moduleName)

                        .entity("domain.mysql" + (StringUtils.isBlank(moduleName)?"":"."+moduleName) )
                        .mapper("domain.mapper" + (StringUtils.isBlank(moduleName)?"":"."+moduleName) )
                        .service("service" + (StringUtils.isBlank(moduleName)?"":"."+moduleName) )
                        .serviceImpl("service" + (StringUtils.isBlank(moduleName)?"":"."+moduleName) + ".impl")
                        .controller("web.controller" + (StringUtils.isBlank(moduleName)?"":"."+moduleName) )
                        // 阶段2：所有文件的生成路径配置
                        .pathInfo(
                                new HashMap<OutputFile, String>() {{
                                    // 实体类的保存路径
                                    put(OutputFile.entity, entityPath);
                                    // mapper接口的保存路径
                                    put(OutputFile.mapper, mapperPath);
                                    // mapper.xml文件的保存路径
                                    put(OutputFile.mapperXml, mapperXmlPath);
                                    // service层接口的保存路径
                                    put(OutputFile.service, servicePath);
                                    // service层接口实现类的保存路径
                                    put(OutputFile.serviceImpl, serviceImplPath);
                                    // 控制类的保存路径
                                    put(OutputFile.controller, controllerPath);
                                    // dto
                                }}
                        )
                )

                // 3. 策略配置【请仔细阅读每一行，根据项目实际项目需求，修改、增删！！！】
                .strategyConfig((scanner, builder) -> builder.addInclude(getTables(scanner.apply("请输入表名，多个英文逗号分隔？生成所有表，请输入[all]：")))
                        //设置过滤表前缀
                        .addTablePrefix("t_","m_")
                        // 阶段1：Entity实体类策略配置
                        .entityBuilder()
                        // 设置父类。会在生成的实体类名后：extends BaseEntity
                        // .superClass(BaseEntity.class)
                        // 禁用生成 serialVersionUID。（不推荐禁用）
//                         .disableSerialVersionUID()
                        // 开启生成字段常量。
                        // 会在实体类末尾生成一系列 [public static final String NICKNAME = "nickname";] 的语句。（一般在写wapper时，会用到）
                         .enableColumnConstant()
                        // 开启链式模型。
                        // 会在实体类前添加 [@Accessors(chain = true)] 注解。用法如 [User user=new User().setAge(31).setName("snzl");]（这是Lombok的注解，需要添加Lombok依赖）
//                         .enableChainModel()
                        // 开启 lombok 模型。
                        // 会在实体类前添加 [@Getter] 和 [@Setter] 注解。（这是Lombok的注解，需要添加Lombok依赖）
                         .enableLombok()
                        // 开启 Boolean 类型字段移除 is 前缀。
                        // .enableRemoveIsPrefix()
                        // 开启生成实体时生成字段注解。
                        // 会在实体类的属性前，添加[@TableField("nickname")]
                        .enableTableFieldAnnotation()
                        // 逻辑删除字段名(数据库)。
                        .logicDeleteColumnName("deleted")
                        // 逻辑删除属性名(实体)。
                        // 会在实体类的该字段属性前加注解[@TableLogic]
                        .logicDeletePropertyName("deleted")
                        // 数据库表映射到实体的命名策略(默认下划线转驼峰)。一般不用设置
                        // .naming(NamingStrategy.underline_to_camel)
                        // 数据库表字段映射到实体的命名策略(默认为 null，未指定按照 naming 执行)。一般不用设置
                        // .columnNaming(NamingStrategy.underline_to_camel)
                        // 添加父类公共字段。
                        // 这些字段不会出现在新增的实体类中。
                        .addSuperEntityColumns("create_time", "update_time","create_id","update_id")
                        // 添加忽略字段。
                        // 这些字段不会出现在新增的实体类中。
                        // .addIgnoreColumns("password")
                        // 添加表字段填充
                        // 会在实体类的该字段上追加注解[@TableField(value = "create_time", fill = FieldFill.INSERT)]
//                        .addTableFills(new Column("create_time", FieldFill.INSERT))
                        // 会在实体类的该字段上追加注解[@TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)]
//                        .addTableFills(new Column("update_time", FieldFill.INSERT_UPDATE))
                        // 全局主键类型。如果MySQL主键设置为自增，则不需要设置此项。
                        // .idType(IdType.AUTO)
                        // 格式化文件名称。
                        // 如果不设置，如表[sys_user]的实体类名是[SysUser]。设置成下面这样，将是[SysUserEntity]
                         .formatFileName("%sPO")
                        // 阶段2：Mapper策略配置
                        .mapperBuilder()
                        // 设置父类
                        // 会在mapper接口方法集成[extends BaseMapper<XXXEntity>]
                        // .superClass(BaseMapper.class)
                        // 开启 @Mapper 注解。
                        // 会在mapper接口上添加注解[@Mapper]
                        .enableMapperAnnotation()
                        // 启用 BaseResultMap 生成。
                        // 会在mapper.xml文件生成[通用查询映射结果]配置。
                        .enableBaseResultMap()
                        // 启用 BaseColumnList。
                        // 会在mapper.xml文件生成[通用查询结果列 ]配置
                        .enableBaseColumnList()
                        // 设置缓存实现类
                        // .cache(MyMapperCache.class)
                        // 格式化 mapper 文件名称。
                        // 如果不设置，如表[sys_user]，默认的文件名是[SysUserMapper]。写成下面这种形式后，将变成[SysUserDao]。
                        // .formatMapperFileName("%sDao")
                        // 格式化 xml 实现类文件名称。
                        // 如果不设置，如表[sys_user]，默认的文件名是[SysUserMapper.xml]，写成下面这种形式后，将变成[SysUserXml.xml]。
                        // .formatXmlFileName("%sXml")

                        // 阶段3：Service策略配置
                        // .serviceBuilder()
                        // 设置 service 接口父类
                        // .superServiceClass(BaseService.class)
                        // 设置 service 实现类父类
                        // .superServiceImplClass(BaseServiceImpl.class)
                        // 格式化 service 接口文件名称
                        // 如果不设置，如表[sys_user]，默认的是[ISysUserService]。写成下面这种形式后，将变成[SysUserService]。
                        // .formatServiceFileName("%sService")
                        // 格式化 service 实现类文件名称
                        // 如果不设置，如表[sys_user]，默认的是[SysUserServiceImpl]。
                        // .formatServiceImplFileName("%sServiceImpl")

                        // 阶段4：Controller策略配置
                        .controllerBuilder()
                        // 设置父类。
                        // 会集成此父类。
                        // .superClass(BaseController.class)
                        // 开启生成 @RestController 控制器
                        // 会在控制类中加[@RestController]注解。
                        .enableRestStyle()
                        // 开启驼峰转连字符
                        .enableHyphenStyle()
                        // 最后：构建
                        .build()
                )

                //模板引擎配置，默认 Velocity 可选模板引擎 Beetl 或 Freemarker
                //.templateEngine(new BeetlTemplateEngine())
                .templateEngine(new FreemarkerTemplateEngine())
                // 执行
                .execute();
    }

    /**
     * <p>
     * 处理 all 情况
     * </p>
     */
    protected static List<String> getTables(String tables) {
        return "all".equals(tables) ? Collections.emptyList() : Arrays.asList(tables.split(","));
    }

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    private static String scanner(int i ,String tip) {
        String z = null;
        if (i == 1) {
            System.out.println("是否输入模块名 y/n");
            Scanner sc = new Scanner(System.in);
            if (sc.hasNext()) {
                z = sc.next();
            }
        }
        if ("y".equals(z)||"Y".equals(z)) {
            Scanner scanner = new Scanner(System.in);
            StringBuilder help = new StringBuilder();
            help.append("请输入").append(tip).append("：");
            System.out.println(help.toString());
            if (scanner.hasNext()) {
                String ipt = scanner.next();
                if (StringUtils.isNotBlank(ipt)) {
                    return ipt;
                }
            }
            throw new MybatisPlusException("请输入正确的" + tip + "！");
        }else if ("n".equals(z)||"N".equals(z)) {
            return "";
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }
}

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * @author zhc
 */
@Configuration
public class NacosAutoConfiguration {

  @Bean
  public  CommandLineRunner nacosLogger (){
    return args -> {
      System.out.println("==== NACOS CLOUD loaded  ^ __ ^====");
    };
  }

}

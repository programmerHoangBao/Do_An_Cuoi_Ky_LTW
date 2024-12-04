package hcmute.edu.vn.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/templates/***")
        		.addResourceLocations("classpath:/templates/images/")
                .addResourceLocations("classpath:/templates/admin/css/")
                .addResourceLocations("classpath:/templates/admin/js/")
                .addResourceLocations("classpath:/templates/vendor/css/")
                .addResourceLocations("classpath:/templates/vender/js/")
                .addResourceLocations("classpath:/templates/user/css/")
                .addResourceLocations("classpath:/templates/user/js/");

    }
}


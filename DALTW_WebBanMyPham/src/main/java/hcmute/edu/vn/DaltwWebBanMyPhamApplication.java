package hcmute.edu.vn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import hcmute.edu.vn.config.CustomSiteMeshFilter;

@SpringBootApplication
public class DaltwWebBanMyPhamApplication {

	public static void main(String[] args) {
		SpringApplication.run(DaltwWebBanMyPhamApplication.class, args);
	}
	
	@Bean
	public FilterRegistrationBean<CustomSiteMeshFilter> siteMeshFilter(){
		FilterRegistrationBean<CustomSiteMeshFilter> filterRegistrationBean = new FilterRegistrationBean<>();
		filterRegistrationBean.setFilter(new CustomSiteMeshFilter());
		filterRegistrationBean.addUrlPatterns("/*");
		return filterRegistrationBean;
	}

}

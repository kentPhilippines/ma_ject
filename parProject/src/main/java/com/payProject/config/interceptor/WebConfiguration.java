package com.payProject.config.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.payProject.system.shiro.ShiroConfig;

/**
 * <p>目前这个类的作用是设置全局变量</p>
 * 
 * @author K
 * 2019-08-03
 *
 */
@Configuration
public class WebConfiguration implements WebMvcConfigurer{
	Logger log = LoggerFactory.getLogger(WebConfiguration.class);
	 	@Autowired
	    private MyInterceptor  inteceptor;
	    @Override
	    public void addInterceptors(InterceptorRegistry registry) {	    	
	    	log.info("--------------------->>加载自定义拦截器-----");
	       registry.addInterceptor(inteceptor);
	    }
	 
}
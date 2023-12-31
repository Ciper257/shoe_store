package com.poly.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	AuthInterceptor authInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
		.addPathPatterns("/admin.html/**", "/admin.html", "/account.html", "/categoryAdmin",
				"/report", "/productAdmin", "/history", "/orderDetail", "/revenue")
		.excludePathPatterns("/assets/**", "/login.html/**");
	}
	
	
}

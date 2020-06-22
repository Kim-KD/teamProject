package com.app.project.Common.Config;

import com.app.project.Common.Interceptor.Handler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * <javadoc>
 * 인터셉터 세팅
 * @author      김재일
 * @version     1.0
 * @since       2020-06-22
 **/
@Configuration
public class Interceptor implements WebMvcConfigurer {

    @Autowired
    private Handler handler;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(handler)
                .addPathPatterns("/*")
                .excludePathPatterns("/test")
                .excludePathPatterns("/login");
    }
}

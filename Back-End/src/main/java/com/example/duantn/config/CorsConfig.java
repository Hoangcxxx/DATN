package com.example.duantn.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class CorsConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")  // Cho phép CORS cho tất cả các đường dẫn bắt đầu bằng "/api"
                .allowedOrigins("http://localhost:8080")  // Cho phép truy cập từ domain này
                .allowedMethods("GET", "POST", "PUT", "DELETE")  // Cho phép các phương thức HTTP
                .allowedHeaders("*");  // Cho phép tất cả các header
    }
}

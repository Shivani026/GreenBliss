package com.greenbliss;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;

@Configuration
public class AppConfig {
    @Bean
    public MultipartResolver multipartResolver() {
        return new MultipartResolver() {
            @Override
            public boolean isMultipart(HttpServletRequest request) {
                return false;
            }

            @Override
            public MultipartHttpServletRequest resolveMultipart(HttpServletRequest request) throws MultipartException {
                return null;
            }

            @Override
            public void cleanupMultipart(MultipartHttpServletRequest request) {

            }
        };
    }
}

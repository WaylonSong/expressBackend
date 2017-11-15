package com.cpu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by song on 2017/7/10.
 */
@SpringBootApplication
@Configuration
@EnableAutoConfiguration
@ComponentScan
//@EnableRedisHttpSession
@Controller
@ServletComponentScan
public class Application {
    private final Logger logger = LoggerFactory.getLogger(Application.class);

    @RequestMapping("/")
    public String greeting() {
        return "index";
    }

    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
    }
    @Configuration
    public class WebMvcConfigurer extends WebMvcConfigurerAdapter {
//        public void addInterceptors(InterceptorRegistry registry) {
//            registry.addInterceptor(new HandlerInterceptorAdapter() {
//                @Override
//                public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
//                                         Object handler) throws Exception {
//                    if(request.getSession().getAttribute("user") == null){
//                        logger.info("用户没有登录！");
//                        response.sendRedirect("/user/login");
//                        return false;
//                    }
//                    return true;
//                }
//            }).addPathPatterns("/**").excludePathPatterns("/user/login");
//        }
    }
}

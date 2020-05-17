package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*@SpringBootApplication等价于@Configuration、@EnableAutoConfiguration、@ComponentScan,
查看SpringBootApplication注解可以发现@ComponentScan并没有添加任何的参数，
它会自动扫描工程里所有的@Component, @Service, @Repository, @Controller
并把它们注册为Spring Beans。*/
//Application类便是Spring Boot程序的入口
@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}

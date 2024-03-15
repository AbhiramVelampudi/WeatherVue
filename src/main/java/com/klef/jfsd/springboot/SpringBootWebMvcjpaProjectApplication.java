package com.klef.jfsd.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.klef.jfsd.springboot"})
public class SpringBootWebMvcjpaProjectApplication {

  public static void main(String[] args) {
    SpringApplication.run(SpringBootWebMvcjpaProjectApplication.class, args);
    System.out.println("Spring Boot Web MVC Demo with JPA...!!!");
  }

}
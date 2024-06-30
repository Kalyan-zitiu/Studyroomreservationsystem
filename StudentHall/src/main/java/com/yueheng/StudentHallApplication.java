package com.yueheng;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

import javax.sql.DataSource;

@SpringBootApplication
@ComponentScans({
        @ComponentScan("com.yueheng.studentHall.mapper"),
        @ComponentScan("com.yueheng.studentHall.controller"),
        @ComponentScan("com.yueheng.studentHall.config")
})public class StudentHallApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudentHallApplication.class, args);
    }

    @Bean
    public DataSource druidDataSource(){
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        druidDataSource.setUrl("jdbc:mysql://localhost:3306/study_hall?characterEncoding=utf-8");
        druidDataSource.setUsername("root");
        druidDataSource.setPassword("12345678");
        return druidDataSource;
    }
}

package com.example.demo;


import com.example.demo.dto.Administrator;
import com.example.demo.service.IAdministratorService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestAdministratorServiceImpl {

    @Autowired
    private IAdministratorService iAdS;
//
    @Test
    public void testFindOneByProp(){
        Map mapAdmin = new HashMap();

        System.out.println(iAdS.findByProp(mapAdmin));
    }

    @Test
    public void testFindOnByProp() {
        Map mapAdmin = new HashMap();
        mapAdmin.put("username", "201606110063");
        Administrator admin = iAdS.findOneByProp(mapAdmin);
        if (admin != null) {
            System.out.println(admin.toString());
        } else {
            System.out.println("Not Found!");
        }
    }


    @Test
    public void testAdd() {
        Administrator admin = new Administrator();
        admin.setRealname("托尼");
        admin.setUsername("201606110072");
        admin.setPassword("123");
        admin.setAddress("广东揭阳");
        admin.setPostcode("510000");
        admin.setEmail("ydllsy1431@outlook.com");
        admin.setPhone("16620094007");
//        admin.setRegdate(Date.valueOf("2018-12-12"));
        if (iAdS.add(admin)) {//写入数据库
            System.out.println("成功添加数据");
            System.out.println("添加用户：" + admin.toString());
        } else {
            System.out.println("添加失败!");
        }
    }

    @Test
    public void testUpdate() {
        Map adminMap = new HashMap();
        adminMap.put("id", "20181228210237014");
        Administrator admin = iAdS.findOneByProp(adminMap);
        if (admin != null) {
            System.out.println("原始数据：" + admin.toString());
            admin.setUsername("201606110072");
            admin.setAddress("广东揭阳");
            admin.setPassword("123");
            admin.setRegdate(Date.valueOf("2018-12-29"));
            if (iAdS.update(admin)) {//写入数据库
                System.out.println("成功：" + admin.toString());
            } else {
                System.out.println("yes!");
            }
        } else {
            System.out.println("no");
        }
    }

    @Test
    public void testDelete(){

        Administrator administrator = new Administrator();
        administrator.setId("20181212224809052");
        System.out.println("删除成功：" + iAdS.delete(administrator));
    }

}

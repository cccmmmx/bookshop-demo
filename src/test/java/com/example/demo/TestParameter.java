package com.example.demo;

import com.example.demo.dto.Parameter;
import com.example.demo.service.impl.ParameterServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestParameter {
    @Autowired
    ParameterServiceImpl per;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "20171106005730074");
        System.out.println(per.findByProp(c).size());
    }
    @Test
    public void testAdd() {
        Parameter c = new Parameter();
       c.setWebname("书城");
       c.setNotice("书城正式开业，感谢各位书友");
       c.setAddress("广东省广州市黄埔区");
        System.out.println(per.add(c));
    }
}

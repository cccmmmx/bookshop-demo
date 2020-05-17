package com.example.demo;

import com.example.demo.dto.Collection;
import com.example.demo.service.impl.CollectionServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCollection {
    @Autowired
    CollectionServiceImpl csd;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "20200411202940014");
Collection collection=csd.findOneByPropID("20200411202940014");
        System.out.println( collection.getRedate() instanceof Date);
    }
    @Test
    public void testAdd() {
        Collection c = new Collection();
         c.setCustomerID("20200403231011076");
         c.setGoodsID("20200322210120069");
         c.setAuthor("陆烨华");
         c.setName("春日之书");
         c.setImage("s33534795.jpg");
        System.out.println(csd.add(c));
    }
}

package com.example.demo;

import com.example.demo.dto.BookAddress;
import com.example.demo.service.impl.BookaddressServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestBookAddressImpl {
    @Autowired
    BookaddressServiceImpl bookaddress;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", 1);
//        bookaddress.findOneByPropID(1)
        System.out.println(bookaddress.findOneByPropID(1));
    }
    @Test
    public void testAdd() {
        BookAddress c = new BookAddress();
        c.setUserID("20200419225956046");
        c.setRealname("zzw");
        c.setProvince("广东省");
        c.setCity("广州市");
        c.setArea("天河区");
        c.setDetail("广东省广州市天河区黄埔大道广州商学院123");
        c.setPhone("13822695845");
        c.setIsdefault("2");
        System.out.println(bookaddress.add(c));
        System.out.println(c.getId());

    }

    @Test
    public void deteleAll(){
        System.out.println(bookaddress.delete(5));
    }
}

package com.example.demo;


import com.example.demo.dto.Seller;
import com.example.demo.service.impl.SellerServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestSellerServiceImpl {
    @Autowired
    private SellerServiceImpl csd;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "20");
        System.out.println(csd.findByProp(c).size());
    }
//    @Test
    public void testFindOneByProp() {
        Map c = new HashMap();
        c.put("id", "20170905152426024");
        Seller ca = csd.findOneByProp(c);
        if (ca != null) {
            System.out.println(ca.toString());
        } else {
            System.out.println("not found");
        }
    }
    @Test
    public void testAdd() {
        Seller c = new Seller();
        c.setRealname("黑白配");
        c.setUsername("白配");
        System.out.println(csd.add(c));
    }

    @Test
    public void testUpdate() {
        Map q = new HashMap();
        q.put("id", "20170905152426024");
        Seller c = csd.findOneByProp(q);
        System.out.println(c);
        c.setUsername("new白配");
        csd.update(c);
        System.out.println(c);
    }

//    @Test
//    public void testDE() {
//   Map c = new HashMap();
//        c.put("id", "102");
////        csd.delete(c);
//    }

}

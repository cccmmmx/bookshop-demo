package com.example.demo;


import com.example.demo.dto.Customer;
import com.example.demo.service.impl.CustomerServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCustomerServiceImpl {
    @Autowired
    private CustomerServiceImpl csi;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "20");
        System.out.println(csi.findByProp(c).size());
    }

    @Test
    public void testFindOneByProp() {
        Map c = new HashMap();
        c.put("id", "20170905152426024");
        Customer ca = csi.findOneByProp(c);
        if (ca != null) {
            System.out.println(ca.toString());
        } else {
            System.out.println("not found");
        }
    }
    @Test
    public void testAdd() {
        Customer c = new Customer();
        c.setRealname("黑白配");
        c.setUsername("白配");
        System.out.println(csi.add(c));
    }
    @Test
    public void testUpdate() {
        Map q = new HashMap();
        q.put("id", "20170905152426024");
        Customer c = csi.findOneByProp(q);
        System.out.println(c);
        c.setUsername("new白配");
        csi.update(c);
        System.out.println(c);
    }

}

package com.example.demo;

import com.example.demo.dto.Cart;
import com.example.demo.service.impl.CartServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCart {
    @Autowired
    private CartServiceImpl cai;
    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "");
        System.out.println(cai.findByProp(c));
    }
    @Test
    public void testAdd() {
        Cart c = new Cart();
       c.setCount(1);
       c.setPrice(12.00);
       c.setGoodsID("20200322204025095");
       c.setCustomerID("20171107141653058");
       c.setName("1918年之疫");
       c.setImage("s33578743.jpg");
      c.setStock(20);
        System.out.println(cai.add(c));
    }
}

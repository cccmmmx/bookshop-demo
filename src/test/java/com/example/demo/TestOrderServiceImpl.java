package com.example.demo;


import com.example.demo.dto.OrderItem;
import com.example.demo.service.impl.GoodsServiceImpl;
import com.example.demo.service.impl.OrderItemServiceImpl;
import com.example.demo.service.impl.TOrderServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestOrderServiceImpl {
    @Autowired
   private OrderItemServiceImpl ots;
    @Autowired
    private GoodsServiceImpl gis;
    @Autowired
    private TOrderServiceImpl itd;

    @Test
    public void testFindByProp() {
        Map c = new HashMap();
        c.put("id", "20200405165122002");
        System.out.println(ots.findOneByProp(c));
    }
    @Test
    public void testAdd() {
        Map cm=new HashMap();
        cm.put("id","20200322215932056");
        Map sm=new HashMap();
        sm.put("id",2);
        OrderItem goods=new OrderItem();
        goods.setGoodsID(gis.findOneByProp(cm));
        goods.setOrderID(itd.findOneByProp(sm));
//        goods.setId("20181208113354091");
      goods.setName("心");
//
    goods.setCount(6);
     goods.setPrice(7.8);
        System.out.println(ots.add(goods));
    }


}

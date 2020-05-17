package com.example.demo;

import com.example.demo.dto.TOrder;
import com.example.demo.service.impl.CustomerServiceImpl;
import com.example.demo.service.impl.TOrderServiceImpl;
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
public class TestTorderServiceImpl {

    @Autowired
   private TOrderServiceImpl itd;
    @Autowired
    private CustomerServiceImpl csi;

    @Test
    public void testFindByProp() {
        Date date = new Date();
//        long times = date.getTime();
//        System.out.println(itd.findOneByPropID(37).getOrderTime().getMonth()+1);

//        Map c = new HashMap();
//        c.put("id", "");
        System.out.println(itd.selectGoodsCount());
    }
    @Test
    public void testAdd() {
        Map cm=new HashMap();
        cm.put("id","20200416220537046");
        TOrder goods=new TOrder();
        goods.setCustomerID(csi.findOneByProp(cm));
        goods.setAddress("广东省黄埔区");
        goods.setPhone("12356");
        goods.setPostcode("5");
        goods.setRealname("拉丁");
        System.out.println(itd.add(goods));
        System.out.println(goods.getId());
    }
}

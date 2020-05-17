package com.example.demo.service.impl;

import com.example.demo.dao.IOrderitemDao;
import com.example.demo.dto.Cart;
import com.example.demo.dto.Goods;
import com.example.demo.dto.OrderItem;
import com.example.demo.dto.TOrder;
import com.example.demo.service.IOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class OrderItemServiceImpl implements IOrderItemService {

    @Autowired
    private IOrderitemDao iod;

//    @Override
//    public TOrder addOrderItemToTorder(TOrder tOrder, Goods goods) {
//        //用来标记有没有重复购物项
//        boolean isHave = false;
//        //1 将商品转换成订单项
//        OrderItem orderItem = goodsToOrderItem(goods);
//        //判断当前购物项是否重复，如果重复，则添加数量即可
//        for (OrderItem old : tOrder.getOrderItems()) {
////            如果重复，就增加对应订单项的数量
//            if (old.getGoodsID().getId().equals(orderItem.getGoodsID().getId())) {
//                //购物项有重复，添加数量即可
//                old.setCount(old.getCount() + orderItem.getCount());
//                isHave = true;
//                break;
//            }
//        }
//        //如果有重复，就略过，若无，则添加到订单的订单项中
//        if (!isHave) {
//            tOrder.getOrderItems().add(orderItem);
//        }
//        return tOrder;
//    }


    @Override
    public boolean createItemOrder(TOrder tOrder1, Goods goods, String customerid,int count) {
        OrderItem orderItem=new OrderItem();
        orderItem.setImage(goods.getImage());
        orderItem.setName(goods.getName());
        orderItem.setPrice(goods.getOriginalprice());
        orderItem.setCount(count);
        orderItem.setGoodsID(goods);
        orderItem.setOrderID(tOrder1);
        orderItem.setStatus("0");
        orderItem.setSellerID(goods.getSeller().getId());
        orderItem.setCustomerID(customerid);
       boolean isadd= iod.add(orderItem);
        return isadd;
    }

    @Override
    public List<OrderItem> findByProp(Map queryKVs) {
        return iod.findByProp(queryKVs);
    }

    @Override
    public boolean add(OrderItem orderItem) {
        return iod.add(orderItem);
    }

    @Override
    public OrderItem findOneByProp(Map qKV) {
        return iod.findOneByProp(qKV);
    }

    @Override
    public boolean update(OrderItem orderItem) {
        return iod.update(orderItem);
    }

    @Override
    public boolean delete(String id) {
        return iod.delete(id);
    }

    @Override
    public OrderItem findOneByPropID(String id) {
        return iod.findOneByPropID(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return iod.deleteAll(list);
    }

}


package com.example.demo.service;

import com.example.demo.dto.Goods;
import com.example.demo.dto.OrderItem;
import com.example.demo.dto.TOrder;

import java.util.List;
import java.util.Map;

public interface IOrderItemService {

 boolean createItemOrder(TOrder tOrder1, Goods goods, String customerid,int count);
    List<OrderItem> findByProp(Map queryKVs);

    boolean add(OrderItem orderItem);

    OrderItem findOneByProp(Map qKV);

    boolean update(OrderItem orderItem);

    boolean delete(String id);
    OrderItem findOneByPropID(String id);
    boolean deleteAll(List<String> list);
}

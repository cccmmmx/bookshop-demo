package com.example.demo.dao;

import com.example.demo.dto.OrderItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IOrderitemDao {

    List<OrderItem> findByProp(Map queryKVs);

    boolean add(OrderItem orderItem);

    OrderItem findOneByProp(Map qKV);

    boolean update(OrderItem orderItem);
    boolean delete(String id);
    OrderItem findOneByPropID(String id);
    boolean deleteAll(List<String> list);
}

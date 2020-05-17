package com.example.demo.dao;

import com.example.demo.dto.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ICartDao {
    List<Cart> findByProp(Map queryKVs);

    boolean add(Cart category);

    Cart findOneByProp(Map qKV);

    boolean update(Cart c);

    Cart findOneByPropID(String id);
    boolean delete(String id);

    boolean deleteAll(List<String> list);
}

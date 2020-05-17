package com.example.demo.service;

import com.example.demo.dto.Cart;

import java.util.List;
import java.util.Map;

public interface ICartService {
    List<Cart> findByProp(Map queryKVs);

    boolean add(Cart category);

    Cart findOneByProp(Map qKV);

    boolean update(Cart c);

    Cart findOneByPropID(String id);
    boolean delete(String id);

    boolean deleteAll(List<String> list);
}

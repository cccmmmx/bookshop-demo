package com.example.demo.service.impl;

import com.example.demo.dao.ICartDao;
import com.example.demo.dto.Cart;
import com.example.demo.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements ICartService{
    @Autowired
    private ICartDao icd;

    @Override
    public List<Cart> findByProp(Map queryKVs) {
        return icd.findByProp(queryKVs);
    }

    @Override
    public boolean add(Cart cart) {
        return icd.add(cart);
    }

    @Override
    public Cart findOneByProp(Map qKV) {
        return icd.findOneByProp(qKV);
    }

    @Override
    public boolean update(Cart c) {
        return icd.update(c);
    }

    @Override
    public Cart findOneByPropID(String id) {
        return icd.findOneByPropID(id);
    }

    @Override
    public boolean delete(String id) {
        return icd.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return icd.deleteAll(list);
    }
}

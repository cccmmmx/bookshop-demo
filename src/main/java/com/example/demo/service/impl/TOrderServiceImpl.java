package com.example.demo.service.impl;

import com.example.demo.dao.ITOrderDao;
import com.example.demo.dto.OrderMounts;
import com.example.demo.dto.TOrder;
import com.example.demo.service.ITorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class TOrderServiceImpl implements ITorderService {
    @Autowired
    private ITOrderDao itd;


    @Override
    public List<TOrder> findByProp(Map queryKVs) {
        return itd.findByProp(queryKVs);
    }

    @Override
    public int add(TOrder tOrder) {
        return itd.add(tOrder);
    }

    @Override
    public TOrder findOneByProp(Map qKV) {
        return itd.findOneByProp(qKV);
    }

    @Override
    public List<TOrder> selectGoodsCount() {
        return itd.selectGoodsCount();
    }

    @Override
    public List<TOrder> selectGoodsPrice() {
        return itd.selectGoodsPrice();
    }

    @Override
    public boolean update(TOrder t) {
        return itd.update(t);
    }

    @Override
    public TOrder findOneByPropID(int id) {
        return itd.findOneByPropID(id);
    }

    @Override
    public boolean delete(String id) {
        return itd.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return itd.deleteAll(list);
    }
}

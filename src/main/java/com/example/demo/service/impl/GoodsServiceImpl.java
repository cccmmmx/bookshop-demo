package com.example.demo.service.impl;

import com.example.demo.dao.IGoodsDao;
import com.example.demo.dto.Goods;
import com.example.demo.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements IGoodsService{
    @Autowired
    private IGoodsDao igs;
    @Override
    public List<Goods> findByProp(Map queryKVs) {
        return igs.findByProp(queryKVs);
    }

    @Override
    public List<Goods> finddataByProp() {
        return igs.finddataByProp();
    }

    @Override
    public List<Goods> findDealmount() {
        return igs.findDealmount();
    }

    @Override
    public boolean add(Goods goods) {
        return igs.add(goods);
    }

    @Override
    public Goods findOneByProp(Map qKV) {
        return igs.findOneByProp(qKV);
    }

    @Override
    public boolean update(Goods g) {
        return igs.update(g);
    }

    @Override
    public Goods get(String id) {
        return igs.findOneByPropID(id);
    }

    @Override
    public Goods findOneByPropID(String id) {
        return igs.findOneByPropID(id);
    }

    @Override
    public boolean delete(String id) {
        return igs.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return igs.deleteAll(list);
    }


}

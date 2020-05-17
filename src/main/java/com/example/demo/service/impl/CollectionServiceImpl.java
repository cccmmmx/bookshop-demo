package com.example.demo.service.impl;

import com.example.demo.dao.ICollectionDao;
import com.example.demo.dto.Collection;
import com.example.demo.dto.Goods;
import com.example.demo.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CollectionServiceImpl implements ICollectionService{
    @Autowired
    private ICollectionDao icd;
    @Autowired
    GoodsServiceImpl goodsService;

    @Override
    public List<Collection> findByProp(Map queryKVs) {
        return icd.findByProp(queryKVs);
    }

    @Override
    public boolean add(Collection collection) {
        return icd.add(collection);
    }

    @Override
    public Collection findOneByProp(Map qKV) {
        return icd.findOneByProp(qKV);
    }

    @Override
    public boolean update(Collection c) {
        return icd.update(c);
    }

    @Override
    public Collection findOneByPropID(String id) {
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

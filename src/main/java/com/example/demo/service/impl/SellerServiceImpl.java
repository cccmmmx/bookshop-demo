package com.example.demo.service.impl;

import com.example.demo.dao.ISellerDao;
import com.example.demo.dto.Seller;
import com.example.demo.service.ISellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.lang.String;
@Service
public class SellerServiceImpl implements ISellerService {
    @Autowired
    private ISellerDao dis;

    @Override
    public List<Seller> findByProp(Map queryKVs) {
        return dis.findByProp(queryKVs);
    }

    @Override
    public boolean add(Seller seller) {
        return dis.add(seller);
    }

    @Override
    public Seller findOneByProp(Map qKV) {
        return dis.findOneByProp(qKV);
    }

    @Override
    public boolean update(Seller c) {
        return dis.update(c);
    }

    @Override
    public Seller findOneByPropID(String id) {
        return dis.findOneByPropID(id);
    }

    @Override
    public Seller getByProp(Map prop) {
        return dis.getByProp(prop);
    }

    @Override
    public boolean delete(String id) {
      return   dis.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return dis.deleteAll(list);
    }



public boolean isExist(Map kv){
    return  dis.findOneByProp(kv)!=null?true:false;
}

    public Seller login(Map kv){
        return dis.findOneByProp(kv);
    }

}

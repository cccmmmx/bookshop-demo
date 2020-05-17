package com.example.demo.service;

import com.example.demo.dto.Seller;

import java.util.List;
import java.util.Map;
import java.lang.String;

public interface ISellerService {
    List<Seller> findByProp(Map queryKVs);

    boolean add(Seller category);

    Seller findOneByProp(Map qKV);

    boolean update(Seller c);
    Seller findOneByPropID(String id);
    Seller getByProp(Map porp);
    boolean delete(String id);
    boolean deleteAll(List<String> list);
}

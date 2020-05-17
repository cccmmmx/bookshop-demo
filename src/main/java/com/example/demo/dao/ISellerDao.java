package com.example.demo.dao;


import com.example.demo.dto.Seller;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.lang.String;
@Mapper
public interface ISellerDao {
    List<Seller> findByProp(Map queryKVs);

    boolean add(Seller seller);

    Seller findOneByProp(Map qKV);

    boolean update(Seller s);
    Seller findOneByPropID(String id);
    Seller getByProp(Map porp);

    boolean delete(String id);
    boolean deleteAll(List<String> list);

}

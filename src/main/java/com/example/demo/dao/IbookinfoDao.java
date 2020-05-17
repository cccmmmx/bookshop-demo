package com.example.demo.dao;

import com.example.demo.dto.Bookinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IbookinfoDao {
    List<Bookinfo> findByProp(Map queryKVs);
    boolean add(Bookinfo bookinfo);
//
   Bookinfo findOneByProp(Map qKV);
//
    boolean update(Bookinfo bookinfo);
    Bookinfo findOneByPropID(String id);
    boolean delete(String id);
}

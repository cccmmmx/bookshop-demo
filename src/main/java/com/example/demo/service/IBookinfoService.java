package com.example.demo.service;

import com.example.demo.dto.Bookinfo;

import java.util.List;
import java.util.Map;

public interface IBookinfoService {
    List<Bookinfo> findByProp(Map queryKVs);
    boolean add(Bookinfo bookinfo);
    //
    Bookinfo findOneByProp(Map qKV);
    //
    boolean update(Bookinfo bookinfo);
    Bookinfo findOneByPropID(String id);
    boolean delete(String id);
}

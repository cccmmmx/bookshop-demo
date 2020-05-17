package com.example.demo.service;

import com.example.demo.dto.Goods;

import java.util.List;
import java.util.Map;

public interface IGoodsService {
    List<Goods> findByProp(Map queryKVs);
    List<Goods>  finddataByProp();
    List<Goods>  findDealmount();
    boolean add(Goods goods);

    Goods findOneByProp(Map qKV);

    boolean update(Goods g);

    Goods get(String id);
    Goods findOneByPropID(String id);
    boolean delete(String id);
    boolean deleteAll(List<String> list);
}

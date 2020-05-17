package com.example.demo.dao;

import com.example.demo.dto.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface IGoodsDao  {

    List<Goods> findByProp(Map queryKVs);
    List<Goods>  finddataByProp();
    List<Goods>  findDealmount();
    boolean add(Goods goods);

    Goods findOneByProp(Map qKV);

    boolean update(Goods g);
    Goods findOneByPropID(String id);

boolean delete(String id);
    boolean deleteAll(List<String> list);
}

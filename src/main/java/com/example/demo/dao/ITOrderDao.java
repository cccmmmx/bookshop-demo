package com.example.demo.dao;

import com.example.demo.dto.TOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface ITOrderDao {
    List<TOrder> findByProp(Map queryKVs);

    int add(TOrder tOrder);

    TOrder findOneByProp(Map qKV);
    List<TOrder> selectGoodsCount();
    List<TOrder> selectGoodsPrice();

    boolean update(TOrder t);
    TOrder findOneByPropID(int id);
    boolean delete(String id);
    boolean deleteAll(List<String> list);
}

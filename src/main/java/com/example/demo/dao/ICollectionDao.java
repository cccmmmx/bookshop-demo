package com.example.demo.dao;

import com.example.demo.dto.Collection;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ICollectionDao {
    List<Collection> findByProp(Map queryKVs);

    boolean add(Collection collection);

    Collection findOneByProp(Map qKV);

    boolean update(Collection c);

    Collection findOneByPropID(String id);
    //     void deleteCategory(String id);
    boolean delete(String id);

    boolean deleteAll(List<String> list);
}

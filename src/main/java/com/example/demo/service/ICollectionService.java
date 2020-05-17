package com.example.demo.service;

import com.example.demo.dto.Collection;

import java.util.List;
import java.util.Map;

public interface ICollectionService {
    List<Collection> findByProp(Map queryKVs);

    boolean add(Collection collection);

    Collection findOneByProp(Map qKV);

    boolean update(Collection c);

    Collection findOneByPropID(String id);
    //     void deleteCategory(String id);
    boolean delete(String id);

    boolean deleteAll(List<String> list);
}

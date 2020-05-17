package com.example.demo.dao;



import com.example.demo.dto.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.lang.String;

@Mapper
public interface ICategoryDao {

    List<Category> findByProp(Map queryKVs);

    boolean add(Category category);

    Category findOneByProp(Map qKV);

    boolean update(Category c);

    Category findOneByPropID(String id);
//     void deleteCategory(String id);
boolean delete(String id);

boolean deleteAll(List<String> list);
}

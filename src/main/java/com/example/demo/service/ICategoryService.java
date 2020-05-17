package com.example.demo.service;

import com.example.demo.dto.Category;

import java.util.List;
import java.util.Map;

public interface ICategoryService {

        List<Category> findByProp(Map queryKVs);

        boolean add(Category category);

        Category findOneByProp(Map qKV);

        boolean update(Category c);
        Category findOneByPropID(String id);
//        void deleteCategory(String id);
        boolean delete(String id);
        boolean deleteAll(List<String> list);
}


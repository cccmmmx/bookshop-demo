package com.example.demo.service.impl;

import com.example.demo.dao.ICategoryDao;
import com.example.demo.dto.Category;
import com.example.demo.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements ICategoryService  {
    @Autowired
    private ICategoryDao icd;

    @Override
    public List<Category> findByProp(Map queryKVs) {
        return icd.findByProp(queryKVs);
    }

    @Override
    public boolean add(Category category) {
        return icd.add(category);
    }

    @Override
    public Category findOneByProp(Map qKV) {
        return icd.findOneByProp(qKV);
    }

    @Override
    public boolean update(Category c) {
        return icd.update(c);
    }

    @Override
    public Category findOneByPropID(String id) {
        return icd.findOneByPropID(id);
    }

    @Override
    public boolean delete(String id) {
        return icd.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return icd.deleteAll(list);
    }

//    @Override
//    public void deleteCategory(String id) {
//icd.deleteCategory(id);
//    }


}

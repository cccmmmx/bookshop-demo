package com.example.demo.service.impl;

import com.example.demo.dao.IBookaddressDao;
import com.example.demo.dto.BookAddress;
import com.example.demo.service.IBookaddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookaddressServiceImpl implements IBookaddressService{
    @Autowired
    private IBookaddressDao iBookaddress;

    @Override
    public List<BookAddress> findByProp(Map queryKVs) {
        return iBookaddress.findByProp(queryKVs);
    }

    @Override
    public boolean add(BookAddress bookAddress) {
        return iBookaddress.add(bookAddress);
    }

    @Override
    public BookAddress findOneByProp(Map qKV) {
        return iBookaddress.findOneByProp(qKV);
    }

    @Override
    public boolean update(BookAddress c) {
        return iBookaddress.update(c);
    }

    @Override
    public BookAddress findOneByPropID(Integer id) {
        return iBookaddress.findOneByPropID(id);
    }


    @Override
    public boolean delete(int id) {
        return iBookaddress.delete(id);
    }

    @Override
    public boolean deleteAll(List<String> list) {
        return iBookaddress.deleteAll(list);
    }
}

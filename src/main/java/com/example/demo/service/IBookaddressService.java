package com.example.demo.service;

import com.example.demo.dto.BookAddress;

import java.util.List;
import java.util.Map;

public interface IBookaddressService {
    List<BookAddress> findByProp(Map queryKVs);

    boolean add(BookAddress bookAddress);

    BookAddress findOneByProp(Map qKV);

    boolean update(BookAddress c);

    BookAddress findOneByPropID(Integer id);
    boolean delete(int id);

    boolean deleteAll(List<String> list);
}

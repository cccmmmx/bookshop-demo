package com.example.demo.dao;

import com.example.demo.dto.BookAddress;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IBookaddressDao {
    List<BookAddress> findByProp(Map queryKVs);

    boolean add(BookAddress bookAddress);

    BookAddress findOneByProp(Map qKV);

    boolean update(BookAddress c);

    BookAddress findOneByPropID(Integer id);
    boolean delete(int id);

    boolean deleteAll(List<String> list);
}

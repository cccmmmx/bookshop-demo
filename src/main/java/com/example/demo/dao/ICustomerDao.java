package com.example.demo.dao;


import com.example.demo.dto.Customer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ICustomerDao {
    List<Customer> findByProp(Map queryKVs);

    boolean add(Customer category);

    Customer findOneByProp(Map qKV);

    boolean update(Customer c);
    Customer findOneByPropID(String id);
    boolean delete(String id);
    boolean deleteAll(List<String> list);
}

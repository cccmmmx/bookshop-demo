package com.example.demo.service;

import com.example.demo.dto.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findByProp(Map queryKVs);

    boolean add(Customer category);

    Customer findOneByProp(Map qKV);

    boolean update(Customer c);
    Customer findOneByPropID(String id);
    boolean delete(String id);
    boolean deleteAll(List<String> list);
}

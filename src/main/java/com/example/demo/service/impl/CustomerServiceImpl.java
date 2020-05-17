package com.example.demo.service.impl;

import com.example.demo.dao.ICustomerDao;
import com.example.demo.dto.Customer;
import com.example.demo.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private ICustomerDao icd;

    @Override
    public List<Customer> findByProp(Map queryKVs) {
        return icd.findByProp(queryKVs);
    }

    @Override
    public boolean add(Customer customer) {
        return icd.add(customer);
    }

    @Override
    public Customer findOneByProp(Map qKV) {
        return icd.findOneByProp(qKV);
    }

    @Override
    public boolean update(Customer c) {
        return icd.update(c);
    }

    @Override
    public Customer findOneByPropID(String id) {
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

    public boolean isExist(Map kv){
        return  icd.findOneByProp(kv)!=null?true:false;
    }

    public Customer login(Map kv){
        return icd.findOneByProp(kv);
    }
}

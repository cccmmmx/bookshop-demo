package com.example.demo.service.impl;


import com.example.demo.dao.IAdministratorDao;
import com.example.demo.dto.Administrator;
import com.example.demo.service.IAdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdministratorServiceImpl implements IAdministratorService {

    @Autowired
    private IAdministratorDao iad;


    @Override
    public List<Administrator> findByProp(Map queryKVs) {
        return iad.findByProp(queryKVs);
    }

    @Override
    public Administrator findOneByProp(Map Key) {
        return iad.findOneByProp(Key);
    }

    @Override
    public boolean add(Administrator admin) {
        return iad.add(admin);
    }

    @Override
    public boolean update(Administrator admin) {
        return iad.update(admin);
    }

    @Override
    public Administrator findByAdminID(String adminID) {
        return iad.findByAdminID(adminID);
    }

    @Override
    public Administrator login(Map key) {
        return iad.findOneByProp(key);
    }

    @Override
    public Administrator getUserPass(String username, String password) {
        return iad.getUserPass(username,password);
    }

    @Override
    public boolean delete(Administrator key) {
        return iad.delete(key);
    }
}

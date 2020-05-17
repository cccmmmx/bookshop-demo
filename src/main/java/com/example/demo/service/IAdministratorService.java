package com.example.demo.service;


import com.example.demo.dto.Administrator;

import java.util.List;
import java.util.Map;

public interface IAdministratorService {
    List<Administrator> findByProp(Map queryKVs);

    Administrator findOneByProp(Map Key);

    boolean add(Administrator admin);

    boolean update(Administrator admin);

    Administrator findByAdminID(String adminID);

    Administrator login(Map key);

    Administrator getUserPass(String username, String password);

    boolean delete(Administrator key);

}

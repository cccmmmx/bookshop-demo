package com.example.demo.service.impl;

import com.example.demo.dao.IParameterDao;
import com.example.demo.dto.Parameter;
import com.example.demo.service.IParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ParameterServiceImpl implements IParameterService {
    @Autowired
    private IParameterDao per;

    @Override
    public List<Parameter> findByProp(Map queryKVs) {
        return per.findByProp(queryKVs);
    }

    @Override
    public boolean add(Parameter parameter) {
        return per.add(parameter);
    }

    @Override
    public Parameter findOneByProp(Map qKV) {
        return per.findOneByProp(qKV);
    }

    @Override
    public boolean update(Parameter c) {
        return per.update(c);
    }
}

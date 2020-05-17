package com.example.demo.service;

import com.example.demo.dto.Parameter;

import java.util.List;
import java.util.Map;

public interface IParameterService {
    List<Parameter> findByProp(Map queryKVs);

    boolean add(Parameter parameter);

    Parameter findOneByProp(Map qKV);

    boolean update(Parameter c);

}

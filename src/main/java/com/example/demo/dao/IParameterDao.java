package com.example.demo.dao;

import com.example.demo.dto.Parameter;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface IParameterDao {
    List<Parameter> findByProp(Map queryKVs);

    boolean add(Parameter parameter);

    Parameter findOneByProp(Map qKV);

    boolean update(Parameter c);

}

package com.example.demo.service.impl;

import com.example.demo.dao.IbookinfoDao;
import com.example.demo.dto.Bookinfo;
import com.example.demo.service.IBookinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookinfoServiceImpl implements IBookinfoService {
    @Autowired
    private IbookinfoDao ibookinfoDao;

    @Override
    public List<Bookinfo> findByProp(Map queryKVs) {
        return ibookinfoDao.findByProp(queryKVs);
    }

    @Override
    public boolean add(Bookinfo bookinfo) {
        return ibookinfoDao.add(bookinfo);
    }

    @Override
    public Bookinfo findOneByProp(Map qKV) {
        return ibookinfoDao.findOneByProp(qKV);
    }

    @Override
    public boolean update(Bookinfo bookinfo) {
        return ibookinfoDao.update(bookinfo);
    }

    @Override
    public Bookinfo findOneByPropID(String id) {
        return ibookinfoDao.findOneByPropID(id);
    }

    @Override
    public boolean delete(String id) {
        return ibookinfoDao.delete(id);
    }
}

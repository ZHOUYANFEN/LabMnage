package com.bysj.cqjtu.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.aa10Mapper;
import com.bysj.cqjtu.manager.service.Aa10Service;
@Service
public class Aa10ServiceImpl implements Aa10Service {
    
    @Autowired
    private aa10Mapper aa10Mapper;
    @Override
    public List<Map> queryCsy042() throws Exception {
        return aa10Mapper.queryCsy042();
    }
    @Override
    public List<Map> queryCsy043(String aaa105) throws Exception {
        return aa10Mapper.queryCsy043(aaa105);
    }

}

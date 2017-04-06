package com.bysj.cqjtu.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.service.StatisticService;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy07Mapper;

@Service
public class StatisticServiceImpl implements StatisticService {
    
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Sy07Mapper sy07Mapper;
    @Override
    public List<Map> coursestatistics() throws Exception {
        return sy06Mapper.coursestatistics();
    }
    @Override
    public List<Map> gradestatistics() throws Exception {
        return sy07Mapper.gradestatistics();
    }

}

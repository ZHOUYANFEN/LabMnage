package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
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
    @Override
    public List<Map> courselist(String csy052) throws Exception {
        return sy06Mapper.courselist(csy052);
    }
    @Override
    public List<Map> classGradestatistics() throws Exception {
        return sy07Mapper.classGradestatistics();
    }
    @Override
    public List<Map> classpeopleGradestatistics(String csy043, String csy060) {
        Map map=new HashMap();
        map.put("csy043", csy043);
        map.put("csy060", csy060);
        return sy07Mapper.classpeopleGradestatistics(map);
    }

}

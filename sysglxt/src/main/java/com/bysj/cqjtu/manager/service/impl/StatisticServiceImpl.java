package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.dao.Sy11Mapper;
import com.bysj.cqjtu.manager.dao.Sy12Mapper;
import com.bysj.cqjtu.manager.service.StatisticService;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy07Mapper;
import com.bysj.cqjtu.student.dao.Sy08Mapper;

@Service
public class StatisticServiceImpl implements StatisticService {
    
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Sy07Mapper sy07Mapper;
    @Autowired
    private Sy08Mapper sy08Mapper;
    @Autowired
    private Sy11Mapper sy11Mapper;
    @Autowired
    private Sy12Mapper sy12Mapper;
    @Override
    @SystemServiceLog(description="课程统计")
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
    public List<Map> classpeopleGradestatistics(String csy043, String csy060) throws Exception {
        Map map=new HashMap();
        map.put("csy043", csy043);
        map.put("csy060", csy060);
        return sy07Mapper.classpeopleGradestatistics(map);
    }
    @Override
    public List<Map> expArrangeStatistics() throws Exception {
        return sy08Mapper.expArrangeStatistics();
    }
    @Override
    public List<Map> expListStatistics(String csy052) throws Exception {
        return sy08Mapper.expListStatistics(csy052);
    }
    @Override
    public List<Map> labStatistics() throws Exception {
        return sy11Mapper.labStatistics();
    }
    @Override
    public List<Map> labList(String csy100) throws Exception {
        Map map=new HashMap();
        map.put("csy100", csy100);
        return sy11Mapper.queryLabList(map); 
    }
    @Override
    public List<Map> labArrangeStatistics() throws Exception {
        return sy12Mapper.labArrangeStatistics();
    }
    @Override
    public List<Map> labArrangeListStatistics(String csy010) throws Exception {
        Map map=new HashMap();
        map.put("csy010", csy010);
        return sy12Mapper.labArrangeListStatistics(map);
    }

}

package com.bysj.cqjtu.student.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.constance.StudentOperateConstance;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy07Mapper;
import com.bysj.cqjtu.student.dao.Sy08Mapper;
import com.bysj.cqjtu.student.dao.Sy09Mapper;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Sy08Mapper sy08Mapper;
    @Autowired
    private Sy09Mapper sy09Mapper;
    @Autowired
    private Sy07Mapper sy07Mapper;
    
    @Override
    public List<Map> getSyllabus(UserMessage userMessage) throws Exception {
        return sy06Mapper.getSyllabus(userMessage); 
    }

    @Override
    public List<Map> queryExpArrange(UserMessage userMessage) {
        return sy08Mapper.queryExpArrange(userMessage);
    }

    @Override
    public List<Sy08> queryExpArrangeList(Sy08 sy08)
            throws Exception {
        return sy08Mapper.queryExpArrangeList(sy08);
    }

    @Override
    public List<Map> queryExpArrangeContent(Sy08 sy08) throws Exception {
        
        return sy08Mapper.queryExpArrangeContent(sy08);
    }

    @Override
    public Map saveExp(Sy09 sy09) throws Exception {
        sy09.setCsy095(Byte.parseByte("0"));
        int i=sy09Mapper.saveExp(sy09);
        Map map=new HashMap();
        if(i!=1){
            map.put("statu", StudentOperateConstance.SAVE_SY09_FAIL);
        } else{
            map.put("statu", StudentOperateConstance.SAVE_SY09_SUCCESS);
        }
        return map;
    }

    @Override
    public List<Map> queryGrade(Sy07 sy07) throws Exception {
       return sy07Mapper.queryGrade(sy07);
    }

}

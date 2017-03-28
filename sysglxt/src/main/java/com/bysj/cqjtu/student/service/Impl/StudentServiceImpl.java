package com.bysj.cqjtu.student.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy08Mapper;
import com.bysj.cqjtu.student.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Sy08Mapper sy08Mapper;
    
    @Override
    public List<Map> getSyllabus(UserMessage userMessage) throws Exception {
        return sy06Mapper.getSyllabus(userMessage); 
    }

    @Override
    public List<Map> queryExpArrange(UserMessage userMessage) {
        return sy08Mapper.queryExpArrange(userMessage);
    }

}

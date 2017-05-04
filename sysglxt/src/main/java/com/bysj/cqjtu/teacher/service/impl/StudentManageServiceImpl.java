package com.bysj.cqjtu.teacher.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Aa10Mapper;
import com.bysj.cqjtu.manager.dao.Sy04Mapper;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.teacher.service.StudentManageService;
@Service
public class StudentManageServiceImpl implements StudentManageService {
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Aa10Mapper aa10Mapper;
    @Autowired
    private Sy04Mapper sy04Mapper;
    @Override
    public List<Map> queryCourse(Sy05 sy05) throws Exception {
       return sy06Mapper.queryCourse(sy05);
    }
    @Override
    public List<Map> queryCollege() throws Exception {
        return aa10Mapper.queryCsy042();
    }
    @Override
    public List<Map> queryClass(String aaa105) throws Exception {
        return aa10Mapper.queryCsy043(aaa105);
    }
    @Override
    public List<Sy04> queryStudentList(String csy043) throws Exception {
        return sy04Mapper.queryStudentList(csy043);
    }
    @Override
    public List<Sy04> queryStudentListByCourse(String csy060) throws Exception {
        return sy04Mapper.queryStudentListByCourse(csy060);
    }

}

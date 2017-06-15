package com.bysj.cqjtu.teacher.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.domain.ConditionSearch;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.service.CourseManageService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;

@Service
public class CourseManageServiceImpl implements CourseManageService {

    @Autowired Sy06Mapper sy06Mapper;
    @Override
    public Integer getCourseCount(Sy05 sy05) throws Exception {
        return sy06Mapper.queryCourse(sy05).size();
    }
    @Override
    public PageEntity<Map> getCourse(Sy05 sy05, Integer pageNum, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        PageEntity<Map> pageBean = new PageEntity<Map>();
        List<Map> allList = sy06Mapper.queryCourse(sy05);          
        pageBean.setList(allList);
        int size = sy06Mapper.queryCourse(sy05).size();
        pageBean.setCount(size);
        return pageBean;
    }
    @Override
    public PageEntity<Map> getCourseByCondition(Sy05 sy05, String csy061,
            Integer pageNum, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        PageEntity<Map> pageBean = new PageEntity<Map>();
        ConditionSearch conditionSearch=new ConditionSearch(sy05, csy061);
        List<Map> allList = sy06Mapper.getCourseByCondition(conditionSearch);          
        pageBean.setList(allList);
        int size =  sy06Mapper.getCourseByCondition(conditionSearch).size();
        pageBean.setCount(size);
        return pageBean;
    }
    @Override
    public Integer getCourseCountByCondition(Sy05 sy05, String csy061)
            throws Exception {
        return sy06Mapper.getCourseByCondition(new ConditionSearch(sy05, csy061)).size();
    }
    @Override
    public Map addCourse(Sy06 sy06) throws Exception {
        sy06.setCsy065("1");
        sy06.setCsy067(0);
        int i=sy06Mapper.addCourse(sy06);      
        Map map=new HashMap();
        if(i==1){
            map.put("statu", TeacherConstance.INSERT_INTOSY06_SUCCESS);
            return map;
        }else{
            throw new RuntimeException(TeacherConstance.INSERT_INTOSY06_ERROR);
        }
    }
    @Override
    public Map validateCourse(Sy06 sy06) throws Exception {
        List<Map> list=sy06Mapper.validateCourse(sy06);
        Map map=new HashMap();
        if(list.size()>0){
            map.put("statu", TeacherConstance.VALIDATE_INTOSY06_ERROR);
        }else{
            map.put("statu", TeacherConstance.VALIDATE_INTOSY06_SUCCESS);
        }
        return map;
    }

}

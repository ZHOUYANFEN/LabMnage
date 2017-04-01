package com.bysj.cqjtu.student.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.domain.Sy04;
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
    public List<Map> queryExpArrange(Sy04 sy04) {
        return sy08Mapper.queryExpArrange(sy04);
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
        Map map=new HashMap();
        sy09.setCsy095(Byte.parseByte("0"));
      //查询是否已经提交过报告
        List<Sy09> sy09List=sy09Mapper.isExist(sy09);
        if(sy09List.size()>0){
         int i=sy09Mapper.updateExp(sy09);
         if(i!=1){
             map.put("statu", StudentOperateConstance.SAVE_SY09_FAIL);
         } else{
             map.put("statu", StudentOperateConstance.SAVE_SY09_SUCCESS);
         }
        }else{
            int i=sy09Mapper.saveExp(sy09);
            map.put("statu", StudentOperateConstance.SAVE_SY09_SUCCESS);
        }
        return map;
    }

    @Override
    public List<Map> queryGrade(Sy07 sy07) throws Exception {
       return sy07Mapper.queryGrade(sy07);
    }

    @Override
    public List<Map> queryExpList(Sy04 sy04) throws Exception {
        return sy08Mapper.queryExpList(sy04);
    }

    @Override
    public Map saveReport(Sy09 sy09) {
        Map map=new HashMap();
        sy09.setCsy095(new Byte((byte) 0));
        //查询是否已经提交过报告
         List<Sy09> sy09List=sy09Mapper.isExist(sy09);
         if(sy09List.size()>0){
             int i=sy09Mapper.updateReport(sy09);
             if(i!=1){
                 map.put("statu", StudentOperateConstance.SAVE_SY09_FAIL);
             }else{
                 map.put("statu", StudentOperateConstance.SAVE_SY09_SUCCESS);
             }
         }else{
             sy09Mapper.saveReport(sy09);            
             map.put("statu", StudentOperateConstance.SAVE_SY09_SUCCESS);
         }
         return map;
    }

    @Override
    public List<Map> queryGradeDetai(Sy07 sy07) throws Exception {
   
        return sy07Mapper.queryGradeDetai(sy07);
    }



}

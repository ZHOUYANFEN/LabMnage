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
import com.bysj.cqjtu.student.dao.Sy13Mapper;
import com.bysj.cqjtu.student.dao.Sy16Mapper;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.student.service.StudentService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;

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
    @Autowired
    private Sy13Mapper sy13Mapper;
    @Autowired
    private Sy16Mapper sy16Mapper;
    @Override
    public  PageEntity<Map> querySyllabus(UserMessage userMessage,Integer pageNum,Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Map> allList =sy06Mapper.getSyllabus(userMessage);
        PageEntity<Map> pageBean = new PageEntity<Map>();
        pageBean.setList(allList);
        int size =sy06Mapper.getSyllabus(userMessage).size();
        pageBean.setCount(size);
        return pageBean;
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
                 throw new RuntimeException(StudentOperateConstance.SAVE_SY09_FAIL);
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
    public  PageEntity<Map> queryGrade(Sy07 sy07,Integer pageNum,Integer pageSize) throws Exception {
       PageHelper.startPage(pageNum, pageSize);
       List<Map> allList =sy07Mapper.queryGrade(sy07);
       PageEntity<Map> pageBean = new PageEntity<Map>();
       pageBean.setList(allList);
       int size =sy07Mapper.queryGrade(sy07).size();
       pageBean.setCount(size);
       return pageBean;
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
                 throw new RuntimeException(StudentOperateConstance.SAVE_SY09_FAIL);
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

    @Override
    public List<Map> queryResourceType() throws Exception {
        return sy16Mapper.queryResourceType();
    }

    @Override
    public List<Map> queryResourceList(String csy160) throws Exception {
        Sy13 sy13 =new Sy13();
        sy13.setCsy160(Integer.parseInt(csy160));
        return sy13Mapper.queryResourceList(sy13);
    }

    @Override
    public Sy13 queryResourceDetail(Sy13 sy13) throws Exception {
        return sy13Mapper.queryResourceDetail(sy13);
    }

    @Override
    public int getCount(Sy07 sy07) throws Exception {
        return sy07Mapper.queryGrade(sy07).size();
    }

    @Override
    public int querySyllabusCount(UserMessage userMessage) throws Exception {
        return sy06Mapper.getSyllabus(userMessage).size();
    }



}

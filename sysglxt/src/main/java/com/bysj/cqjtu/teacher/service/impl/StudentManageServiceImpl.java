package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Aa10Mapper;
import com.bysj.cqjtu.manager.dao.Sy04Mapper;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy07Mapper;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.service.StudentManageService;
@Service
public class StudentManageServiceImpl implements StudentManageService {
    @Autowired
    private Sy06Mapper sy06Mapper;
    @Autowired
    private Aa10Mapper aa10Mapper;
    @Autowired
    private Sy04Mapper sy04Mapper;
    @Autowired
    private Sy07Mapper sy07Mapper;
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
    @Override
    public Map deleteStudent(Sy07 sy07) throws Exception {
        int i =sy07Mapper.deleteStudent(sy07);
        if(i!=1){
            throw new RuntimeException("删除出错");
        }else {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.DELETE_STUDENT_INCOURCE_SUCCESS);
            return map;
        }
    }
    @Override
    public Map addStudentToCourse(String ids, String csy060) throws Exception {
        String []csy040s= ids.split(",");
        Sy07 sy07;
        int count=0;
        for (String csy040 : csy040s) {
            sy07=new Sy07();
            sy07.setCsy040(csy040);
            sy07.setCsy060(csy060);
            sy07.setCsy071(0);
            int i =sy07Mapper.addStudentToCourse(sy07);
            if(i==1){
                count++;
            }
        }
        if(count!=csy040s.length){
            throw new RuntimeException("添加失败");
        }else {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.ADD_STUDENT_INCOURCE_SUCCESS);
            return map;
        }
    }
    @Override
    public Map validateStudentInCource(String ids, String csy060)
            throws Exception {
        String []csy040s= ids.split(",");
        Sy07 sy07;
        Sy07 validateSy07;
        List successList=new ArrayList();
        List failList=new ArrayList();
        for (String csy040 : csy040s) {
            sy07=new Sy07();
            sy07.setCsy040(csy040);
            sy07.setCsy060(csy060);
            sy07.setCsy071(0);
            validateSy07 =sy07Mapper.validateStudentInCource(sy07);
            if(validateSy07==null){
                successList.add(csy040);
            }else {
                failList.add(csy040);
            }
        }
        Map map=new HashMap();
        map.put("successList", successList);
        map.put("failList", failList);
        return map;
    }
    @Override
    public Map deleteStudentInCourseBatch(String ids, String csy060)
            throws Exception {
        String []csy040s= ids.split(",");
        Sy07 sy07;
        int count=0;
        for (String csy040 : csy040s) {
            sy07=new Sy07();
            sy07.setCsy040(csy040);
            sy07.setCsy060(csy060);
            int i =sy07Mapper.deleteStudent(sy07);
            if(i==1){
                count++;
            }
        }
        if(count!=csy040s.length){
            throw new RuntimeException("删除失败");
        }else {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.DELETE_STUDENT_INCOURCE_SUCCESS);
            return map;
        }
    }

}

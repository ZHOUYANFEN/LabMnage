package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy06;

public interface Sy06Mapper {
    int deleteByPrimaryKey(Integer csy060);

    int insert(Sy06 record);

    int insertSelective(Sy06 record);

    Sy06 selectByPrimaryKey(Integer csy060);

    int updateByPrimaryKeySelective(Sy06 record);

    int updateByPrimaryKey(Sy06 record);
    /**
     * 获取课程表
     * @param userMessage
     * @return
     */
    List<Map> getSyllabus(UserMessage userMessage);
    /**
     * 统计课程
     * @return
     */
    List<Map> coursestatistics();
    
    /**
     * 查询各个学院的课程安排
     * @param csy052
     * @return
     */
    List<Map> courselist(String csy052);
    /**
     * 获取自己的所有课程
     * @param sy05
     * @return
     */
    List<Map> queryCourse(Sy05 sy05);
    
    /**
     * 根据课程名查询课程id
     * @param csy061
     * @return
     */
    Sy06 queryClassByName(String csy061);
}
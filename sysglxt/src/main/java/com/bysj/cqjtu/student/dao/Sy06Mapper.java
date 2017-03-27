package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

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
}
package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy08;

public interface Sy08Mapper {
    int deleteByPrimaryKey(Integer csy080);

    int insert(Sy08 record);

    int insertSelective(Sy08 record);

    Sy08 selectByPrimaryKey(Integer csy080);

    int updateByPrimaryKeySelective(Sy08 record);

    int updateByPrimaryKey(Sy08 record);
    
    /**
     * 查询实验安排
     * @param userMessage
     * @return
     */
    List<Map> queryExpArrange(UserMessage userMessage);
    
    /**
     * 获取实验安排列表
     * @param userMessage
     * @return
     */
    List<Sy08> queryExpArrangeList(Sy08 sy08);
    /**
     * 获取实验内容
     * @param sy08
     * @return
     */
    List<Map> queryExpArrangeContent(Sy08 sy08);
    
    
}
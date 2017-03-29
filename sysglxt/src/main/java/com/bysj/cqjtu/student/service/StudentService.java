package com.bysj.cqjtu.student.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;

/**
 * 学生Service
 * @author fuzhengjun
 *2017年3月27日下午9:56:32
 *
 */
public interface StudentService {
    
    /**
     * 获取课程表
     * @param userMessage
     * @return
     * @throws Exception
     */
    public List<Map> getSyllabus(UserMessage userMessage) throws Exception;
    /**
     * 获取实验安排
     * @param userMessage
     * @return
     */
    public List<Map> queryExpArrange(UserMessage userMessage)throws Exception;
    /**
     * 获取具体实验安排的列表
     * @param userMessage
     * @return
     * @throws Exception
     */
    public List<Sy08> queryExpArrangeList(Sy08 sy08)throws Exception;
    /**
     * 获取实验内容
     * @param sy08
     * @return
     * @throws Exception
     */
    public List<Map> queryExpArrangeContent(Sy08 sy08) throws Exception;
    /**
     * 保存实验完成内容
     * @param sy09
     * @return
     * @throws Exception
     */
    public Map saveExp(Sy09 sy09)throws Exception;
    /**
     * 查询成绩
     * @param sy04
     * @return
     * @throws Exception
     */
    public List<Map> queryGrade(Sy07 sy07)throws Exception;
}

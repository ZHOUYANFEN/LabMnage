package com.bysj.cqjtu.student.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.pojo.UserMessage;

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
    public List<Map> queryExpArrange(UserMessage userMessage);
}

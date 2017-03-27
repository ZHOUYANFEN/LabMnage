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
    
    public List<Map> getSyllabus(UserMessage userMessage) throws Exception;
}

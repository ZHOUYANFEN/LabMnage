package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

/**
 * 统计service
 * @author fuzhengjun
 *2017年4月6日下午4:09:06
 *
 */
public interface StatisticService {
    /**
     * 实验课程统计
     * @return
     * @throws Exception
     */
    public List<Map> coursestatistics() throws Exception;
    /**
     * 成绩统计
     * @return
     * @throws Exception
     */
    public List<Map> gradestatistics() throws Exception;
}

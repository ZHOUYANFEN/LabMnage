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
    /**
     * 查询各个学院的课程安排
     * @param csy052
     * @return
     * @throws Exception
     */
    public List<Map> courselist(String csy052)throws Exception;
    /**
     *  查询各个班级每个课程的平均成绩
     * @return
     * @throws Exception
     */
    public List<Map> classGradestatistics()throws Exception;
    /**
     * 查询各个班级每个课程的平均分布
     * @param csy043
     * @param csy060
     * @return
     */
    public List<Map> classpeopleGradestatistics(String csy043, String csy060);
}

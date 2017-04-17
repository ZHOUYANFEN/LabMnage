package com.bysj.cqjtu.student.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.domain.Sy13;

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
    public List<Map> querySyllabus(UserMessage userMessage) throws Exception;
    /**
     * 获取实验安排
     * @param userMessage
     * @return
     */
    public List<Map> queryExpArrange(Sy04 sy04)throws Exception;
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
    /**
     * 查询实验安排
     * @param sy04
     * @return
     */
    public List<Map> queryExpList(Sy04 sy04)throws Exception;
    
    /**
     * 查询是否已经提交过报告
     * @param sy09
     */
    public Map saveReport(Sy09 sy09) throws Exception;
    /**
     * 查询成绩详情
     * @param sy07
     * @return
     * @throws Exception
     */
    public List<Map> queryGradeDetai(Sy07 sy07) throws Exception;
    /**
     * 查询资源类型
     * @return
     * @throws Exception
     */
    public List<Map> queryResourceType()  throws Exception;
    /**
     * 查询资源列表
     * @param csy160
     * @return
     * @throws Exception
     */
    public List<Map> queryResourceList(String csy160)  throws Exception;
    /**
     * 查询资源详细信息
     * @param sy13
     * @return
     * @throws Exception
     */
    public Sy13 queryResourceDetail(Sy13 sy13) throws Exception;

}

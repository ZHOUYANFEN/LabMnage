package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;

/**
 *实验完成情况
 * @author fuzhengjun
 *2017年3月29日下午3:25:02
 *
 */
public interface Sy09Mapper {
    int deleteByPrimaryKey(Integer csy090);

    int insert(Sy09 record);

    int insertSelective(Sy09 record);

    Sy09 selectByPrimaryKey(Integer csy090);

    int updateByPrimaryKeySelective(Sy09 record);

    int updateByPrimaryKey(Sy09 record);
    
    /**
     * 学生保存实验完成内容
     * @param sy09
     * @return
     */
    int saveExp(Sy09 sy09);
    /**
     * 查询是否提交过该报告
     * @param sy09
     * @return
     */
    List<Sy09> isExist(Sy09 sy09);
    /**
     * 更新实验完成表
     * @param sy09
     * @return
     */
    int updateReport(Sy09 sy09);
    /**
     * 保存实验报告
     * @param sy09
     * @return
     */
    void saveReport(Sy09 sy09);
    /**
     * 更新实验完成内容
     * @param sy09
     * @return
     */
    int updateExp(Sy09 sy09);
    /**
     * 查询实验安排
     * @param sy04
     * @return
     */
    List<Map> queryExpList(Sy04 sy04);
    /**
     * 查询有实验的课程
     * @param sy04
     * @return
     */
    List<Map> queryExpArrange(Sy04 sy04);
    /**
     * 查询课程下的实验安排
     * @param map
     * @return
     */
    List<Sy08> queryExpArrangeList(Map map);
    /**
     * 获取实验内容
     * @param map
     * @return
     */
    List<Map> queryExpArrangeContent(Map map);
    
}
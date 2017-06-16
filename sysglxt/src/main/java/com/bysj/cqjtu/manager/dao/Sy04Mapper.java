package com.bysj.cqjtu.manager.dao;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy04;

public interface Sy04Mapper {
    int deleteByPrimaryKey(String csy040);

    int insert(Sy04 record);

    int insertSelective(Sy04 record);

    Sy04 selectByPrimaryKey(String csy040);

    int updateByPrimaryKeySelective(Sy04 record);

    int updateByPrimaryKey(Sy04 record);
    /**
     * 判断学号是否重复
     * @param csy040
     * @return
     */
    List<Sy04> isExistSy04(String csy040);
    /**
     * 添加到学生表
     * @param sy04
     */
    int addSy04(Sy04 sy04);
    /**
     * 更新学生表
     * @param sy04
     * @return
     */
    int updateSy04(Sy04 sy04);
    /**
     * 按照班级获取学生信息
     * @param csy043
     * @return
     */
    List<Sy04> queryStudentList(String csy043);
    /**
     * 按照实验课程获取学生列表
     * @param csy060
     * @return
     */
    List<Sy04> queryStudentListByCourse(String csy060);
    /**
     * 根据id查询学生信息
     * @param csy040
     * @return
     */
    Sy04 queryStudentById(String csy040);
}
package com.bysj.cqjtu.manager.dao;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy05;

public interface Sy05Mapper {
    int deleteByPrimaryKey(Integer csy050);

    int insert(Sy05 record);

    int insertSelective(Sy05 record);

    Sy05 selectByPrimaryKey(Integer csy050);

    int updateByPrimaryKeySelective(Sy05 record);

    int updateByPrimaryKey(Sy05 record);
    /**
     * 验证教师是否存在
     * @param csy050
     * @return
     */
    List<Sy05> isExistSy05(String csy050);
    /**
     * 添加表
     * @param sy05
     * @return
     */
    int addSy05(Sy05 sy05);
    /**
     * 更新教师表
     * @param sy05
     * @return
     */
    int updateSy05(Sy05 sy05);
    
    List<Sy05> queryTeacher();
    /**
     * 按照用户id查询教师信息
     * @param csy020
     * @return
     */
    Sy05 getUserByCsy020(Integer csy020);

}
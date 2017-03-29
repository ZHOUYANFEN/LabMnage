package com.bysj.cqjtu.student.dao;

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
}
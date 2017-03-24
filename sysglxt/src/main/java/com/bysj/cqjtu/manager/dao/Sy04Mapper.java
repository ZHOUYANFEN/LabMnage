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
}
package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.student.domain.Sy07;

public interface Sy07Mapper {
    int insert(Sy07 record);

    int insertSelective(Sy07 record);
    /**
     * 查询所有成绩
     * @param sy07
     * @return
     */
    List<Map> queryGrade(Sy07 sy07);
}
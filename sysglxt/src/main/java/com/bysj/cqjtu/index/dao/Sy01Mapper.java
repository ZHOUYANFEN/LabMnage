package com.bysj.cqjtu.index.dao;

import java.util.List;

import com.bysj.cqjtu.index.domain.Sy01;

public interface Sy01Mapper {
    int deleteByPrimaryKey(Byte csy010);

    int insert(Sy01 record);

    int insertSelective(Sy01 record);

    Sy01 selectByPrimaryKey(Byte csy010);

    int updateByPrimaryKeySelective(Sy01 record);

    int updateByPrimaryKey(Sy01 record);
    /**
     * 获取人员类型
     * @return
     */
    List<Sy01> getCsy010();
}
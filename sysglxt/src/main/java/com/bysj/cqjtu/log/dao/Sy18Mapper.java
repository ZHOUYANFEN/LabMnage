package com.bysj.cqjtu.log.dao;

import java.util.List;

import com.bysj.cqjtu.log.domain.Sy18;

public interface Sy18Mapper {
    int deleteByPrimaryKey(Long csy180);

    int insert(Sy18 record);

    int insertSelective(Sy18 record);

    Sy18 selectByPrimaryKey(Long csy180);

    int updateByPrimaryKeySelective(Sy18 record);

    int updateByPrimaryKey(Sy18 record);

    List<Sy18> querySy18();
}
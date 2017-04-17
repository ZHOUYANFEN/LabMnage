package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.aa10;
import com.bysj.cqjtu.manager.domain.aa10Key;

public interface aa10Mapper {
    int deleteByPrimaryKey(aa10Key key);

    int insert(aa10 record);

    int insertSelective(aa10 record);

    aa10 selectByPrimaryKey(aa10Key key);

    int updateByPrimaryKeySelective(aa10 record);

    int updateByPrimaryKey(aa10 record);
    
    List<Map> validateCsy042(Map map);

    List validateCsy043(Map map);
}
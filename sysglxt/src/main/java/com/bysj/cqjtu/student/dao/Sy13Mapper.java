package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.student.domain.Sy13;

public interface Sy13Mapper {
    int deleteByPrimaryKey(Integer csy130);

    int insert(Sy13 record);

    int insertSelective(Sy13 record);

    Sy13 selectByPrimaryKey(Integer csy130);

    int updateByPrimaryKeySelective(Sy13 record);

    int updateByPrimaryKey(Sy13 record);
    
    /**
     * 查询资源类型
     * @return
     */
    List<Map> queryResourceType();
    
    
}
package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.student.domain.Sy16;

public interface Sy16Mapper {
    int deleteByPrimaryKey(Byte csy160);

    int insert(Sy16 record);

    int insertSelective(Sy16 record);

    Sy16 selectByPrimaryKey(Byte csy160);

    int updateByPrimaryKeySelective(Sy16 record);

    int updateByPrimaryKey(Sy16 record);
    /**
     * 查询资源类型
     * @return
     */
    List<Map> queryResourceType();
}
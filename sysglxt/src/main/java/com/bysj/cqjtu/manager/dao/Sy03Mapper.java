package com.bysj.cqjtu.manager.dao;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy03;

public interface Sy03Mapper {
    int deleteByPrimaryKey(Integer csy030);

    int insert(Sy03 record);

    int insertSelective(Sy03 record);

    Sy03 selectByPrimaryKey(Integer csy030);

    int updateByPrimaryKeySelective(Sy03 record);

    int updateByPrimaryKey(Sy03 record);
    
    /**
     * 验证科研人员是否存在
     * @param csy030
     * @return
     */
    List<Sy03> isExistSy03(String csy030);
    /**
     * 添加科研人员
     * @param sy03
     * @return
     */
    int addSy03(Sy03 sy03);
}
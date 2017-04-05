package com.bysj.cqjtu.common.dao;

import java.util.List;

import com.bysj.cqjtu.common.domain.Sy14;

public interface Sy14Mapper {
    int deleteByPrimaryKey(Integer csy140);

    int insert(Sy14 record);

    int insertSelective(Sy14 record);

    Sy14 selectByPrimaryKey(Integer csy140);

    int updateByPrimaryKeySelective(Sy14 record);

    int updateByPrimaryKey(Sy14 record);
    
    /**
     * 查询公告
     * @return
     */
    List<Sy14> queryanouncement();
    /**
     * 查询最新公告
     * @return
     */
    Sy14 getNewAnouncement();
}
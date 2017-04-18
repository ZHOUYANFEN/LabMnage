package com.bysj.cqjtu.log.dao;

import java.util.List;

import com.bysj.cqjtu.log.domain.Sy17;

public interface Sy17Mapper {
    int deleteByPrimaryKey(Integer csy170);

    int insert(Sy17 record);

    int insertSelective(Sy17 record);

    Sy17 selectByPrimaryKey(Integer csy170);

    int updateByPrimaryKeySelective(Sy17 record);

    int updateByPrimaryKey(Sy17 record);
    /**
     * 添加日志信息
     * @param sy17
     * @return
     */
    int addSy17(Sy17 sy17);
    /**
     * 查询日志信息
     * @return
     */
    List<Sy17> querySy17();
}
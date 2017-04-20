package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Aa10;
import com.bysj.cqjtu.manager.domain.Aa10Key;



public interface Aa10Mapper {
    int deleteByPrimaryKey(Aa10Key key);

    int insert(Aa10Key record);

    int insertSelective(Aa10 record);

    Aa10 selectByPrimaryKey(Aa10Key key);

    int updateByPrimaryKeySelective(Aa10 record);

    int updateByPrimaryKey(Aa10 record);
    
    List<Map> validateCsy042(Map map);

    List validateCsy043(Map map);
    /**
     * 获取csy042
     * @return
     */
    List<Map> queryCsy042();
    /**
     * 获取对应的csy043
     * @return
     */
    List<Map> queryCsy043(String aaa105);
    /**
     * 获取用户的数量
     * @return
     */
    List<Aa10> queryAa10();
    /**
     * 删除码表
     * @param aaa100
     * @param aaa102
     * @return
     */
    int deleteAa10(Aa10Key aa10Key);
}
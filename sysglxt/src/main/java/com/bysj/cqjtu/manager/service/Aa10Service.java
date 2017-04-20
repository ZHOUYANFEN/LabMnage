package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Aa10;
import com.bysj.cqjtu.util.PageEntity;
/**
 * 查询码表中的值
 * @author fuzhengjun
 *2017年4月19日下午7:38:54
 *
 */
public interface Aa10Service {
    
    /**
     * 获取所有学院
     * @return
     * @throws Exception
     */
    public List<Map> queryCsy042() throws Exception;
    /**
     * 获取学院下的班级
     * @return
     * @throws Exception
     */
    public List<Map> queryCsy043(String aaa105) throws Exception;
    /**
     * 获取码表的数量
     * @return
     * @throws Exception
     */
    public int getAa10Count() throws Exception;
    /**
     * 获取码表
     * @param pageNum
     * @param pageSize
     * @return
     * @throws Exception
     */
    public PageEntity<Aa10> queryAa10(Integer pageNum, Integer pageSize) throws Exception;
    /**
     * 删除码表
     * @param aaa100
     * @param aaa102
     * @return
     * @throws Exception
     */
    public Map deleteAa10(String aaa100, String aaa102) throws Exception;

}

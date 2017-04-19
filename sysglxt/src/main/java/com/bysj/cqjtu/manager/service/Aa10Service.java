package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;
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

}

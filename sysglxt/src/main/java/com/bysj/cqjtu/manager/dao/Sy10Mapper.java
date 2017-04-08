package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy10;

public interface Sy10Mapper {
    int deleteByPrimaryKey(Integer csy100);

    int insert(Sy10 record);

    int insertSelective(Sy10 record);

    Sy10 selectByPrimaryKey(Integer csy100);

    int updateByPrimaryKeySelective(Sy10 record);

    int updateByPrimaryKey(Sy10 record);
    /**
     * 查询实验室类型
     * @return
     */
    List<Map> queryLabType();
    /**
     * 验证实验室类型是否存在
     * @return
     * @throws Exception
     */
    Integer validateCsy101(Map map);
    /**
     * 添加实验室类型
     * @param sy10
     * @return
     * @throws Exception
     */
    int addCsy101(Sy10 sy10);
    /**
     * 刪除实验室类型
     * @return
     * @throws Exception
     */
    int deleteType(String csy100);
    /**
     * 修改实验室类型
     * @param sy10
     */
    int updateType(Sy10 sy10);
    
}
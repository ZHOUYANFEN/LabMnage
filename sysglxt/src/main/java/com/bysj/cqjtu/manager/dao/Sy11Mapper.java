package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy11;

public interface Sy11Mapper {
    int deleteByPrimaryKey(Integer csy110);

    int insert(Sy11 record);

    int insertSelective(Sy11 record);

    Map selectByPrimaryKey(Integer csy110);

    int updateByPrimaryKeySelective(Sy11 record);

    int updateByPrimaryKey(Sy11 record);
    /**
     * 查询对应类型下的实验室列表
     * @return
     * @throws Exception
     */
    List<Map> queryLabList(Map map);
    /**
     * 添加实验室信息
     * @return
     * @throws Exception
     */
    int addLab(Sy11 sy11);
    /**
     * 删除实验室信息
     * @param map
     * @return
     */
    int deleteSy11(Map map);
    /**
     * 查询实验室具体信息
     * @return
     * @throws Exception
     */
    Map queryLab(Map map);
    /**
     * 修改实验室具体信息
     * @return
     * @throws Exception
     */
    int updateLab(Sy11 sy11);
    /**
     * 验证实验室是否存在
     * @param sy11
     * @return
     * @throws Exception
     */
    List<Sy11> validateLab(Sy11 sy11);
    /**
     * 实验室统计
     * @return
     * @throws Exception
     */
    List<Map> labStatistics();
     /**
     * 查询试验室信息
     * @return
     */
    public List<Map> queryLabMsg();
    /**
     * 按条件查询实验室
     * @param map
     * @return
     */
    List<Map> queryLabCountByCondition(Map map);
    
}
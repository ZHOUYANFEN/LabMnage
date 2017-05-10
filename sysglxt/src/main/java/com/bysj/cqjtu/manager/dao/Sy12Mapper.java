package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy12;

public interface Sy12Mapper {
    int deleteByPrimaryKey(Integer csy120);

    int insert(Sy12 record);

    int insertSelective(Sy12 record);

    Sy12 selectByPrimaryKey(Integer csy120);

    int updateByPrimaryKeySelective(Sy12 record);

    int updateByPrimaryKeyWithBLOBs(Sy12 record);

    int updateByPrimaryKey(Sy12 record);
    /**
     * 实验室安排统计
     * @return
     * @throws Exception
     */
    List<Map> labArrangeStatistics();
    /**
     * 按照人员类型统计实验室的安排情况列表
     * @param csy010
     * @return
     * @throws Exception
     */
    List<Map> labArrangeListStatistics(Map map);
    /**
     * 查询所有实验室申请
     * @return
     */
    List<Map> queryLabApply();
    Sy12 selectByKey(Integer csy120,Integer csy020);
    /**
     * 审核申请
     * @param csy120
     */
    Map shenheinfo(String csy120);
    /**
     * 获取该实验室可以安排的时间
     * @param csy110
     * @return
     */
    List<String> getAllcsy126();

    Integer addLabApply(Sy12 sy12);
    /**
     * 获取指定时间类实验室的使用情况
     * @param csy110
     * @param week
     * @return
     */
    List<Map> getAlreadycsy126(Map map);
    /**
     * 审核实验室申请
     * @param sy12
     * @return
     */
    Integer updateApply(Sy12 sy12);
    /**
     * 查询申请的实验室信息
     * @return
     */
    List<Map> queryApplyLabMsg(Map map);
}
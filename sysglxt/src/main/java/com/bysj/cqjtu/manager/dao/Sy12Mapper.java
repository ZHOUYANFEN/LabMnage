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
}
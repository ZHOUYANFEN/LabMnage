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
    /**
     * 查询所有公告
     * @return
     * @throws Exception
     */
    List<Sy14> queryAllanouncement();
    /**
     * 删除公告
     * @param csy140
     * @return
     */
    int deleteanouncement(String csy140);
    /**
     * 添加公告
     * @param sy14
     * @return
     */
    int saveAnoucement(Sy14 sy14);
    /**
     * 公告详情
     * @param csy140
     * @return
     */
    Sy14 detailanouncement(String csy140);
}
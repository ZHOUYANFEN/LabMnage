package com.bysj.cqjtu.common.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.util.PageEntity;

/**
 * 公告管理service
 * @author fuzhengjun
 *2017年3月31日下午10:24:10
 *
 */
public interface AnouncementService {
    /**
     * 查询公告
     * @return
     * @throws Exception
     */
    public List<Sy14> queryanouncement() throws Exception;
    
    /**
     * 查询最新公告
     * @return
     * @throws Exception
     */
    public Sy14 queryNewAnouncement() throws Exception;
    /**
     * 查询所有公告
     * @return
     * @throws Exception
     */
    public PageEntity<Sy14> queryAllanouncement(Integer pageNum,Integer pageSize) throws Exception;
    /**
     * 删除公告
     * @param csy140
     * @return
     */
    public Map deleteanouncement(String csy140) throws Exception;
    /**
     * 批量删除公告
     * @param ids
     * @return
     */
    public Map deleteBatch(String ids) throws Exception;
    /**
     * 添加公告
     * @param sy14
     * @return
     * @throws Exception
     */
    public Map saveAnoucement(Sy14 sy14) throws Exception;
    /**
     * 公告详情
     * @param csy140
     * @return
     * @throws Exception
     */
    public Sy14 detailanouncement(String csy140) throws Exception;
    /**
     * 查询数量
     * @return
     */
    public int getAnouncementCount() throws Exception;
}

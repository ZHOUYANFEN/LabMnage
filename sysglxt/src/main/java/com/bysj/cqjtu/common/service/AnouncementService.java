package com.bysj.cqjtu.common.service;

import java.util.List;

import com.bysj.cqjtu.common.domain.Sy14;

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
}

package com.bysj.cqjtu.manager.service;

import com.bysj.cqjtu.log.domain.Sy17;
import com.bysj.cqjtu.log.domain.Sy18;
import com.bysj.cqjtu.util.PageEntity;

/**
 * 日志管理service
 * @author fuzhengjun
 *2017年4月18日下午9:44:02
 *
 */
public interface RecordService {
    /**
     * 获取日志信息
     * @return
     * @throws Exception
     */
    public PageEntity<Sy17> querySy17(Integer pageNum, Integer pageSize) throws Exception;
    /**
     * 获取日志数量
     * @return
     * @throws Exception
     */
    public int querySy17Count() throws Exception;
    /**
     * 获取异常日志信息
     * @param pageNum
     * @param pageSize
     * @return
     * @throws Exception
     */
    public PageEntity<Sy18> querySy18(Integer pageNum, Integer pageSize) throws Exception;
    /**
     * 获取异常日志数量
     * @return
     * @throws Exception
     */
    public int querySy18Count() throws Exception;
}

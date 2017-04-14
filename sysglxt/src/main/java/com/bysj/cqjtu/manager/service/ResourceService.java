package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

/**
 * 管理员资源管理service
 * @author fuzhengjun
 *2017年4月14日上午9:35:43
 *
 */
public interface ResourceService {
    /**
     * 查询资源类型
     * @return
     * @throws Exception
     */
    public List<Map> queryResourceType()  throws Exception;
    /**
     * 查询对应类型下的资源
     * @param csy160
     * @return
     * @throws Exception
     */
    public List<Map> queryResourceList(String csy160) throws Exception;
}

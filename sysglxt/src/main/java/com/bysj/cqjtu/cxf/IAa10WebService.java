package com.bysj.cqjtu.cxf;

import javax.jws.WebService;

/**
 * 码表修改接口
 * @author fuzhengjun
 *2017年4月24日上午9:11:20
 *
 */
@WebService
public interface IAa10WebService {
    /**
     * 添加码表 
     * @param XML
     * @return
     * @throws Exception
     */
    public String AddAa10(String XML) throws Exception;
}

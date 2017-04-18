package com.bysj.cqjtu.cxf;

import javax.jws.WebService;
/**
 * 添加用户接口
 * @author fuzhengjun
 *2017年4月18日上午9:47:20
 *
 */
@WebService
public interface IAddUserWebService {
    /**
     * 添加用用户
     * @param xml
     * @return
     * @throws Exception
     */
   public String addUser(String xml) throws Exception; 
}

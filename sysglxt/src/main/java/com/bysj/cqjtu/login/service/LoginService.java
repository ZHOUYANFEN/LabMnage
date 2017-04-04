package com.bysj.cqjtu.login.service;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;

/**
 * 登录service
 * @author fuzhengjun
 *2017年4月4日下午9:09:47
 *
 */
public interface LoginService {
    
    /**
     * 登录
     * @param sy02
     * @return
     * @throws Exception
     */
    public List<Sy02> login(Sy02 sy02) throws Exception;
    /**
     * 获取登录人员信息
     * @param sy02
     * @return
     * @throws Exception
     */
    public UserMessage getUserMessage(Sy02 sy02) throws Exception;
}

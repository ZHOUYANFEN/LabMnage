package com.bysj.cqjtu.common.service;

import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy02;

/**
 * userService
 * @author fuzhengjun
 *2017年4月5日下午3:21:10
 *
 */
public interface UserService {
    /**
     * 验证账号密码
     * @param sy02
     * @return
     * @throws Exception
     */
    public Map validateUser(Sy02 sy02) throws Exception;
    /**
     * 修改密码
     * @param sy02_new
     * @return
     */
    public Map changePassword(Sy02 sy02_new);
}

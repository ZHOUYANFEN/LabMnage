package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;

/**
 * 用户管理service
 * @author fuzhengjun
 *2017年3月22日下午8:24:16
 *
 */
public interface UserManagerService {
    /**
     * 查询所有的用户
     * @return
     * @throws Exception
     */
    public List<Sy02> getAllUser() throws Exception;
    /**
     * 删除单个用户
     * @param csy020
     * @throws Exception
     */
    public boolean deleteUser(int csy020) throws Exception;
    /**
     * 按条件查询用户
     * @param sy02
     * @return
     * @throws Exception
     */
    public List<Sy02> queryMenuByCondition(Sy02 sy02) throws Exception;
    /**
     * 添加用户信息
     * @param sy02
     * @return
     * @throws Exception
     */
    public Map addUser(UserMessage userMessage) throws Exception;
    /**
     * 验证是否存在用户
     * @param sy02
     * @return
     * @throws Exception
     */
    public List<Sy02> isExistUser(Sy02 sy02) throws Exception;
    /**
     * 查询用户详细信息
     * @param sy02
     * @return
     * @throws Exception
     */
    public Map getUserMessage(Sy02 sy02) throws Exception;
    
}

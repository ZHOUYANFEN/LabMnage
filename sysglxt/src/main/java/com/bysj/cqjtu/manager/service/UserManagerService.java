package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.util.PageEntity;

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
    public List<Map> getAllUser() throws Exception;
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
    /**
     * 更新用户信息
     * @param userMessage
     * @return
     * @throws Exception
     */
    public Map updateUser(UserMessage userMessage) throws Exception;
    /**
     * 验证输入的学院信息
     * @param csy042
     * @return
     * @throws Exception
     */
    public Map validateCsy042(String csy042) throws Exception;
    /**
     * 验证输入的班级信息
     * @param csy042
     * @return
     * @throws Exception
     */
    public Map validateCsy043(String csy043)  throws Exception;
    
    /**
     * 查询所有的用户
     * @return
     * @throws Exception
     */
    public PageEntity<Map> queryAllUser(Integer pageNum, Integer pageSize) throws Exception;
    /**
     * 获取用户数量
     * @return
     * @throws Exception
     */
    public int getUserCount() throws Exception;
    
}

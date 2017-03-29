package com.bysj.cqjtu.manager.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy02;

public interface Sy02Mapper {
    int deleteByPrimaryKey(Integer csy020);

    int insert(Sy02 record);

    int insertSelective(Sy02 record);

    Sy02 selectByPrimaryKey(Integer csy020);

    int updateByPrimaryKeySelective(Sy02 record);

    int updateByPrimaryKey(Sy02 record);
    
    /**
     * 查询所有用户信息
     * @return
     */
    List<Map> getAllUser();
    /**
     * 按照id删除用户
     * @param csy020
     * @return
     */
    int deleteUser(int csy020);
    
    /**
     * 按照条件查询用户
     * @param sy02
     * @return
     */
    List<Sy02> queryMenuByCondition(Sy02 sy02);
    /**
     * 添加新用户
     * @param sy02
     * @return
     */
    int addUser(Sy02 sy02);
    /**
     * 验证是否存在用户
     * @param sy02
     * @return
     */
    List<Sy02> isExistUser(Sy02 sy02);
    /**
     * 查询用户详细信息
     * @return
     */
    Map getUserMessage(Sy02 sy02);
    /**
     * 查询教师详细信息
     * @return
     *//*
    Map getUserMessageOfTeacher(Sy02 sy02);
    *//**
     * 查询科研人员详细信息
     * @return
     *//*
    Map getUserMessageOfTecho(Sy02 sy02);*/
    /**
     * 更新用户信息
     * @param sy02
     */
    int updateSy02(Sy02 sy02);
  }
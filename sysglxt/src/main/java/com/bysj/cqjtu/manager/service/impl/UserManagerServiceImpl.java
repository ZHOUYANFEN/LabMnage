package com.bysj.cqjtu.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.service.UserManagerService;
@Service
public class UserManagerServiceImpl implements UserManagerService {
    
    @Autowired
    private Sy02Mapper sy02Mapper;
    
    @Override
    public List<Sy02> getAllUser() throws Exception {
       
        List<Sy02>list  =sy02Mapper.getAllUser();
        return list;
    }

    @Override
    public boolean deleteUser(int csy020) throws Exception {
        int i=sy02Mapper.deleteUser(csy020);
        if(i!=1){
            throw new Exception("删除用户信息失败");
        }
        return true;
    }

    @Override
    public List<Sy02> queryMenuByCondition(Sy02 sy02) throws Exception {
        List<Sy02> list=sy02Mapper.queryMenuByCondition(sy02);
        return list;
    }

    @Override
    public boolean addUser(Sy02 sy02) throws Exception {
        sy02.setCsy023(Byte.parseByte("0"));
        int i=sy02Mapper.addUser(sy02);
        if(i!=1){
            throw new RuntimeException("增加用户失败");
        }
        return true;
    }

    @Override
    public List<Sy02> isExistUser(Sy02 sy02) throws Exception {
        return sy02Mapper.isExistUser(sy02);
    }


}

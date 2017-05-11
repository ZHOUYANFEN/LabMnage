package com.bysj.cqjtu.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.common.constance.UserConstance;
import com.bysj.cqjtu.common.service.UserService;
import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.util.Md5Encoder;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private Sy02Mapper sy02Mapper;
    @Override
    @SystemServiceLog(description="验证用户信息")
    public Map validateUser(Sy02 sy02) throws Exception {
        sy02.setCsy022(Md5Encoder.getMD5(sy02.getCsy022()));
        List<Sy02> list=sy02Mapper.getUser(sy02);
        Map map=new HashMap();
        if(list.size()==1){
            map.put("statu", UserConstance.VALIDATE_USER_SUCCESS);
        }else{
            map.put("statu", UserConstance.VALIDATE_USER_ERROR);
        }
        return map;
    }
    @Override
    @SystemServiceLog(description="修改密码")
    public Map changePassword(Sy02 sy02_new) throws Exception{
        sy02_new.setCsy022(Md5Encoder.getMD5(sy02_new.getCsy022()));
        int i=sy02Mapper.changePassword(sy02_new);
        Map map=new HashMap();
        if(i==1){
            map.put("statu", UserConstance.CHANGEPASSWORD_USER_SUCCESS);
        }else{
            throw new RuntimeException(UserConstance.CHANGEPASSWORD_USER_ERROR);
        }
        return map;
    }

}

package com.bysj.cqjtu.login.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.index.domain.Sy01;
import com.bysj.cqjtu.login.constance.LoginConstance;
import com.bysj.cqjtu.login.service.LoginService;
import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy03;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.util.Md5Encoder;

@Service
public class LoginServiceImpl implements LoginService {
     
     @Autowired
     private Sy02Mapper sy02Mapper;
    @Override
    public List<Sy02> login(Sy02 sy02) throws Exception {
        sy02.setCsy022(Md5Encoder.getMD5(sy02.getCsy022()));
        List<Sy02> list=sy02Mapper.getUser(sy02);
        return list;
    }
    @Override
    public UserMessage getUserMessage(Sy02 sy02) throws Exception {
        Map map=sy02Mapper.getUserMessage(sy02);
        UserMessage userMessage=new UserMessage(); 
        userMessage.setSy02(sy02);
        Sy01 sy01=new Sy01();
        sy01.setCsy011((String)map.get("CSY011"));
        userMessage.setSy01(sy01);
        switch (sy02.getCsy010()) {
        case LoginConstance.USER_TYPE_STUDENT:           
            Sy04 sy04=new Sy04();
            sy04.setCsy040((String)map.get("CSY040"));
            sy04.setCsy041((String)map.get("CSY041"));
            sy04.setCsy042((String)map.get("CSY042"));
            sy04.setCsy043((String)map.get("CSY043"));
            userMessage.setSy04(sy04);
            break;
        case LoginConstance.USER_TYPE_TEACHER:
            Sy05 sy05=new Sy05();
            sy05.setCsy050((Integer)map.get("CSY050"));
            sy05.setCsy051((String)map.get("CSY051"));
            sy05.setCsy052((String)map.get("CSY052"));
            sy05.setCsy053((String)map.get("CSY053"));
            userMessage.setSy05(sy05);
            break;
        case LoginConstance.USER_TYPE_TECHO:
            Sy03 sy03=new Sy03();
            sy03.setCsy030((Integer)map.get("CSY030"));
            sy03.setCsy031((String)map.get("CSY031"));
            sy03.setCsy032((String)map.get("CSY032"));
            userMessage.setSy03(sy03);
            break;
        default:
            break;
        }
        return userMessage;
    }
    @Override
    public Sy02 findUserByUsername(String csy021) throws Exception {
        return sy02Mapper.findUserByUsername(csy021);
    }

}

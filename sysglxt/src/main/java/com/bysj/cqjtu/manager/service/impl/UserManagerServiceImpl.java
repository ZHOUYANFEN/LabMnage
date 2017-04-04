package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.dao.Sy03Mapper;
import com.bysj.cqjtu.manager.dao.Sy04Mapper;
import com.bysj.cqjtu.manager.dao.Sy05Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy03;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.manager.service.UserManagerService;
import com.bysj.cqjtu.util.Md5Encoder;
@Service
public class UserManagerServiceImpl implements UserManagerService {
    
    @Autowired
    private Sy02Mapper sy02Mapper;
    @Autowired
    private Sy03Mapper sy03Mapper;
    @Autowired
    private Sy04Mapper sy04Mapper;
    @Autowired
    private Sy05Mapper sy05Mapper;
    
    @Override
    public List<Map> getAllUser() throws Exception {
       
        List<Map>list  =sy02Mapper.getAllUser();
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
    public Map addUser(UserMessage userMessage) throws Exception {
        Map map=new HashMap();
        Sy02 sy02=userMessage.getSy02();
        sy02.setCsy022(Md5Encoder.getMD5(sy02.getCsy022()));
        sy02.setCsy023(Byte.parseByte("0"));
        List<Sy02> list=isExistUser(sy02);
        if(list.size()>=1){
            map.put("statu", OperateStatu.QUERY_SY02_IN);//用户id重复
        }else {
            //插入用户表
            int i=sy02Mapper.addUser(sy02);
            if(i!=1){
                map.put("statu", OperateStatu.ADD_SY02_FAIL);//插入用户表错误
            }else{
                if(sy02.getCsy010()==OperateStatu.TYPE_STUDENT){
                    String csy040=userMessage.getSy04().getCsy040();
                    //判断学生学号是否重复
                    List<Sy04> validateSy04List=sy04Mapper.isExistSy04(csy040);
                    if(validateSy04List.size()<=0){                    
                        //添加学生表                    
                        Sy04 sy04=userMessage.getSy04();
                        sy04.setCsy020(sy02.getCsy020());       
                        int j=sy04Mapper.addSy04(sy04);
                        if(j!=1){
                           map.put("statu", OperateStatu.ADD_SY04_FAIL);//插入学生表错误
                        }else{                 
                            map.put("statu", OperateStatu.ADD_SY04_SUCCESS);//添加成功
                        }
                    }else{
                        map.put("statu", OperateStatu.QUERY_SY04_IN);//学号重复
                    }
                }else if(sy02.getCsy010()==OperateStatu.TYPE_TEACHER){
                    /*String csy050=userMessage.getSy05().getCsy050().toString();
                    //判断教师是否重复
                    List<Sy05> validateSy05List=sy05Mapper.isExistSy05(csy050);
                    if(validateSy05List.size()<=0){  */                  
                    //添加教师表                    
                    Sy05 sy05=userMessage.getSy05();
                    sy05.setCsy020(sy02.getCsy020().toString());       
                    int j=sy05Mapper.addSy05(sy05);
                    if(j!=1){
                        map.put("statu", OperateStatu.ADD_SY05_FAIL);//插入教师错误
                    }else{                
                        map.put("statu", OperateStatu.ADD_SY05_SUCCESS);//添加成功
                    }
                    /*}else{
                         map.put("statu", OperateStatu.QUERY_SY05_IN);//教师ID重复
                    }*/
                }else if(sy02.getCsy010()==OperateStatu.TYPE_TECHO){
                    /*String csy030=userMessage.getSy03().getCsy030().toString();
                    //判断科研人员id是否重复
                    List<Sy03> validateSy03List=sy03Mapper.isExistSy03(csy030);
                    if(validateSy03List.size()<=0){   */                 
                        //添加科研人员表                    
                    Sy03 sy03=userMessage.getSy03();
                    sy03.setCsy020(sy02.getCsy020().toString());       
                    int j=sy03Mapper.addSy03(sy03);
                    if(j!=1){
                        map.put("statu", OperateStatu.ADD_SY03_FAIL);//插入科研错误
                    }else{                
                        map.put("statu", OperateStatu.ADD_SY03_SUCCESS);//添加成功
                    }
                    /*}else{
                         map.put("statu", OperateStatu.QUERY_SY03_IN);//科研人员id重复
                    }*/
                }else{
                    map.put("statu", OperateStatu.ADD_SY02_SUCCESS);
                }
            }
        }
        return map;
    }

    @Override
    public List<Sy02> isExistUser(Sy02 sy02) throws Exception {
        return sy02Mapper.isExistUser(sy02);
    }

    @Override
    public Map getUserMessage(Sy02 sy02) throws Exception {
        Map map=new HashMap();
        map=sy02Mapper.getUserMessage(sy02);
        return map;
    }

    @Override
    public Map updateUser(UserMessage userMessage) throws Exception {
        Map map=new HashMap();
        Sy02 sy02=userMessage.getSy02();
        int updatesy02=sy02Mapper.updateSy02(sy02);
        if(updatesy02!=1){
            map.put("statu", OperateStatu.UPDATE_SY02_FAILE);
        }else{
            if(OperateStatu.TYPE_STUDENT==sy02.getCsy010()){
                Sy04 sy04=userMessage.getSy04();
                sy04.setCsy020(sy02.getCsy020());
                int updatesy04=sy04Mapper.updateSy04(sy04);
                if(updatesy04!=1){
                    map.put("statu", OperateStatu.UPDATE_SY04_FAILE);
                }
            }else if(OperateStatu.TYPE_TEACHER==sy02.getCsy010()){
                Sy05 sy05=userMessage.getSy05();
                sy05.setCsy020(sy02.getCsy020().toString());
                int updatesy05=sy05Mapper.updateSy05(sy05);
                if(updatesy05!=1){
                    map.put("statu", OperateStatu.UPDATE_SY05_FAILE);
                }
            }else if(OperateStatu.TYPE_TECHO==sy02.getCsy010()){
                Sy03 sy03=userMessage.getSy03();
                sy03.setCsy020(sy02.getCsy020().toString());
                int updatesy03=sy03Mapper.updateSy03(sy03);
                if(updatesy03!=1){
                    map.put("statu", OperateStatu.UPDATE_SY03_FAILE);
                }
            }else {
                map.put("statu", OperateStatu.UPDATE_FAIL);
            }
            map.put("statu", OperateStatu.UPDATE_USER_SUCCESS);
        }
        return map;
    }


}

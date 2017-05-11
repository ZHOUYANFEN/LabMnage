package com.bysj.cqjtu.cxf.impl;

import java.util.Map;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bysj.cqjtu.cxf.IAddUserWebService;
import com.bysj.cqjtu.cxf.common.GetException;
import com.bysj.cqjtu.cxf.common.XmlAssembly;
import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy03;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.manager.service.UserManagerService;
import com.bysj.cqjtu.util.XmlTools;
/**
 * 添加用户webservice实现类
 * @author fuzhengjun
 *2017年4月18日上午10:30:32
 *
 */
@Component("addUser")
@WebService
public class AddUserWebServiceImpl implements IAddUserWebService {

    @Autowired
    private UserManagerService userManagerService;
    @Override
    @SystemServiceLog(description="接口添加用户")
    public String addUser(String xml) throws Exception {
        try{
            //解析xml
           /* XmlHead xmlHead = (XmlHead) XmlTools.simpleXmlToObject(xml, new XmlHead());
            xmlHead.setInteface("addUser");    */            
            //查询结构，并封装返回xml         
            StringBuffer sb = new StringBuffer("<?xml version='1.0' encoding='UTF-8' ?>");
            sb.append(XmlAssembly.OUTPUT);
            sb.append(XmlAssembly.HEAD);
            //拼装返回head          
            //String xmlhead = XmlTools.simpleObjToXml(xmlHead);
            //sb.append(xmlhead);
            sb.append(XmlAssembly.UN_HEAD);         
            sb.append(XmlAssembly.DATA + XmlAssembly.MAP);
            String csy010 = XmlTools.simpleXmlValues(xml, "csy010");
            String csy021 = XmlTools.simpleXmlValues(xml, "csy021");
            String csy022 = XmlTools.simpleXmlValues(xml, "csy022");
            Sy02 sy02=new Sy02();
            sy02.setCsy010(Byte.parseByte(csy010));
            sy02.setCsy021(csy021);
            sy02.setCsy022(csy022);
            
            UserMessage userMessage= new UserMessage();
            userMessage.setSy02(sy02);
            
            if(Integer.parseInt(csy010)==OperateStatu.TYPE_STUDENT){
                String csy040 = XmlTools.simpleXmlValues(xml, "csy040");
                String csy041 = XmlTools.simpleXmlValues(xml, "csy041");
                String csy042 = XmlTools.simpleXmlValues(xml, "csy042");
                String csy043 = XmlTools.simpleXmlValues(xml, "csy043");
                Map map_1=userManagerService.validateCsy042(csy042);
                Map map_2=userManagerService.validateCsy043(csy043);
                if(map_1.get("statu")==OperateStatu.VALIDATE_INPUT_SUCCESS&&map_2.get("statu")==OperateStatu.VALIDATE_INPUT_SUCCESS){
                    Sy04 sy04= new Sy04();
                    sy04.setCsy040(csy040);
                    sy04.setCsy041(csy041);
                    sy04.setCsy042(csy042);
                    sy04.setCsy043(csy043);                  
                    userMessage.setSy04(sy04);
                }else{
                    sb.append(XmlAssembly.STATU+map_1.get("statu")+XmlAssembly.UN_STATU);
                    return sb.toString();
                }
                
            }else if(Integer.parseInt(csy010)==OperateStatu.TYPE_TECHO){
                String csy031 = XmlTools.simpleXmlValues(xml, "csy031");
                String csy032 = XmlTools.simpleXmlValues(xml, "csy032");
                Sy03 sy03=new Sy03();
                sy03.setCsy031(csy031);
                sy03.setCsy032(csy032);
                userMessage.setSy03(sy03);
            }else if(Integer.parseInt(csy010)==OperateStatu.TYPE_TEACHER){
                String csy051 = XmlTools.simpleXmlValues(xml, "csy051");
                String csy052 = XmlTools.simpleXmlValues(xml, "csy052");
                String csy053 = XmlTools.simpleXmlValues(xml, "csy053");
                Map map_1=userManagerService.validateCsy042(csy052);
                if(map_1.get("statu")==OperateStatu.VALIDATE_INPUT_SUCCESS){
                    Sy05 sy05 =new Sy05();
                    sy05.setCsy051(csy051);
                    sy05.setCsy052(csy052);
                    sy05.setCsy053(csy053);
                    userMessage.setSy05(sy05);
                }else{
                    sb.append(XmlAssembly.STATU+map_1.get("statu")+XmlAssembly.UN_STATU);
                    return sb.toString();
                }
            }
            Map map=userManagerService.addUser(userMessage);
            sb.append(XmlAssembly.STATU+map.get("statu")+XmlAssembly.UN_STATU);
            return sb.toString();
        } catch (Exception e) {
            return GetException.getException(xml, e);
        }
    }

}

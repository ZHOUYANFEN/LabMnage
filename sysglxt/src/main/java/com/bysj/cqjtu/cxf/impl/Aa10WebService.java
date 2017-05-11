package com.bysj.cqjtu.cxf.impl;

import java.util.Map;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bysj.cqjtu.cxf.IAa10WebService;
import com.bysj.cqjtu.cxf.common.GetException;
import com.bysj.cqjtu.cxf.common.XmlAssembly;
import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.domain.Aa10;
import com.bysj.cqjtu.manager.service.Aa10Service;
import com.bysj.cqjtu.util.XmlTools;

/**
 * 码表管理接口
 * @author fuzhengjun
 *2017年4月24日上午9:12:20
 *
 */
@Component("aa10")
@WebService
public class Aa10WebService implements IAa10WebService {
    
    @Autowired 
    private Aa10Service aa10Service;
    @Override
    @SystemServiceLog(description="接口添加码表")
    public String AddAa10(String XML) throws Exception {
        try{       
            //并封装返回xml         
            StringBuffer sb = new StringBuffer("<?xml version='1.0' encoding='UTF-8' ?>");
            sb.append(XmlAssembly.OUTPUT);
            sb.append(XmlAssembly.HEAD);
            //拼装返回head          
            sb.append(XmlAssembly.UN_HEAD);         
            sb.append(XmlAssembly.DATA + XmlAssembly.MAP);
            String aaa100 = XmlTools.simpleXmlValues(XML, "aaa100");
            String aaa101 = XmlTools.simpleXmlValues(XML, "aaa101");
            String aaa102 = XmlTools.simpleXmlValues(XML, "aaa102");
            String aaa103 = XmlTools.simpleXmlValues(XML, "aaa103");
            String aaa105 = XmlTools.simpleXmlValues(XML, "aaa105");
            Aa10 aa10 =new Aa10(); 
            aa10.setAaa100(aaa100);
            aa10.setAaa101(aaa101);
            aa10.setAaa102(aaa102);
            aa10.setAaa103(aaa103);
            aa10.setAaa105(aaa105);
            Map map= aa10Service.setvalidateAa10Aaa101(aa10);
            if(OperateStatu.VALIDATE_AA10_FAIL==map.get("statu")){
                sb.append(XmlAssembly.STATU+"该码表已经存在"+XmlAssembly.UN_STATU);
                return sb.toString();
            }else{
                Map addAa10Map=aa10Service.saveAa10(aa10);
                sb.append(XmlAssembly.STATU+addAa10Map.get("statu")+XmlAssembly.UN_STATU);
                return sb.toString();
            }            
        } catch (Exception e) {
            return GetException.getException(XML, e);
        }
    }

}

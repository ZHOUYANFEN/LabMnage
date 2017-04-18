package com.bysj.cqjtu.cxf;


import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

/**
 * 服务接口：
 *
 * */
public class WebserviceTest {


	
	   
    /* System.out.println(hw.SysRegister(inputXml));*/
	
	public static void main(String[] args) throws Throwable{
		   JaxWsProxyFactoryBean svr = new JaxWsProxyFactoryBean();
		   svr.setAddress("http://localhost:8080/sysglxt/webservice/addUser");
           svr.setServiceClass(IAddUserWebService.class);
           IAddUserWebService hw = (IAddUserWebService) svr.create();
           String inputXml = "<?xml version='1.0' encoding='UTF-8' ?>"+
                   "<input>"+
                   "<head>"+                 
                   "</head>"+
                   "<data>"+
                   "<map>"+
                       "<csy010>1</csy010>"
                       +"<csy021>fuzj1</csy021>"
                       +"<csy022>fuzj1</csy022>"
                       +"<csy040>22222</csy040>"
                       +"<csy041>fuzj1</csy041>"
                       +"<csy042>信息科学</csy042>"
                       +"<csy043>计软1302班</csy043>"
                   +"</map>"+
                   "</data>"+
                   "</input>";
           
           //System.out.println(SfrzUtil.sfrz(inputXml));
           System.out.println(hw.addUser(inputXml));
           //System.out.println(hw.getPicLink("D:\\123456\\201703\\07\\", "5418247123927989666.jpg"));
	}
	
	
}

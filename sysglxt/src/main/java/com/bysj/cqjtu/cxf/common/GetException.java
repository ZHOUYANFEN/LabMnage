package com.bysj.cqjtu.cxf.common;




/**
 * 接口返回异常信息格式
 * @author fuzhengjun
 *2017年4月13日下午5:44:09
 *
 */
public class GetException {
    /**
     * 组装异常信息
     * @param XML
     * @param e
     * @return
     * @throws Exception
     */
    public static String getException(String XML, Exception e) throws Exception {
        StringBuffer sbBuffer=new StringBuffer();
        sbBuffer.append(XmlAssembly.OUTPUT);
        sbBuffer.append(XmlAssembly.HEAD);
        //XmlHead xmlHead = (XmlHead) XmlTools.simpleXmlToObject(XML, new XmlHead());
        //xmlHead.setInteface(webServiceName);
        //String xmlhead = XmlTools.simpleObjToXml(xmlHead);
       // sbBuffer.append(xmlhead);
        sbBuffer.append(XmlAssembly.UN_HEAD);
        sbBuffer.append(XmlAssembly.DATA + XmlAssembly.MAP);
        sbBuffer.append(XmlAssembly.EXCEPTION+e+XmlAssembly.UN_EXCEPTION);
        sbBuffer.append(XmlAssembly.UN_MAP+XmlAssembly.UN_DATA);
        return sbBuffer.toString();
    }
}

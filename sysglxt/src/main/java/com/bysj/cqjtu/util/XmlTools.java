package com.bysj.cqjtu.util;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;


 /**
  * XML工具类
  * @author fuzhengjun
  *2017年4月18日上午10:17:07
  *
  */
public class XmlTools {

	/**
	 * @Title: simpleXmlToObject
	 * @Description: 将XML转化为指定对象
	 * @param xml
	 *            XML数据
	 * @param object
	 *            需要转为的对象
	 * @return 转化后的对象
	 * @throws Throwable
	 */
	public static Object simpleXmlToObject(String xml, Object object)
			throws Exception {
		String x = xml.substring(xml.indexOf("<head>"), xml.indexOf("<data>"));
		XStream xStream = new XStream(new DomDriver());//不需要XPP3库
		//将 pReq替换成对象名称,为类名节点重命名
		xStream.alias("head", object.getClass());
		//将xml文件转换成一个对象
		Object reobj = xStream.fromXML(x, object);
		return reobj;
	}
	/**
	 * @Description: 将对象转化为xml
	 * 
	 * @param object
	 *            需要转为的对象
	 * @return 转化后的xml
	 * */
	public static String simpleObjToXml( Object object)
			throws Exception{
		XStream xStream = new XStream(new DomDriver());
		String xml = xStream.toXML(object);
		return xml;
	}
	/**
	 * @Title: dataXmlToObject
	 * @Description: 将XML转化为指定对象
	 * @param xml
	 *            XML数据
	 * @param object
	 *            需要转为的对象
	 * @return 转化后的对象
	 * @throws Throwable
	 */
	public static Object dataXmlToObject(String x, Object object)
			throws Throwable {
		try {
			String xml = x.substring(x.indexOf("<data>"), x.indexOf("</data>"));
			x = x.replace(xml, "");
			//去掉xml文件头
			XStream xStream = new XStream(new DomDriver());
			xStream.alias("map", object.getClass());
			Object reobj = xStream.fromXML(x, object);
			return reobj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}
	
	/**
	 * @Title: complexXmlToObject
	 * @Description: 将XML转化为指定对象
	 * @param xml
	 *            XML数据
	 * @param object
	 *            需要转为的对象
	 * @return 转化后的对象
	 * @throws Throwable
	 */
	public static Object complexXmlToObject(String x, Object object)
			throws Throwable {
		try {
			String xm = x.substring(x.indexOf("<head>"), x.indexOf("</head>"));
			if(xm.length() < 20){
			return 	simpleXmlToObject(x, object);
			}
			String xml = x.substring(x.indexOf("<data>"), x.indexOf("</data>"));
			x = x.replace(xml, "");
			//去掉xml文件头
			x = x.substring(x.indexOf("<head"), x.length());
			XStream xStream = new XStream(new DomDriver());
			xStream.alias("head", object.getClass());
			Object reobj = xStream.fromXML(x, object);
			return reobj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}
	
	/**得到时间
	 * @param x xml
	 * @return
	 */
	public static String simpleXmlCheckdate(String x){
		String xml = x.substring(x.indexOf("checkdate=\"")+11, x.indexOf("\">"));
		return xml;
	}
	
	/**根据传入的标签内容，拿到值
	 * @param x xml
	 * @param lable 标签内容
	 * @return
	 */
	public static String simpleXmlValues(String xml,String lable) throws Exception{
		String labstr = "<"+lable+">";
		String labEnd = "</"+lable+">";
		String xm = xml.substring(xml.indexOf(labstr)+labstr.length(), xml.indexOf(labEnd));
		return xm;
	}
	
	
	
}

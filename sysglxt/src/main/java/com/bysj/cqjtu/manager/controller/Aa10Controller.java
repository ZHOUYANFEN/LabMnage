package com.bysj.cqjtu.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Aa10;
import com.bysj.cqjtu.manager.service.Aa10Service;
import com.bysj.cqjtu.util.PageEntity;

@Controller
@RequestMapping("/aa10")
public class Aa10Controller {
    @Autowired
    private Aa10Service aa10Service;
    /**
     * 获取所有学院
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryCsy042")
    @ResponseBody    
    @SystemControllerLog(description ="获取所有学院")
    public List<Map> queryCsy042() throws Exception{
        return aa10Service.queryCsy042();
    }
    /**
     * 获取学院下的班级
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryCsy043")
    @ResponseBody
    @SystemControllerLog(description ="获取学院下的班级")
    public List<Map> queryCsy043(String aaa105) throws Exception{
        return aa10Service.queryCsy043(aaa105);
    }
    /**
     * 获取码表的数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/getAa10Count")
    @ResponseBody
    @SystemControllerLog(description =" 获取码表的数量")
    public Map getAa10Count() throws Exception{
        int i = aa10Service.getAa10Count();
        Map map =new HashMap();
        map.put("count", i);
        return map;
    }
    /**
     * 查询码表
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryAa10")
    @ResponseBody
    @SystemControllerLog(description =" 查询码表")
    public PageEntity<Aa10> queryAa10(Integer pageNum,Integer pageSize) throws Exception{
        return aa10Service.queryAa10(pageNum,pageSize);
    }
    /**
     * 删除码表
     * @param aaa100
     * @param aaa102
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteAa10")
    @ResponseBody
    @SystemControllerLog(description =" 删除码表")
    public Map deleteAa10(String aaa100,String aaa102) throws Exception{
        return aa10Service.deleteAa10(aaa100,aaa102);
    }
}

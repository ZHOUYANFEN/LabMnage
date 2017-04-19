package com.bysj.cqjtu.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.service.Aa10Service;

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
}

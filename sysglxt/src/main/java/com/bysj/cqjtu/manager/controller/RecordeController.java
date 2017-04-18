package com.bysj.cqjtu.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.log.domain.Sy17;
import com.bysj.cqjtu.manager.service.RecordService;
import com.bysj.cqjtu.util.PageEntity;

@Controller
@RequestMapping("/log")
public class RecordeController {
    @Autowired
    private RecordService recordService;
    /**
     * 获取日志信息
     * @return
     */
    @RequestMapping("/querySy17")
    @ResponseBody
    @SystemControllerLog(description ="获取日志信息")
    public PageEntity<Sy17> querySy17(Integer pageNum, Integer pageSize) throws Exception{
       return recordService.querySy17(pageNum,pageSize);
    }
    /**
     * 获取日志数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/querySy17Count")
    @ResponseBody
    @SystemControllerLog(description ="获取日志数量")
    public Map querySy17Count()  throws Exception{
        int i=recordService.querySy17Count();
        Map map =new HashMap();
        map.put("count", i);
        return map;
    }
}

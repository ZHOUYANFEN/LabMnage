package com.bysj.cqjtu.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.common.service.AnouncementService;
import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.util.PageEntity;

@RequestMapping("/anouncement")
@Controller
public class AnouncementController {
    @Autowired
    private AnouncementService anouncementService;
    
    /**
     * 查询公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryanouncement")
    @ResponseBody
    @SystemControllerLog(description ="获取公告|queryanouncement")
    public List<Sy14> queryanouncement() throws Exception{
        List<Sy14> list=anouncementService.queryanouncement();
        return list;
    }
    /**
     * 查询最新公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/getNewAnouncement")
    @ResponseBody
    @SystemControllerLog(description ="获取最新公告")
    public Sy14 getNewAnouncement() throws Exception{
        Sy14 sy14=anouncementService.queryNewAnouncement();
        return sy14;
    }
    
    /**
     * 查询所有公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryAllanouncement")
    @ResponseBody
    @SystemControllerLog(description ="查询所有公告")
    public PageEntity<Sy14> queryAllanouncement(Integer pageNum,Integer pageSize) throws Exception{
        return anouncementService.queryAllanouncement(pageNum,pageSize);
    }
    /**
     * 删除公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteanouncement")
    @ResponseBody
    @SystemControllerLog(description ="删除公告")
    public Map deleteanouncement(String csy140) {
        try {
            return anouncementService.deleteanouncement(csy140);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    } 
    /**
     * 批量删除公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteBatch")
    @ResponseBody
    @SystemControllerLog(description ="批量删除公告")
    public Map deleteBatch(String ids) {
        try {
            return anouncementService.deleteBatch(ids);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 添加公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveAnoucement")
    @ResponseBody
    @SystemControllerLog(description ="添加公告")
    public Map saveAnoucement(@RequestBody Sy14 sy14){
        try {
            return anouncementService.saveAnoucement(sy14);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 公告详情
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailanouncement")
    @ResponseBody
    @SystemControllerLog(description ="公告详情")
    public Sy14 detailanouncement(String csy140) throws Exception{
        Sy14 sy14=anouncementService.detailanouncement(csy140);
        return sy14;
    }
    /**
     * 查询公告数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/getAnouncementCount")
    @ResponseBody
    @SystemControllerLog(description ="查询公告数量")
    public Map getAnouncementCount() throws Exception{
        int i= anouncementService.getAnouncementCount();
        Map map=new HashMap();
        map.put("count", 1);
        return map;
    }
}

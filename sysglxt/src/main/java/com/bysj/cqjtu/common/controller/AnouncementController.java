package com.bysj.cqjtu.common.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.common.service.AnouncementService;

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
    public List<Sy14> queryAllanouncement() throws Exception{
        List<Sy14> list=anouncementService.queryAllanouncement();
        return list;
    }
    /**
     * 删除公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteanouncement")
    @ResponseBody
    public Map deleteanouncement(String csy140) throws Exception{
        Map map =anouncementService.deleteanouncement(csy140);
        return map;
    } 
    /**
     * 批量删除公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Map deleteBatch(String ids) throws Exception{
        Map map =anouncementService.deleteBatch(ids);
        return map;
    }
    /**
     * 添加公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveAnoucement")
    @ResponseBody
    public Map saveAnoucement(@RequestBody Sy14 sy14) throws Exception{
        Map map =anouncementService.saveAnoucement(sy14);
        return map;
    }
    /**
     * 公告详情
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailanouncement")
    @ResponseBody
    public Sy14 detailanouncement(String csy140) throws Exception{
        Sy14 sy14=anouncementService.detailanouncement(csy140);
        return sy14;
    }
}

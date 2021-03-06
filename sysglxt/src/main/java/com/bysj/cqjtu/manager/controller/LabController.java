package com.bysj.cqjtu.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy10;
import com.bysj.cqjtu.manager.domain.Sy11;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.manager.service.LabService;
import com.bysj.cqjtu.util.PageEntity;
/**
 * 实验室管理controller
 * @author fuzhengjun
 *2017年4月7日下午10:30:06
 *
 */
@Controller
@RequestMapping("/lab")
public class LabController {
    
    @Autowired
    private LabService labService;
    
    /**
     * 查询实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabType")
    @ResponseBody
    @SystemControllerLog(description ="查询实验室类型")
    public List<Map> queryLabType() throws Exception{
        List<Map> list=labService.queryLabType();
        return list;
    }
    /**
     * 查询对应类型下的实验室列表
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabList")
    @ResponseBody
    @SystemControllerLog(description ="查询对应类型下的实验室列表")
    public List<Map> queryLabList(String csy100) throws Exception{
        List<Map> list=labService.queryLabList(csy100);
        return list;
    }
    /**
     * 添加实验室信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/addLab")
    @ResponseBody
    @SystemControllerLog(description ="添加实验室信息")
    public Map addLab(@RequestBody Sy11 sy11){        
        try {
            return labService.addLab(sy11);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
        
    }
    /**
     * 删除实验室信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteBatch")
    @ResponseBody
    @SystemControllerLog(description ="删除实验室信息")
    public Map deleteBatch(String ids){
        try {
            return labService.deleteBatch(ids);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 查询实验室具体信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLab")
    @ResponseBody
    @SystemControllerLog(description ="查询实验室具体信息")
    public Map queryLab(String csy110) throws Exception{
        Map map=labService.queryLab(csy110);
        return map;
    }
    /**
     * 修改实验室具体信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateLab")
    @ResponseBody
    @SystemControllerLog(description ="修改实验室具体信息")
    public Map updateLab(@RequestBody Sy11 sy11) {
        try {
            return labService.updateLab(sy11);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;

        }
    }
    /**
     * 验证实验室类型是否存在
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateCsy101")
    @ResponseBody
    @SystemControllerLog(description ="验证实验室类型是否存在")
    public Map validateCsy101(String csy101) throws Exception{
        Map map=labService.validateCsy101(csy101);
        return map;
    }
    /**
     * 添加实验室类型
     * @return
     * @throws Exception
     */
    @SystemControllerLog(description ="添加实验室类型")
    @RequestMapping("/addCsy101")
    @ResponseBody
    public Map addCsy101(@RequestBody Sy10 sy10){
        try {
            return labService.addCsy101(sy10);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 刪除实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteType")
    @ResponseBody
    @SystemControllerLog(description ="删除实验室类型")
    public Map deleteType(String csy100) throws Exception{
        Map map=labService.deleteType(csy100);
        return map;
    }
    /**
     * 判断实验室类型是否可以删除
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateIsOkDelete")
    @ResponseBody
    @SystemControllerLog(description ="判断实验室类型是否可以删除")
    public Map validateIsOkDelete(String csy100){
       try {
        return labService.validateIsOkDelete(csy100);
    } catch (Exception e) {
        Map map =new HashMap();
        map.put("statu", e.getMessage());
        return map;
    }
       
    }
    /**
     * 修改实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateType")
    @ResponseBody
    @SystemControllerLog(description ="修改实验室类型")
    public Map updateType(@RequestBody Sy10 sy10){
        try {
            return labService.updateType(sy10);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 验证实验室是否存在
     * @param sy11
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateLab")
    @ResponseBody
    @SystemControllerLog(description ="验证实验室是否存在")
    public Map validateLab(@RequestBody Sy11 sy11) throws Exception{
        Map map=labService.validateLab(sy11);
        return map;
    }
    /**
     * 查询所有的实验室申请
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabApply")
    @ResponseBody
    @SystemControllerLog(description ="查询所有的实验室申请")
    public PageEntity<Map> queryLabApply(Integer pageNum,Integer pageSize) throws Exception{
        return labService.queryLabApply(pageNum,pageSize);
    }
    /**
     * 获取实验申请数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabApplyCount")
    @ResponseBody
    @SystemControllerLog(description ="获取实验申请数量")
    public Map queryLabApplyCount() throws Exception{
        int i=labService.queryLabApplyCount();
        Map map=new HashMap();
        map.put("count", i);
        return map;
    }
    /**
     * 查询码表中的时间
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryCsy113")
    @ResponseBody
    @SystemControllerLog(description ="查询码表中的时间")
    public List<Map> queryCsy113() throws Exception{
        return labService.queryCsy113();
    }
    /**
     * 审核申请信息
     * @param csy120
     * @return
     * @throws Exception
     */
    @RequestMapping("/shenheinfo")
    @ResponseBody
    @SystemControllerLog(description ="审核申请信息")
    public Map shenheinfo(String csy120) throws Exception{
        return labService.shenheinfo(csy120);
    }
    /**
     * 获取该实验室可以安排的时间
     * @param csy110
     * @return
     * @throws Exception
     */
    @RequestMapping("/getcsy126")
    @ResponseBody
    @SystemControllerLog(description ="获取该实验室可以安排的时间")
    public List<Map> getcsy126(String csy110,String week) throws Exception{
        return labService.getcsy126(csy110,week);
    }
    /**
     * 添加实验室安排
     * @param sy12
     * @return
     * @throws Exception
     */
    @RequestMapping("/addLabApply")
    @ResponseBody
    @SystemControllerLog(description ="添加实验室安排")
    public Map addLabApply(@RequestBody Sy12 sy12){
        try {
            return labService.addLabApply(sy12);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 审核实验室申请信息
     * @param sy12
     * @return
     */
    @RequestMapping("/updateApply")
    @ResponseBody
    @SystemControllerLog(description ="审核实验室申请信息")
    public Map updateApply(@RequestBody Sy12 sy12){
        try {
            return labService.updateApply(sy12);
        } catch (Exception e) {
            Map map =new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
}

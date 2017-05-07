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
    public Map deleteAa10(String aaa100,String aaa102) {
        try {
            return aa10Service.deleteAa10(aaa100,aaa102);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 批量删除码表
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteAa10Batch")
    @ResponseBody
    @SystemControllerLog(description ="批量删除码表")
    public Map deleteAa10Batch(String ids) {
        try {
            return aa10Service.deleteAa10Batch(ids);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
       
    }
    /**
     * 添加码值
     * @param aa10
     * @return
     */
    @RequestMapping("/saveAa10")
    @ResponseBody
    @SystemControllerLog(description ="添加码值")
    public Map saveAa10(@RequestBody Aa10 aa10){
        try {
            return aa10Service.saveAa10(aa10);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
    }
    /**
     * 设置码值名称
     * @param aaa100
     * @return
     * @throws Exception
     */
    @RequestMapping("/setAaa101")
    @ResponseBody
    @SystemControllerLog(description ="设置码值名称")
   public Map setAaa101(String aaa100) throws Exception{
        return aa10Service.setAaa101(aaa100);
   }
    /**
     * 验证码值
     * @param aa10
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateAa10")
    @ResponseBody
    @SystemControllerLog(description ="验证码值")
   public Map validateAa10(@RequestBody Aa10 aa10) throws Exception{
       return aa10Service.setvalidateAa10Aaa101(aa10);
   }
   /**
    * 按条件查询
    * @param aa10
    * @return
    * @throws Exception
    */
    @RequestMapping("/getAa10ByCondtion")
    @ResponseBody
    @SystemControllerLog(description ="按条件查询")
   public List<Aa10> getAa10ByCondtion(@RequestBody Aa10 aa10) throws Exception{     
       return aa10Service.getAa10ByCondtion(aa10);
   }
    /**
     * 查询码值中的week
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryWeek")
    @ResponseBody
    @SystemControllerLog(description ="查询码值中的week")
   public List<Aa10> queryWeek() throws Exception{
       return aa10Service.queryWeek();
   }
}

package com.bysj.cqjtu.index.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.index.domain.Sy01;
import com.bysj.cqjtu.index.domain.Sy15;
import com.bysj.cqjtu.index.service.MenuService;
import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.util.PageEntity;
/**
 * 菜单控制controller
 * @author fuzhengjun
 *2017年3月21日上午9:17:30
 *
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService; 
    
    /**
     * 查询父级菜单
     * @param csy010
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryMenu")
    @ResponseBody
    @SystemControllerLog(description ="查询父级菜单")
    public List<Sy15> queryMenu(int csy010) throws Exception{            
        List list=menuService.queryMenu(csy010);       
        return list;
    }
    /**
     * 查询子级菜单
     * @param csy154
     * @return
     * @throws Exception
     */
    @RequestMapping("/selectMenu")
    @ResponseBody
    @SystemControllerLog(description ="查询子级菜单")
    public List<Sy15> selectMenu(int csy155) throws Exception{
        List list=menuService.queryMenuChilde(csy155);
        return list;
    }
    /**
     * 查询所有菜单
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryAllMenu")
    @ResponseBody
    @SystemControllerLog(description ="查询所有菜单")
    public PageEntity<Sy15> queryAllMenu(Integer pageNum,Integer pageSize) throws Exception{
        PageEntity<Sy15> pageBean=menuService.queryAllMenu(pageNum,pageSize);
        return pageBean;
    }
    /**
     * 按照id删除菜单功能
     * @param csy150
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteMenuByCsy150")
    @ResponseBody
    @SystemControllerLog(description ="按照id删除菜单功能")
    public Map deleteMenuByCsy150(int csy150) {

        try {
            return menuService.deleteMenuByCsy150(csy150);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
        
    }
    /**
     * 批量删除菜单
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteMenuBatch")
    @ResponseBody
    @SystemControllerLog(description ="批量删除菜单")
    public Map deleteMenuBatch(String ids){       
        try {
            return menuService.deleteMenuBatch(ids);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
       
    }
    /**
     * 获取人员类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCsy010")
    @ResponseBody
    @SystemControllerLog(description ="获取人员类型")
    public List<Sy01> getCsy010() throws Exception{        
        return menuService.queryCsy010();
        
    }
    /**
     * 按条件查询功能菜单
     * @param param
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryMenuByCondition")    
    @ResponseBody
    @SystemControllerLog(description ="按照条件查询功能菜单")
    public List<Sy15> queryMenuByCondition(@RequestBody Sy15 sy15) throws Exception{
        List<Sy15> list=menuService.queryMenuByCondition(sy15);
        return list;
    }
    /**
     * 获取父级菜单
     * @return
     * @throws Exception
     */
    @RequestMapping("/getParentMenu")    
    @ResponseBody
    @SystemControllerLog(description ="获取父级菜单")
    public List<Sy15> getParentMenu(Integer csy010) throws Exception{
        return menuService.queryParentMenu(csy010);
    }
    /**
     * 保存菜单信息
     * @param str
     * @return
     * @throws Exception
     */
    @RequestMapping("/savaMenu")    
    @ResponseBody
    @SystemControllerLog(description ="保存菜单信息")
    public Map savaMenu(@RequestBody Sy15 sy15){
        try {
            return menuService.saveMenu(sy15);
        } catch (Exception e) {
            Map map=new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }
       
    }
    /**
     * 修改菜单信息
     * @param csy150
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeMenu")    
    @ResponseBody
    @SystemControllerLog(description ="修改菜单信息")
    public String changeMenu(int csy150) throws Exception{
        return "menuoperate";
    }
    /**
     * 获取用户信息
     * @param csy150
     * @return
     * @throws Exception
     */
    @RequestMapping("/getUserInfo")    
    @ResponseBody
    @SystemControllerLog(description ="获取用户信息")
    public UserMessage getUserInfo(HttpSession session) throws Exception{
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        return userMessage;
    }
    /**
     * 获取菜单数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/getMenuCount")    
    @ResponseBody
    @SystemControllerLog(description ="获取菜单数量")
    public Map getMenuCount() throws Exception{
        int i=menuService.getMenuCount();
        Map map=new HashMap();
        map.put("count", i);
        return map;
    }
}

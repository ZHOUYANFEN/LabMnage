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
    public Map deleteMenuByCsy150(int csy150) throws Exception{
        boolean deleteFlag=menuService.deleteMenuByCsy150(csy150);
        Map map=new HashMap();
        if(deleteFlag==true){
            map.put("statu", 1);
        }else {
            map.put("statu", 2);
        }
        return map;
    }
    /**
     * 批量删除菜单
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteMenuBatch")
    @ResponseBody
    public Map deleteMenuBatch(String ids) throws Exception{
        String []arr=ids.split(",");
        boolean deleteFlag;
        int j=0;
        for(int i=0;i<arr.length;i++){
            deleteFlag=menuService.deleteMenuByCsy150(Integer.parseInt(arr[i]));
            if(deleteFlag==true){
                j++;
            }
        }
        Map map=new HashMap();
        if(j==arr.length){           
            map.put("statu", 1);
        }else {
            map.put("statu", 2);
        }
        return map;
    }
    /**
     * 获取人员类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCsy010")
    @ResponseBody
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
    public Map savaMenu(@RequestBody Sy15 sy15) throws Exception{
        boolean saveFlage= menuService.saveMenu(sy15);
        Map map= new HashMap<>();
        if(saveFlage==true){
            map.put("statu", "1");
        }else{
            map.put("statu", "2");
        }
        return map;
    }
    /**
     * 修改菜单信息
     * @param csy150
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeMenu")    
    @ResponseBody
    public String changeMenu(int csy150) throws Exception{
        return "menuoperate";
    }
    /**
     * 修改菜单信息
     * @param csy150
     * @return
     * @throws Exception
     */
    @RequestMapping("/getUserInfo")    
    @ResponseBody
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
    public Map getMenuCount() throws Exception{
        int i=menuService.getMenuCount();
        Map map=new HashMap();
        map.put("count", i);
        return map;
    }
}

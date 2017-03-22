package com.bysj.cqjtu.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.service.UserManagerService;

/**
 * 管理员用户管理
 * @author fuzhengjun
 *2017年3月22日下午5:00:43
 *
 */
@RequestMapping("/userManager")
@Controller
public class UserManagerController {
    @Autowired
    private UserManagerService userManagerService;
    
    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/getAllUser")
    @ResponseBody
    public List<Sy02> getAllUser()throws Exception{
        return userManagerService.getAllUser();
    }
    /**
     * 删除用户信息
     * @param csy020
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Map deleteUser(int csy020)throws Exception{
       boolean deleteFlag=userManagerService.deleteUser(csy020);
       Map map=new HashMap();
       if(deleteFlag==true){
           map.put("statu", "1");
       }else{
           map.put("statu", "2");
       }
       return map;
    }
    /**
     * 批量删除用户信息
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUserBatch")
    @ResponseBody
    public Map deleteUserBatch(String ids) throws Exception{
        String []arr=ids.split(",");
        boolean deleteFlag;
        int j=0;
        for(int i=0;i<arr.length;i++){
            deleteFlag=userManagerService.deleteUser(Integer.parseInt(arr[i]));
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
    @RequestMapping("/queryMenuByCondition")
    @ResponseBody
    public List<Sy02> queryMenuByCondition(@RequestBody Sy02 sy02) throws Exception{
        System.out.println(sy02);
        List<Sy02> list=userManagerService.queryMenuByCondition(sy02);
        return list;
    }
    @RequestMapping("/addUser")
    @ResponseBody
    public Map addUser(@RequestBody Sy02 sy02) throws Exception{
        Map map=new HashMap();
        List<Sy02> list=userManagerService.isExistUser(sy02);
        if(list.size()>=1){
            map.put("statu", 0);
        }else{
            boolean addFlage=userManagerService.addUser(sy02);            
            if(addFlage==true){
                map.put("statu", 1);
            }else{
                map.put("statu",2);
            }
        }
        return map;
    }
}

package com.bysj.cqjtu.login.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.login.constance.LoginConstance;
import com.bysj.cqjtu.login.service.LoginService;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;

/**
 * 登录controller
 * @author fuzhengjun
 *2017年4月4日下午8:44:35
 *
 */
@Controller
@RequestMapping("/login") 
public class LoginController {
    
    @Autowired
    private LoginService loginService;
    
    /**
     * 登陆
     * @param sy02
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/toLogin")
    @ResponseBody
    public Map login(@Validated @RequestBody Sy02 sy02,HttpSession session) throws Exception{
       List<Sy02> loginList=loginService.login(sy02);
       Map map=new HashMap();
       if(loginList.size()==1){
           UserMessage userMessage=new UserMessage();
           if(sy02.getCsy010()!=LoginConstance.USER_TYPE_MANAGER){
               userMessage=loginService.getUserMessage(loginList.get(0));
           }else {
              userMessage.setSy02(sy02); 
           }           
           session.setAttribute("user", userMessage);
           map.put("url", "index.jsp");
           map.put("statu","success");
       }else{
           map.put("url", "login.jsp");
           map.put("statu","error");
       }
       return map;
    }
    /**
     * 退出
     * @param sy02
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Map logout(HttpSession session)throws Exception{
       Enumeration em = session.getAttributeNames();
       while(em.hasMoreElements()){
           session.removeAttribute(em.nextElement().toString());
       }
       Map map=new HashMap();
       map.put("statu", 1);
       return map;
   }
}

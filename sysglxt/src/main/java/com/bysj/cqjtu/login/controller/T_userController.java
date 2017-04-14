package com.bysj.cqjtu.login.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bysj.cqjtu.manager.pojo.UserMessage;

@Controller
@RequestMapping("/userlogin")
public class T_userController {

    @RequestMapping("/loginAdmin")
    public String login(UserMessage userMessage, Model model){
        Subject subject = SecurityUtils.getSubject() ;
        UsernamePasswordToken token = new UsernamePasswordToken(userMessage.getSy02().getCsy021(),userMessage.getSy02().getCsy022()) ;
        try {
            subject.login(token);
            return "../../index" ;
        }catch (Exception e){
            //这里将异常打印关闭是因为如果登录失败的话会自动抛异常
//            e.printStackTrace();
            model.addAttribute("error","用户名或密码错误") ;
            return "../../login" ;
        }
    }
}

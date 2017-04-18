package com.bysj.cqjtu.login.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bysj.cqjtu.login.constance.LoginConstance;
import com.bysj.cqjtu.login.service.LoginService;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.util.Md5Encoder;

@Controller
@RequestMapping("/userlogin")
public class userLoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/tologin")
    public String login(Sy02 sy02, Model model,HttpSession session) {
        Subject subject = SecurityUtils.getSubject() ;
        UsernamePasswordToken token = new UsernamePasswordToken(sy02.getCsy021(),Md5Encoder.getMD5(sy02.getCsy022())) ;
        try {
            subject.login(token);
            List<Sy02> loginList=loginService.login(sy02);
            UserMessage userMessage=new UserMessage();
            if(sy02.getCsy010()!=LoginConstance.USER_TYPE_MANAGER){
                userMessage=loginService.getUserMessage(loginList.get(0));
            }else {
                userMessage.setSy02(sy02); 
            }           
            session.setAttribute("user", userMessage);
            return "index" ;
        }catch (Exception e){
            //这里将异常打印关闭是因为如果登录失败的话会自动抛异常
//            e.printStackTrace();
            model.addAttribute("error","用户名或密码错误") ;
            return "loginexp" ;
        }
    }
    @RequestMapping("/index")
    public String index() throws Exception{
        return "index";
    }
    
    @RequestMapping("/loginexp")
    public String loginexp(HttpSession session) throws Exception{
        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        return "loginexp";
    }
}

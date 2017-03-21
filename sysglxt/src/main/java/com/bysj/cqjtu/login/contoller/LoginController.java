package com.bysj.cqjtu.login.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login") 
public class LoginController {
    
    @RequestMapping(value="/toLogin",method=RequestMethod.POST)
    public ModelAndView login(String username,String password,String csy010) throws Exception{
       System.out.println(username+"===="+csy010+"===="+password);
       ModelAndView modelAndView=new ModelAndView();
       modelAndView.addObject("message", "success");
       return modelAndView;
    }
    @RequestMapping(value="/index")
    public ModelAndView index() throws Exception{
        ModelAndView modelAndView = new ModelAndView();   
        modelAndView.setViewName("/index"); 
        return modelAndView;
    }
}

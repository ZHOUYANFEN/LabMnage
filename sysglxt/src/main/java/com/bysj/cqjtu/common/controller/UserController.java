package com.bysj.cqjtu.common.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.common.service.UserService;
import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.pojo.UserMessage;

/**
 * usercntroller
 * @author fuzhengjun
 *2017年4月5日下午3:19:47
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    /**
     * 验证user的账号密码
     * @param sy02
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateUser")
    @ResponseBody
    @SystemControllerLog(description ="验证用户账号密码")
    public Map validateUser(@RequestBody Sy02 sy02,HttpSession session) throws Exception{
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        sy02.setCsy010(userMessage.getSy02().getCsy010());
        Map map=userService.validateUser(sy02);
        return map;
    }
    /**
     * 修改密码
     * @param sy02_new
     * @return
     * @throws Exception
     */
    @RequestMapping("/changePassword")
    @ResponseBody
    @SystemControllerLog(description ="修改密码")
    public Map changePassword(@RequestBody Sy02 sy02_new,HttpSession session) throws Exception{
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        sy02_new.setCsy010(userMessage.getSy02().getCsy010());
        Map map=userService.changePassword(sy02_new);
        return map;
    }
    /**
     * 获取用户信息
     * @param 
     * @return
     * @throws Exception
     */
    @RequestMapping("/getUserMessage")
    @ResponseBody
    @SystemControllerLog(description ="获取用户信息")
    public UserMessage getUserMessage(HttpSession session) throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        return userMessage;
    }
}

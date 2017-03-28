package com.bysj.cqjtu.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.service.StudentService;

/**
 * 学生controller
 * @author fuzhengjun
 *2017年3月27日下午10:08:45
 *
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    
    /**
     * 获取课程表
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/syllabus")
    @ResponseBody
    public List<Map> getSyllabus(HttpSession session) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        //获取班级
        
        UserMessage userMessage=new UserMessage();
        
        String csy043="计软二班";
        Sy04 sy04=new Sy04();
        sy04.setCsy043(csy043);
        userMessage.setSy04(sy04);
        
        
        List<Map> list=studentService.getSyllabus(userMessage);
        return list;
    }
    @RequestMapping("/queryExpArrange")
    @ResponseBody
    public List<Map> queryExpArrange(HttpSession session) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        Sy04 sy04=new Sy04();
        sy04.setCsy040(csy040);
        userMessage.setSy04(sy04);
        
        List<Map> list =studentService.queryExpArrange(userMessage);
        return list;
    }
}

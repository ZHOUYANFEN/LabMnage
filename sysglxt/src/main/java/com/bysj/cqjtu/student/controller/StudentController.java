package com.bysj.cqjtu.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
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
    /**
     * 获取实验安排的科目
     * @param session
     * @return
     * @throws Exception
     */
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
    /**
     * 获取具体实验安排
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrangeList")
    @ResponseBody
    public List<Sy08> queryExpArrangeList(HttpSession session,String csy060) throws Exception{
      //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
       /* Sy04 sy04=new Sy04();
        sy04.setCsy040(csy040);
        userMessage.setSy04(sy04);
        
        
        Sy06 sy06=new Sy06();
        sy06.setCsy060(csy060);
        userMessage.setSy04(sy04);*/
        Sy08 sy08=new Sy08();
        sy08.setCsy040(csy040);
        sy08.setCsy060(csy060);
        List<Sy08> list =studentService.queryExpArrangeList(sy08);
        return list;
        
    }
    /**
     * 获取实验内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrangeContent")
    @ResponseBody
    public List<Map> queryExpArrangeContent(HttpSession session,Integer csy080) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        Sy08 sy08=new Sy08();
        sy08.setCsy040(csy040);
        sy08.setCsy080(csy080);
        List<Map> list =studentService.queryExpArrangeContent(sy08);
        return list;
        
    }
    /**
     * 保存实验完成内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveExp")
    @ResponseBody
    public Map saveExp(HttpSession session,@RequestBody Sy09 sy09) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        sy09.setCsy040(csy040);
        return studentService.saveExp(sy09);        
    }
    /**
     * 保存实验完成内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryGrade")
    @ResponseBody
    public List<Map> queryGrade() throws Exception{
      //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        Sy07 sy07=new Sy07();
        String csy040="123456";
        sy07.setCsy040(csy040);
        return studentService.queryGrade(sy07);
    }
}

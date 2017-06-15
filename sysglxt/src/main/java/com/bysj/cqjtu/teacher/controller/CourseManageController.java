package com.bysj.cqjtu.teacher.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.service.CourseManageService;
import com.bysj.cqjtu.util.PageEntity;
/**
 * 教师课程管理
 * @author fuzhengjun
 *2017年5月14日下午11:57:40
 *
 */

@Controller
@RequestMapping("/courseManage")
public class CourseManageController {
    
    @Autowired 
    private CourseManageService courseManageService;
    /**
     * 查询课程数量
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCourseCount")
    @ResponseBody
    @SystemControllerLog(description ="查询课程数量")
    public Map getCourseCount(HttpSession session)throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        Map map = new HashMap();
        map.put("count",courseManageService.getCourseCount(sy05));
        return map;
    }
    
    /**
     * 查询课程信息
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCourse")
    @ResponseBody
    @SystemControllerLog(description ="查询课程信息")
    public  PageEntity<Map> getCourse(HttpSession session,Integer pageNum,Integer pageSize) throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        return courseManageService.getCourse(sy05,pageNum,pageSize);
    }
    
    /**
     * 按条件查询课程信息
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCourseByCondition")
    @ResponseBody
    @SystemControllerLog(description ="按条件查询课程信息")
    public  PageEntity<Map> getCourseByCondition(HttpSession session,String csy061,Integer pageNum,Integer pageSize) throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        return courseManageService.getCourseByCondition(sy05,csy061,pageNum,pageSize);
    }
    
    /**
     * 查询课程数量
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCourseCountByCondition")
    @ResponseBody
    @SystemControllerLog(description ="查询课程数量")
    public Map getCourseCountByCondition(HttpSession session,String csy061)throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        Map map = new HashMap();
        map.put("count",courseManageService.getCourseCountByCondition(sy05,csy061));
        return map;
    }
    /**
     * 添加课程
     * @param sy06
     * @return
     */
    @RequestMapping("/addCourse")   
    @ResponseBody
    @SystemControllerLog(description ="添加课程")
    public Map addCourse(@RequestBody Sy06 sy06,HttpSession session){
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        sy06.setCsy050(sy05.getCsy050().toString());
        Map map=new HashMap();
        try {
            map = courseManageService.addCourse(sy06);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("statu", TeacherConstance.INSERT_INTOSY06_ERROR);
        }
        return map;
    }
    /**
     * 验证课程
     * @param sy06
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateCourse")   
    @ResponseBody
    @SystemControllerLog(description ="验证课程")
    public Map validateCourse(@RequestBody Sy06 sy06,HttpSession session) throws Exception{
        UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy05 sy05=userMessage.getSy05();
        sy06.setCsy050(sy05.getCsy050().toString());
        Map map=new HashMap();
        map = courseManageService.validateCourse(sy06);
        return map;
    }
}

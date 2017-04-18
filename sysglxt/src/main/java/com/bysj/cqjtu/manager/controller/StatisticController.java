package com.bysj.cqjtu.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.service.StatisticService;

/**
 * 统计controller
 * @author fuzhengjun
 *2017年4月6日下午3:58:04
 *
 */
@Controller
@RequestMapping("/statistic")
public class StatisticController {
    @Autowired
    private StatisticService statisticService;
    
    /**
     * 实验课程统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/coursestatistics")
    @ResponseBody
    @SystemControllerLog(description ="实验课程统计")
    public List<Map> coursestatistics() throws Exception{
        List<Map> list=statisticService.coursestatistics();
        return list;
    }
    
    /**
     * 实验成绩统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/gradestatistics")
    @ResponseBody
    @SystemControllerLog(description ="实验成绩统计")
    //TODO:有bug 班级和学科同时分组查询 需要查两次
    public List<Map> gradestatistics() throws Exception{
        List<Map> list=statisticService.gradestatistics();
        return list;
    }
    /**
     * 查询各个学院的课程安排
     * @return
     * @throws Exception
     */
    @RequestMapping("/courselist")
    @ResponseBody
    @SystemControllerLog(description ="查询呵呵学院的课程安排")
    public List<Map> courselist(String csy052) throws Exception{
        List<Map> list=statisticService.courselist(csy052);
        return list;
    }
    /**
     * 查询各个班级每个课程的平均成绩
     * @return
     * @throws Exception
     */
    @RequestMapping("/classGradestatistics")
    @ResponseBody
    @SystemControllerLog(description ="查询各个班级每个课程的平均成绩")
    public List<Map> classGradestatistics() throws Exception{
        List<Map> list=statisticService.classGradestatistics();
        return list;
    }
    /**
     * 查询各个班级每个人的平均成绩
     * @return
     * @throws Exception
     */
    @RequestMapping("/classpeopleGradestatistics")
    @ResponseBody
    @SystemControllerLog(description ="查询各个班级每个人的平均成绩")
    public List<Map> classpeopleGradestatistics(String csy043,String csy060) throws Exception{
        List<Map> list=statisticService.classpeopleGradestatistics(csy043,csy060);
        return list;
    }
    /**
     * 学院实验安排统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/expArrangeStatistics")
    @ResponseBody
    @SystemControllerLog(description ="学院实验安排统计")
    public List<Map> expArrangeStatistics() throws Exception{
        List<Map> list=statisticService.expArrangeStatistics();
        return list;
    }
    /**
     * 教师实验安排
     * @return
     * @throws Exception
     */
    @RequestMapping("/expListStatistics")
    @ResponseBody
    @SystemControllerLog(description ="教师实验安排统计")
    public List<Map> expListStatistics(String csy052) throws Exception{
        List<Map> list=statisticService.expListStatistics(csy052);
        return list;
    }
    /**
     * 实验室统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/labStatistics")
    @ResponseBody
    @SystemControllerLog(description ="实验室统计")
    public List<Map> labStatistics() throws Exception{
        List<Map> list=statisticService.labStatistics();
        return list;
    }
    /**
     * 实验室列表统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/labList")
    @ResponseBody
    @SystemControllerLog(description ="实验室列表统计")
    public List<Map> labList(String csy100) throws Exception{
        List<Map> list=statisticService.labList(csy100);
        return list;
    }
    /**
     * 实验室安排统计
     * @return
     * @throws Exception
     */
    @RequestMapping("/labArrangeStatistics")
    @ResponseBody
    @SystemControllerLog(description ="实验室安排统计")
    public List<Map> labArrangeStatistics() throws Exception{
        List<Map> list=statisticService.labArrangeStatistics();
        return list;
    }
    /**
     * 按照人员类型统计实验室的安排情况列表
     * @param csy010
     * @return
     * @throws Exception
     */
    @RequestMapping("/labArrangeListStatistics")
    @ResponseBody
    @SystemControllerLog(description ="按照人员类型统计实验室的安排情况列表")
    public List<Map> labArrangeListStatistics(String csy010) throws Exception{
        List<Map> list=statisticService.labArrangeListStatistics(csy010);
        return list;
    }
}

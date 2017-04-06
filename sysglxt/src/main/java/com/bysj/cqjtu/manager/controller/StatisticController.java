package com.bysj.cqjtu.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<Map> gradestatistics() throws Exception{
        List<Map> list=statisticService.gradestatistics();
        return list;
    }
}

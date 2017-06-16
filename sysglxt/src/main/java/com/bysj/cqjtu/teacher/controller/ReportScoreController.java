package com.bysj.cqjtu.teacher.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.teacher.service.ExperimentService;

@Controller
@RequestMapping("/reportScore")
public class ReportScoreController {
	
	@Autowired
	private ExperimentService expService;
	
	/**
	 * 查询出学生完成的实验报告情况
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryReport")
	@ResponseBody
	public Map queryReport(HttpSession session){
		Map<String,List> map = new HashMap<>();
		//查询实验报告
		map = expService.queryReport();
		return map;
	}
	
	/**
	 * 给学生实验报告评分
	 */
	@RequestMapping("/queryStudentReport")
	@ResponseBody
	@SystemControllerLog(description ="给学生实验报告评分")
	public Map queryStudentReport(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		String id = request.getParameter("id");
		//提交的实验
		Sy09 result = expService.queryBykey(Integer.parseInt(id));
		Sy04 student = expService.queryStudent(result.getCsy040());
		map.put("Sy09", result);
		map.put("Sy04", student);
		return map;
		
	}
	
	/**
	 * 修改实验分数
	 * @param sy09
	 * @param request
	 */
	@RequestMapping("/updateStudentReport")
	@ResponseBody
	@SystemControllerLog(description ="更新学生实验报告")
	public Map updateStudentReport(@RequestBody Sy09 sy09, HttpServletRequest request){
		Map<String,String> map = new HashMap<>();
		//修改实验分数
		int i = expService.updateReposrt(sy09);
		if(i==0){
			map.put("Status", "评分失败");
		}if(i!=0){
			map.put("Status", "评分成功");
		}
		return map;
		
	}
	
	/**
	 * 查询特定的学生
	 */
	@RequestMapping("/queryStudentReportByid")
	@ResponseBody
	@SystemControllerLog(description ="查询特定的学生")
	public Map queryStudentReportByid(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		String id = request.getParameter("id");
		map = expService.queryReportByid(Integer.parseInt(id));
		return map;
		
	}
}

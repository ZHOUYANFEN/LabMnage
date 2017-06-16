package com.bysj.cqjtu.teacher.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.service.ExperimentService;


@Controller
@RequestMapping("/classScore")
public class ClassScoreController {
	
	@Autowired
	private ExperimentService expService;
	
	/**
	 * 查詢學生的課程以及分數
	 * @return
	 */
	@RequestMapping("/queryClassScore")
	@ResponseBody
	public Map queryClassScore(){
		Map<String,List> map = new HashMap<>();
		//查询课程成绩
		map = expService.queryClass();
		return map;
	}
	
	/**
	 * 给学生实验课程评分
	 */
	@RequestMapping("/queryStudentClass")
	@ResponseBody
	@SystemControllerLog(description ="给学生实验课程评分")
	public Map queryStudentClass(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		String items = request.getParameter("additems");
		String []item = items.split(",");
		Sy07 record = new Sy07();
		record.setCsy040(item[0]);
		record.setCsy060(item[1]);
		map = expService.queryStudentClass(record);
		return map;
		
	}
	
	/**
	 * 修改课程分数
	 * @param sy09
	 * @param request
	 */
	@RequestMapping("/updateStudentClass")
	@ResponseBody
	@SystemControllerLog(description ="更新学生课程")
	public Map updateStudentClass(HttpServletRequest request){
		Map<String,String> map = new HashMap<>();
		String items = request.getParameter("items");
		String []item = items.split(",");
		Sy07 score = new Sy07();
		score.setCsy040(item[0]);
		score.setCsy060(item[1]);
		score.setCsy071(Integer.parseInt(item[2]));
		int i = expService.insert(score);
		if(i==0){
			map.put("Status", TeacherConstance.CLASSSCORE_ERROR);
		}if(i!=0){
			map.put("Status", TeacherConstance.CLASSSCORE_SUCCESS);
		}
		return map;
		
	}
	
	/**
	 * 查询特定的课程的学生
	 * @return
	 */
	@RequestMapping("/queryStudentClassByid")
	@ResponseBody
	public Map queryStudentClassByid(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		String id = request.getParameter("id");
		map = expService.queryClassByid(Integer.parseInt(id));
		return map;
	}

}

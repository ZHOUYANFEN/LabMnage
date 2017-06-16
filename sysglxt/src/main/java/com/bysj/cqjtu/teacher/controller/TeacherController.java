package com.bysj.cqjtu.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.service.DownLoadResourceService;
import com.bysj.cqjtu.teacher.service.ExperimentService;
import com.bysj.cqjtu.teacher.service.LabApplyService;
import com.bysj.cqjtu.teacher.service.StudentManageService;
import com.bysj.cqjtu.teacher.service.TeacherService;
import com.bysj.cqjtu.util.PageEntity;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private LabApplyService lab;
	@Autowired
	private ExperimentService expService;
	@Autowired
	private StudentManageService studentManageService;
	@Autowired
	private DownLoadResourceService downLoadResourceService;
	
	@RequestMapping("/query")
	@ResponseBody
	@SystemControllerLog(description ="查询教师列表")
	public List<Sy05> queryMsg (Model model) throws Exception {
		List<Sy05> list = teacherService.getTeacherList();
		model.addAttribute("list", list);
		return list;
	}

	@RequestMapping("/studentExp")
	@ResponseBody
	public void studentExp(Model model,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		List<Sy08Exp> list = new ArrayList<>();
		RequestDispatcher rd = request.getRequestDispatcher("/ExpStudent.jsp");  
        rd.forward(request, response);  
	}
	
	/**
	 * 教师查看实验详情，可查看学生完成实验的情况并进行评分；
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryStudentExp")
	@ResponseBody
	public List<Sy08Exp> queryStudentExp(HttpSession session){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
		List<Sy08Exp> list = new ArrayList<>();
		list = expService.queryExp(userMessage.getSy05().getCsy050());
		session.setAttribute("list", list);
		return list;
	}	
	
	/**
	 * 验证申请
	 * @param sy12
	 * @param session
	 * @return
	 */
	@RequestMapping("/validateArrage")
    @ResponseBody
    @SystemControllerLog(description="验证申请")
	public Map validateArrage(@RequestBody Sy12 sy12,HttpSession session) throws Exception{
	    UserMessage userMassage = (UserMessage)session.getAttribute("user");
        int userId =userMassage.getSy02().getCsy020();
        sy12.setCsy020(String.valueOf(userId));
        return lab.validateArrage(sy12);
	}
	/**
	 * 获取所有实验课程
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryCourse")
    @ResponseBody
    @SystemControllerLog(description="获取所有实验课程")
	public List<Map> queryCourse(HttpSession session) throws Exception{
	    UserMessage userMassage = (UserMessage)session.getAttribute("user");
        int csy050 =userMassage.getSy05().getCsy050();
        Sy05 sy05 = new Sy05();
        sy05.setCsy050(csy050);
        return studentManageService.queryCourse(sy05);
	}








    

}

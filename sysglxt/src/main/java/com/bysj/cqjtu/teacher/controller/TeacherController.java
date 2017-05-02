package com.bysj.cqjtu.teacher.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.dto.ReportManager;
import com.bysj.cqjtu.teacher.service.ExperimentService;
import com.bysj.cqjtu.teacher.service.LabApplyService;
import com.bysj.cqjtu.teacher.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private LabApplyService lab;
	@Autowired
	private ExperimentService expService;
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Sy05> queryMsg (Model model) throws Exception {
		List<Sy05> list = teacherService.getTeacherList();
		model.addAttribute("list", list);
		return list;
	}

	
	/**
	 * 查询实验室相关信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryLab")
	@ResponseBody
	public List<Map> queryList(HttpSession session){
		List<Map> list = new ArrayList<>();
		list = lab.queryLabList();
		//session.setAttribute("list", list);
		return list;
	}
	/**
	 * 通过id查询实验室相关信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryById")
	@ResponseBody
	public Map queryByid(HttpServletRequest request){
		//Sy11 labMsg = new Sy11();
	    Map map= new HashMap();
		String idStr = request.getParameter("id");
		map=lab.queryLabById(Integer.parseInt(idStr));
		return map;
	}
	
	/**
	 * 申请实验室后更新数据
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addLabArrange")
	@ResponseBody
	public void addLabArrange(@RequestBody Sy12 sy12,HttpSession session) throws IOException{
		UserMessage userMassage = (UserMessage)session.getAttribute("user");
		int userId =userMassage.getSy02().getCsy020();
		sy12.setCsy020(String.valueOf(userId));
		lab.addLabArrange(sy12);
	}
	/**
	 * 查询出实验安排
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryExp")
	@ResponseBody
	public List<Sy08Exp> queryExperiment(HttpSession session){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
		List<Sy08Exp> list = new ArrayList<>();
		list = expService.queryExp(userMessage.getSy05().getCsy050());
		//session.setAttribute("list", list);
		return list;
	}
	
	@RequestMapping("/queryEdit")
	@ResponseBody
	public LabManager queryEdit(HttpServletRequest request, HttpSession session){
		UserMessage userMassage = (UserMessage)session.getAttribute("user");
		LabManager labManager = new LabManager();
		String id  = request.getParameter("id");
		int userId =userMassage.getSy02().getCsy020();
//		System.out.println(userId);
		int i = Integer.parseInt(id);
		labManager = lab.queryEdit(i,userId);
		if(labManager.getSy12().getCsy125()==null){
			labManager.getSy12().setCsy125(Byte.parseByte("0"));
		}
		return labManager;
		
	}
	
	/**
	 * 查询出学生完成的实验报告情况
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryReport")
	@ResponseBody
	public List<Sy09> queryReport(HttpSession session){
		List<ReportManager> list = new ArrayList<>();
		List<Sy09> list09 = new ArrayList<>();
		//查询实验报告
		list09 = expService.queryReport();
		return list09;
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
	 * 给学生实验报告评分
	 */
	@RequestMapping("/queryStudentReport")
	@ResponseBody
	public Sy09 queryStudentReport(HttpServletRequest request){
		String id = request.getParameter("id");
		//提交的实验
		Sy09 result = expService.queryBykey(Integer.parseInt(id));
		return result;
		
	}
	@RequestMapping("/updateStudentReport")
	@ResponseBody
	public void updateStudentReport(@RequestBody Sy09 sy09, HttpServletRequest request){
		System.out.println("ididi="+sy09.getCsy094());
		System.out.println("is="+sy09.getCsy090());
		//修改实验分数
		expService.updateReposrt(sy09);
		
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
	
}

package com.bysj.cqjtu.teacher.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.teacher.service.ExperimentService;
import com.bysj.cqjtu.teacher.service.TeacherService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/expManage")
public class ExpManagerController {

	@Autowired
	private ExperimentService expManageService;
	
	@Autowired
	private TeacherService teacherManageService;
	
	/**
	 * 查出课程名
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryExpName")
	@ResponseBody
	@SystemControllerLog(description ="查询出实验安排")
	public List<String> queryExpName(HttpSession session){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
	    List<String> result = new ArrayList<>();
		List<Sy08Exp> list = new ArrayList<>();
		list = expManageService.queryExp(userMessage.getSy05().getCsy050());
		for(Sy08Exp s : list){
			result.add(s.getCsy061());
		}
		//去重
		HashSet<String> hash = new HashSet<>(result);
		result.clear();
		result.addAll(hash);
		for(String name:result){
			System.out.println("课程名"+name);
		}
		return result;
	}
	
	/**
	 * 查询出实验安排
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryExp")
	@ResponseBody
	@SystemControllerLog(description ="查询出实验安排")
	public List<Sy08Exp> queryExperiment(HttpSession session){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
		List<Sy08Exp> list = new ArrayList<>();
		System.out.println("教师id"+userMessage.getSy05().getCsy050());
		list = expManageService.queryExp(userMessage.getSy05().getCsy050());
		return list;
	}
	
	/**
	 * 查询出实验安排
	 * @param session
	 * @return
	 */
	@RequestMapping("/queryExp2")
	@ResponseBody
	@SystemControllerLog(description ="查询出实验安排")
	public PageEntity<Sy08Exp> queryExperiment2(HttpSession session,Integer pageNum, Integer pageSize){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
		List<Sy08Exp> list = new ArrayList<>();
		System.out.println("教师id"+userMessage.getSy05().getCsy050());
	    PageHelper.startPage(pageNum, pageSize);
	    PageEntity<Sy08Exp> pageBean = new PageEntity<Sy08Exp>();
		list = expManageService.queryExp(userMessage.getSy05().getCsy050());
        pageBean.setList(list);
        pageBean.setCount(list.size());
		return pageBean;
	}
	
	/**
	 * 删除实验安排
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteExp")
	@ResponseBody
	public Map deleteExp(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> map = new HashMap<>();
		try{
			String items = request.getParameter("delitems");
			String []item = items.split(",");
			for(int i=0;i<item.length;i++){
				System.out.println(item[i]);
			}
			int num = expManageService.deleteExp(item);
			if(num>0){
				map.put("status", "删除成功");
				
			}else{
				map.put("status", "删除实验失败");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
		
	}
	
	/**
	 * 添加实验安排
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("/addExp")
	@ResponseBody
	public Map addExp(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		Map<String,String> map = new HashMap<>();
		try{
		    UserMessage userMassage = (UserMessage)session.getAttribute("user");
	        int userId =userMassage.getSy02().getCsy020();
	        System.out.println("userId"+userId);
	        Sy05 teacher = teacherManageService.queryTeacher(userId);
	        //教师id
	        int csy050 = teacher.getCsy050();
			String items = request.getParameter("additems");
			String []item = items.split(",");
			Sy06 classResult = expManageService.queryClassByName(item[0]);
			//课程id
			int csy060 = classResult.getCsy060();
			Sy08 exp = new Sy08();
			exp.setCsy050(String.valueOf(csy050));
			exp.setCsy060(String.valueOf(csy060));
			exp.setCsy081(item[1]);
			exp.setCsy082(item[4]);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			exp.setCsy083(format.parse(item[2]));
			exp.setCsy084(format.parse(item[3]));
			exp.setCsy085((byte)0);
			int num=expManageService.addExp(exp);
			if(num>0){
				map.put("status", "添加成功");
			}else{
				map.put("status", "添加实验安排失败");
			}
			
			for(int i=0;i<item.length;i++){
				System.out.println(item[i]);
			}
			return map;
		}catch(Exception e){
			e.printStackTrace();
			return map;
		}
		
	}
	
	/**
	 * 搜索课程，模糊查询
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("/searchExp")
	@ResponseBody
	public Map searchExp(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		Map<String,List> map = new HashMap<>();
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
		int id = userMessage.getSy05().getCsy050();
		List<Sy08Exp> resultList = new ArrayList<>();
		String items = request.getParameter("searchitems");
		List<Sy08Exp> list = expManageService.searchExp(items);
		System.out.println(id);
		if(list.size()!=0){
			for(Sy08Exp s :list ){
				if(s.getCsy050().equals(String.valueOf(id))){
					resultList.add(s);
				}
				System.out.println("结果"+s.getCsy050()+"  "+s.getCsy061());
			}
			map.put("result", resultList);
		}else{
			List<String> errorList = new ArrayList<>();
			errorList.add("没有任何该课程信息");
			map.put("error", errorList);
		}
		return map;
	}
}

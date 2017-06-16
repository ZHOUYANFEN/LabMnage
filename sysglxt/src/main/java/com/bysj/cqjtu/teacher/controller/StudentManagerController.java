package com.bysj.cqjtu.teacher.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.service.StudentManageService;


@Controller
@RequestMapping("/studentManager")
public class StudentManagerController {
	
	@Autowired
	private StudentManageService studentManageService;
	
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
	
	/**
	 * 按照实验课程查询学生列表
	 * @param csy060
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryStudentListByCourse")
    @ResponseBody
    @SystemControllerLog(description="按照实验课程查询学生列表")
	public List<Sy04> queryStudentListByCourse(String csy060) throws Exception{
	    return studentManageService.queryStudentListByCourse(csy060);
	}
	
	/**
	 * 获取所有的学院
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryCollege")
    @ResponseBody
    @SystemControllerLog(description="获取所有的学院")
	public List<Map> queryCollege() throws Exception{
	    return studentManageService.queryCollege();
	}
	
	/**
	 * 获取学院下对应的班级
	 * @param aaa105
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryClass")
    @ResponseBody
    @SystemControllerLog(description="获取学院下对应的班级")
	public List<Map> queryClass(String aaa105) throws Exception{
	    return studentManageService.queryClass(aaa105);
	}
	
	/**
	 * 安装班级获取学生列表
	 * @param csy043
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryStudentList")
    @ResponseBody
    @SystemControllerLog(description="安装班级获取学生列表")
	public List<Sy04> queryStudentList(String csy043) throws Exception{
	    return studentManageService.queryStudentList(csy043);
	}
	
	/**
	 * 删除该课程的学生
	 * @param sy07
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteStudent")
    @ResponseBody
    @SystemControllerLog(description="删除该课程的学生")
	public Map deleteStudent(@RequestBody Sy07 sy07){
	    try {
            return studentManageService.deleteStudent(sy07);
        } catch (Exception e) {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.DELETE_STUDENT_INCOURCE_FAIL);
            return map;
        }
	}
	
	/**
	 * 验证是否已经有该学生
	 * @param ids
	 * @param csy060
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/validateStudentInCource")
    @ResponseBody
    @SystemControllerLog(description="验证是否已经有该学生")
	public Map validateStudentInCource(String ids,String csy060) throws Exception{
	    return studentManageService.validateStudentInCource(ids,csy060);
	}
	
	/**
	 * 添加学生到课程
	 * @param ids
	 * @param csy060
	 * @return
	 */
	@RequestMapping("/addStudentToCourse")
    @ResponseBody
    @SystemControllerLog(description="添加学生到课程")
	public Map addStudentToCourse(String ids,String csy060){
	    try {
            return studentManageService.addStudentToCourse(ids,csy060);
        } catch (Exception e) {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.ADD_STUDENT_INCOURCE_FAIL);
            return map;
        }
	}
	
	/**
     * 批量删除课程下的学生
     * @param ids
     * @param csy060
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteStudentInCourseBatch")
    @ResponseBody
    @SystemControllerLog(description="验证是否已经有该学生")
	public Map deleteStudentInCourseBatch(String ids,String csy060){
	    try {
            return studentManageService.deleteStudentInCourseBatch(ids,csy060);
        } catch (Exception e) {
            Map map = new HashMap();
            map.put("statu", TeacherConstance.DELETE_STUDENT_INCOURCE_FAIL);
            return map;
        }
	}

}

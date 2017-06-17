package com.bysj.cqjtu.teacher.controller;

import java.io.IOException;
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
import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.service.LabApplyService;
import com.bysj.cqjtu.util.PageEntity;

@Controller
@RequestMapping("/labManage")
public class LabApplyController {
	
	@Autowired
	private LabApplyService labService;
	
	/**
	 * 查询实验室数量
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryLabCount")
    @ResponseBody
    @SystemControllerLog(description ="查询实验室数量")
	public Map queryLabCount(HttpSession session,Integer csy125) throws Exception{
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
        Sy02 sy02 =userMessage.getSy02();
	    return labService.queryLabCount(csy125,sy02);
	} 
	
	/**
	 * 查询实验室相关信息
	 * @param session
	 * @param pageNum
	 * @param pageSize
	 * @param csy125
	 * @return
	 */
	@RequestMapping("/queryLab")
	@ResponseBody
	@SystemControllerLog(description ="查询实验室相关信息")
	public PageEntity<Map> queryList(HttpSession session,Integer pageNum, Integer pageSize,Integer csy125){
	    UserMessage userMessage = (UserMessage) session.getAttribute("user");
	    Sy02 sy02 =userMessage.getSy02();
	    return labService.queryLabList(pageNum,pageSize,csy125,sy02);

	}
	
	/**
	 * 通过id查询实验室相关信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryById")
	@ResponseBody
	@SystemControllerLog(description ="通过id查询实验室相关信息")
	public Map queryByid(HttpServletRequest request){
		//Sy11 labMsg = new Sy11();
	    Map map= new HashMap();
		String idStr = request.getParameter("id");
		map=labService.queryLabById(Integer.parseInt(idStr));
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
	@SystemControllerLog(description ="申请实验室")
	public Map addLabArrange(@RequestBody Sy12 sy12,HttpSession session) {
		UserMessage userMassage = (UserMessage)session.getAttribute("user");
		int userId =userMassage.getSy02().getCsy020();
		sy12.setCsy020(String.valueOf(userId));
		try {
            return labService.addLabArrange(sy12);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", OperateStatu.INSERT_SY12_FAIL);
            return map;
        }
	}
	
	/**
	 * 查看实验室详细信息
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryEdit")
	@ResponseBody
	@SystemControllerLog(description ="查询详细信息")
	public LabManager queryEdit(HttpServletRequest request, HttpSession session) throws Exception{
		UserMessage userMassage = (UserMessage)session.getAttribute("user");
		LabManager labManager = new LabManager();
		String id  = request.getParameter("id");
		int userId =userMassage.getSy02().getCsy020();
//		System.out.println(userId);
		int i = Integer.parseInt(id);
		labManager = labService.queryEdit(i,userId);
		if(labManager.getSy12().getCsy125()==null){
			labManager.getSy12().setCsy125(Byte.parseByte("0"));
		}
		return labManager;
		
	}
	/**
	 * 按条件查询
	 * @param csy111
	 * @param csy101
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryLabCountByCondition")
	@ResponseBody
	@SystemControllerLog(description ="按条件查询")
	public List<Map> queryLabCountByCondition(String csy111,String csy101) throws Exception{
	    return labService.queryLabCountByCondition(csy111,csy101);
	}

}

package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy10Mapper;
import com.bysj.cqjtu.manager.dao.Sy11Mapper;
import com.bysj.cqjtu.manager.dao.Sy12Mapper;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.service.LabApplyService;


@Service
public  class LabApplyServiceImpl implements LabApplyService {

	@Resource
	private Sy11Mapper sy11;
	@Resource
	private Sy12Mapper sy12;
	@Resource
	private Sy10Mapper sy10;
	
	@Override
	public List<Map> queryLabList() {
		List<Map> list = new ArrayList<>();
		list = sy11.queryLabMsg();
		return list;
	}

	@Override
	public Map queryLabById(int id) {
		//Sy11 lab = new Sy11();
		return sy11.selectByPrimaryKey(id);
		//return lab;
	}



	@Override
	public LabManager queryEdit(int id,int userId) {
		LabManager lab = new LabManager();
		Sy12 sy12Result = sy12.selectByKey(id,userId);
		//Sy11 sy11Result = sy11.selectByPrimaryKey(id);
		//Sy10 sy10Result = sy10.selectByPrimaryKey(sy11Result.getCsy110());
		//lab.setSy10(sy10Result);
		//lab.setSy11(sy11Result);
		lab.setSy12(sy12Result);
		return lab;
	}

	/**
	 * 添加一个实验室的申请，提交一个安排
	 */
	@Override
	public void addLabArrange(Sy12 record) {

		sy12.insertSelective(record);		
	}







}

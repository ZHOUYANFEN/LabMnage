package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.student.dao.Sy13Mapper;
import com.bysj.cqjtu.student.dao.Sy16Mapper;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.student.domain.Sy16;
import com.bysj.cqjtu.teacher.service.DownLoadResourceService;

@Service
public class DownLoadResourceServiceImpl implements DownLoadResourceService{
	
	@Autowired
	private Sy13Mapper sy13;
	
	@Autowired
	private Sy02Mapper sy02;
	
	@Autowired
	private Sy16Mapper sy16;
	

	/**
	 * 查询出所有资源
	 */
	@Override
	public Map<String,List> queryResource() {
		Map<String,List> resultMap = new HashMap<>();
		//查询资源列表
		List<Sy13> resourceList = new ArrayList<>();
		resourceList = sy13.queryResource();
		//人员列表，查询上传人的资料
		List<Sy02> personList = new ArrayList<>();
		//资源类型数据表
		List<Sy16> typeList = new ArrayList<>();
		//根据资源列表查询上传人姓名
		for(Sy13 s : resourceList) {
			Sy02 person = new Sy02();
			Sy16 type = new Sy16();
			int id =s.getCsy020();
			person = sy02.selectByPrimaryKey(id);
			personList.add(person);
			int typeId = s.getCsy160();
			Byte csy160 = (byte)typeId;
			type = sy16.selectByPrimaryKey(csy160);
			typeList.add(type);
		}
		resultMap.put("Sy13", resourceList);
		resultMap.put("Sy02", personList);
		resultMap.put("Sy16", typeList);
		return resultMap;
	}


	/**
	 * 插入数据到数据库
	 */
	@Override
	public int insert(Sy13 record) {
		return sy13.insert(record);
	}


	/**
	 * 根据资源名查询
	 */
	@Override
	public Map<String, List> searchResource(String resourceName) {
		Map<String,List> resultMap = new HashMap<>();
		//查询资源列表
		List<Sy13> resourceList = new ArrayList<>();
		resourceList = sy13.searchResource(resourceName);
		//人员列表，查询上传人的资料
		List<Sy02> personList = new ArrayList<>();
		//资源类型数据表
		List<Sy16> typeList = new ArrayList<>();
		//根据资源列表查询上传人姓名
		for(Sy13 s : resourceList) {
			Sy02 person = new Sy02();
			Sy16 type = new Sy16();
			int id =s.getCsy020();
			person = sy02.selectByPrimaryKey(id);
			personList.add(person);
			int typeId = s.getCsy160();
			Byte csy160 = (byte)typeId;
			type = sy16.selectByPrimaryKey(csy160);
			typeList.add(type);
		}
		resultMap.put("Sy13", resourceList);
		resultMap.put("Sy02", personList);
		resultMap.put("Sy16", typeList);
		return resultMap;
	}
	

}

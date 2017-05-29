package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy02Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.student.dao.Sy13Mapper;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.teacher.dto.UserManager;
import com.bysj.cqjtu.teacher.service.DownLoadResourceService;

@Service
public class DownLoadResourceServiceImpl implements DownLoadResourceService{
	
	@Autowired
	private Sy13Mapper sy13;
	
	@Autowired
	private Sy02Mapper sy02;
	

	/**
	 * 查询出所有资源
	 */
	@Override
	public List<Sy13> queryResource() {
//		List<Sy13> resultList = new ArrayList<>();
//		UserManager userManager = new UserManager();
		List<Sy13> resourceList = new ArrayList<>();
		resourceList = sy13.queryResource();
		System.out.println("resourceList="+resourceList.get(0));
//		List<Sy02> userList = new ArrayList<>();
/*		for(int i=0;i<resourceList.size();i++){
			Sy13 s = resourceList.get(i);
			Sy02 s2 = new Sy02();
			if(null!=s.getCsy020()){
				s2 = sy02.getUserById(String.valueOf(s.getCsy020()));
			}else{
				System.out.println("sy02=null");
			}
			userList.add(s2);
			
		}*/
//		userManager.setSy02List(userList);
//		userManager.setSy13List(resourceList);
//		resourceList.add(userManager);
		return resourceList;
	}

}

package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.student.dao.Sy13Mapper;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.teacher.service.DownLoadResourceService;

@Service
public class DownLoadResourceServiceImpl implements DownLoadResourceService{
	
	@Autowired
	private Sy13Mapper sy13;

	@Override
	public List<Sy13> queryResource() {
		List<Sy13> resourceList = new ArrayList<>();
		resourceList = sy13.queryResource();
		return resourceList;
	}

}

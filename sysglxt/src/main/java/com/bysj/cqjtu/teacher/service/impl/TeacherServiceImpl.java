package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.dao.Sy05Mapper;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.teacher.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private Sy05Mapper teacherDao;

	@Override
	@SystemServiceLog(description="查询教师列表")
	public List<Sy05> getTeacherList() throws Exception {
		List<Sy05> list = new ArrayList<>();
		list=teacherDao.queryTeacher();
		return list;
	}



}

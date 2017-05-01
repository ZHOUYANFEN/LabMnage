package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy05Mapper;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.teacher.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Resource
	private Sy05Mapper teacherDao;

	@Override
	public List<Sy05> getTeacherList() throws Exception {
		List<Sy05> list = new ArrayList<>();
		list=teacherDao.queryTeacher();
		return list;
	}



}

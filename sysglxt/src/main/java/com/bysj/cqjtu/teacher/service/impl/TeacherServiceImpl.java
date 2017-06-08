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

	@Override
	public Sy05 queryTeacher(Integer csy020) throws Exception{
		Sy05 teacher = teacherDao.getUserByCsy020(csy020);
		if(null==teacher){
			System.out.println("没有查到教师信息，请检查人员id是否正确");
		}
		return teacher;
	}

	@Override
	public int insertTeacher(Sy05 record) {
		// TODO Auto-generated method stub
		return 0;
	}



}

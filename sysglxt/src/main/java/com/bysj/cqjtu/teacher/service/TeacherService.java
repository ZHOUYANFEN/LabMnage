package com.bysj.cqjtu.teacher.service;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy05;



public interface TeacherService {
	/**
	 * 获取教师信息
	 * @throws Exception 
	 */
	public List<Sy05> getTeacherList () throws Exception;
	
	/**
	 * 根据人员id查询教师信息
	 * @param csy020
	 * @return
	 */
	Sy05 queryTeacher(Integer csy020) throws Exception;
	
	/**
	 * 插入教师信息
	 * @param record
	 * @return
	 */
	int insertTeacher(Sy05 record);
	
	

}

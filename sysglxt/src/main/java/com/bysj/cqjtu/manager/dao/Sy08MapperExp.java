package com.bysj.cqjtu.manager.dao;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.student.domain.Sy08;

public interface Sy08MapperExp {
	/**
	 * 查询实验课程安排信息
	 * @return
	 */
	List<Sy08Exp> selectExp(Integer csy050);
	
	/**
	 * 查询所有实验课程安排信息
	 * @return
	 */
	Sy08 queryInfo(Integer csy080);
	/**
	 * 删除实验安排
	 * @param csy080
	 * @return
	 */
	int deleteExp(Integer csy080);
	
	/**
	 * 添加实验安排
	 * @param record
	 * @return
	 */
	int addExp(Sy08 record);
	
	/**
	 * 根据实验信息查出实验id
	 * @param record
	 * @return
	 */
	String queryId(Sy08 record);
	
	/**
	 * 根据课程名查询课程
	 * @param record
	 * @return
	 */
	List<Sy08Exp> searchExp(String record);
	
	
}

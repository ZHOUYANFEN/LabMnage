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
	
	int deleteExp(Integer csy080);
}

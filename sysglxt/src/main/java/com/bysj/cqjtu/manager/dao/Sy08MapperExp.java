package com.bysj.cqjtu.manager.dao;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy08Exp;

public interface Sy08MapperExp {
	/**
	 * 查询实验课程安排信息
	 * @return
	 */
	List<Sy08Exp> selectExp(Integer csy050);
}

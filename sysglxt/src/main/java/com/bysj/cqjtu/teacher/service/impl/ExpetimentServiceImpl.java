package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy04Mapper;
import com.bysj.cqjtu.manager.dao.Sy08MapperExp;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.student.dao.Sy09Mapper;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.teacher.service.ExperimentService;

@Service
public class ExpetimentServiceImpl implements ExperimentService {

	//实验课程操作对象
	@Resource
	private Sy08MapperExp sy08;
	/**
	 * 实验报告对象
	 */
	@Resource
	private Sy09Mapper sy09;
	/**
	 * 学生对象
	 */
	private Sy04Mapper sy04;
	
	/**
	 * 查询所有实验安排
	 */
	public List<Sy08Exp> queryExp(Integer csy050) {
		List<Sy08Exp> list = new ArrayList<>();
		list = sy08.selectExp(csy050);
		return list;
	}
	/**
	 * 查询所有学生的实验报告
	 */
	@Override
	public List<Sy09> queryReport() {
		List<Sy09> list = new ArrayList<>();		
		list = sy09.queryReport();
		return list;
	}
	/**
	 * 通过学号查询学生信息
	 */
	@Override
	public Sy04 queryStudent(String csy040) {
		Sy04 student = new Sy04();
		student = sy04.selectByPrimaryKey(csy040);
		return student;
	}
	
	/**
	 * 对学生报告评分，修改学生完成情况
	 */
	@Override
	public void updateReposrt(Sy09 record) {
		sy09.updateByPrimaryKeySelective(record);		
	}
	/**
	 * 通过提交的实验报告id查询实验报告详细情况
	 */
	@Override
	public Sy09 queryBykey(int csy090) {
		Sy09 sy09Result = new Sy09();
		sy09Result = sy09.selectByPrimaryKey(csy090);
		return sy09Result;
	}
	

}

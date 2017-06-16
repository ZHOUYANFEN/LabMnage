package com.bysj.cqjtu.teacher.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;

/**
 * 对实验课程的相关操作
 * @author xiong
 *
 */
public interface ExperimentService {
	
    /**
     * 查询实验课程安排
     * @param csy050
     * @return
     */
	List<Sy08Exp> queryExp(Integer csy050);
	/**
	 * 查询学生的实验报告
	 * @return
	 */
	Map<String,List> queryReport();
	/**
	 * 查询学生
	 * @param csy040
	 * @return
	 */
	Sy04 queryStudent(String csy040);
	
	/**
	 * 更改实验完成情况，对实验报告评分
	 * @param sy09
	 */
	int updateReposrt(Sy09 record);
	
	Sy09 queryBykey(int csy090);
	
	int deleteExp(String []record);
	
	/**
	 * 根据课程名查询课程id
	 * @param record
	 * @return
	 */
	Sy06 queryClassByName(String className);
	
	/**
	 * 添加实验安排表
	 * @param record
	 */
	int addExp(Sy08 record);
	
	/**
	 * 根据实验数据查出实验id
	 * @param record
	 * @return
	 */
	String queryId(Sy08 record);
	
	/**
	 * 根据课程名称查询实验
	 * @param record
	 * @return
	 */
	List<Sy08Exp> searchExp(String record);
	/**
	 * 查询所有学生的课程
	 * @return
	 */
	public Map queryClass();
	
	/**
	 * 查询某个学生的课程
	 * @return
	 */
	public Map queryStudentClass(Sy07 record);
	
	int insert(Sy07 record);
	/**
	 * 根据实验id查询所有实验
	 * @param parseInt
	 * @return
	 */
	Map queryReportByid(int parseInt);
	/**
	 * 根据课程id查询所有学生
	 * @param parseInt
	 * @return
	 */
	Map queryClassByid(int csy060);
}

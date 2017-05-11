package com.bysj.cqjtu.teacher.service;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
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
	List<Sy09> queryReport();
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
	void updateReposrt(Sy09 record);
	
	Sy09 queryBykey(int csy090);
}

package com.bysj.cqjtu.teacher.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.teacher.dto.LabManager;

public interface LabApplyService {

	/**
	 * 显示试验室相关信息
	 * @return
	 */
	List<Map> queryLabList();
	/**
	 * 通过id查询相关信息
	 * @param id
	 * @return
	 */
	Map queryLabById(int id);
	/**
	 * 增加一个实验室安排
	 * @param sy12
	 */
	void addLabArrange(Sy12 record);
	/**
	 * 根据一个id查询当前信息
	 * @param id
	 * @return
	 */
	LabManager queryEdit(int id,int userId);
	/**
	 * 验证申请信息
	 * @param sy12
	 * @return
	 * @throws Exception
	 */
    Map validateArrage(Sy12 sy12) throws Exception;
	
}

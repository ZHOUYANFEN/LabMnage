package com.bysj.cqjtu.teacher.service;

import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.util.PageEntity;

public interface LabApplyService {

	/**
	 * 显示试验室相关信息
	 * @return
	 */
    PageEntity<Map> queryLabList(Integer pageNum, Integer pageSize);
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
	Map addLabArrange(Sy12 record) throws Exception;
	/**
	 * 根据一个id查询当前信息
	 * @param id
	 * @return
	 */
	LabManager queryEdit(int id,int userId) throws Exception;
	/**
	 * 验证申请信息
	 * @param sy12
	 * @return
	 * @throws Exception
	 */
    Map validateArrage(Sy12 sy12) throws Exception;
    /**
     * 查询实验室数量
     * @return
     * @throws Exception
     */
    Map queryLabCount() throws Exception;
	
}

package com.bysj.cqjtu.teacher.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.student.domain.Sy13;


public interface DownLoadResourceService {
	
	/**
	 * 查询资源列表
	 * @return
	 */
	Map<String,List> queryResource();
	
	/**
	 * 上传资源
	 * @return
	 */
	int insert(Sy13 record);

}

package com.bysj.cqjtu.teacher.service;

import java.util.List;

import com.bysj.cqjtu.teacher.dto.UserManager;

public interface DownLoadResourceService {
	
	/**
	 * 查询资源列表
	 * @return
	 */
	List<UserManager> queryResource();

}

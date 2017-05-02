package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.dao.Sy10Mapper;
import com.bysj.cqjtu.manager.dao.Sy11Mapper;
import com.bysj.cqjtu.manager.dao.Sy12Mapper;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.service.LabApplyService;


@Service
public  class LabApplyServiceImpl implements LabApplyService {

    @Autowired
	private Sy11Mapper sy11;
    @Autowired
	private Sy12Mapper sy12;
    @Autowired
	private Sy10Mapper sy10;
	
	@Override
	public List<Map> queryLabList() {
		List<Map> list = new ArrayList<>();
		list = sy11.queryLabMsg();
		return list;
	}

	@Override
	public Map queryLabById(int id) {
		//Sy11 lab = new Sy11();
		return sy11.selectByPrimaryKey(id);
		//return lab;
	}



	@Override
	public LabManager queryEdit(int id,int userId) {
		LabManager lab = new LabManager();
		Sy12 sy12Result = sy12.selectByKey(id,userId);
		//Sy11 sy11Result = sy11.selectByPrimaryKey(id);
		//Sy10 sy10Result = sy10.selectByPrimaryKey(sy11Result.getCsy110());
		//lab.setSy10(sy10Result);
		//lab.setSy11(sy11Result);
		lab.setSy12(sy12Result);
		return lab;
	}

	/**
	 * 添加一个实验室的申请，提交一个安排
	 */
	@Override
	public void addLabArrange(Sy12 record) {
	    record.setCsy121(new Date());
	    record.setCsy127((byte)(0));
	    record.setCsy125((byte)(0));
		sy12.insertSelective(record);		
	}

    @Override
    public Map validateArrage(Sy12 sy12Domain) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }







}

package com.bysj.cqjtu.teacher.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.dao.Sy10Mapper;
import com.bysj.cqjtu.manager.dao.Sy11Mapper;
import com.bysj.cqjtu.manager.dao.Sy12Mapper;
import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy12;
import com.bysj.cqjtu.teacher.constant.TeacherConstance;
import com.bysj.cqjtu.teacher.dto.LabManager;
import com.bysj.cqjtu.teacher.service.LabApplyService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;


@Service
public  class LabApplyServiceImpl implements LabApplyService {

    @Autowired
	private Sy11Mapper sy11;
    @Autowired
	private Sy12Mapper sy12;
    @Autowired
	private Sy10Mapper sy10;
	
	@Override
	@SystemServiceLog(description="查询实验室列表")
	public PageEntity<Map> queryLabList(Integer pageNum, Integer pageSize,Integer csy125,Sy02 sy02) {
	    PageHelper.startPage(pageNum, pageSize);
	    PageEntity<Map> pageBean = new PageEntity<Map>();
	    if(TeacherConstance.APPLY_STATU_CSY125_ALL==csy125){
            List<Map> allList = sy11.queryLabMsg();          
            pageBean.setList(allList);
            int size =sy11.queryLabMsg().size();
            pageBean.setCount(size);
           
	    }else{
	        Map paramterMap= new HashMap();
	        paramterMap.put("csy125", csy125);
	        paramterMap.put("csy020", sy02.getCsy020());
	        List<Map> allList = sy12.queryApplyLabMsg(paramterMap);          
            pageBean.setList(allList);
            int size =sy12.queryApplyLabMsg(paramterMap).size();
            pageBean.setCount(size);
	    }
	    return pageBean;
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
	public Map addLabArrange(Sy12 record) throws Exception{
	    record.setCsy121(new Date());
	    record.setCsy127((byte)(0));
	    record.setCsy125((byte)(0));
		int i=sy12.insertSelective(record);
		if(i!=1){
		    throw new RuntimeException("申请实验室安排失败");
		}
		Map map= new HashMap();
		map.put("statu", OperateStatu.INSERT_SY12_SUCCESS);
		return map;
	}

    @Override
    public Map validateArrage(Sy12 sy12Domain) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Map queryLabCount(Integer csy125,Sy02 sy02) throws Exception {
        Map map= new HashMap();
        if(TeacherConstance.APPLY_STATU_CSY125_ALL==csy125){
            map.put("count", sy11.queryLabMsg().size());
           
        }else{
            Map paramterMap= new HashMap();
            paramterMap.put("csy125", csy125);
            paramterMap.put("csy020", sy02.getCsy020());
            map.put("count", sy12.queryApplyLabMsg(paramterMap).size());
        }
        return map;
    }







}

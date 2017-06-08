package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.dao.Sy04Mapper;
import com.bysj.cqjtu.manager.dao.Sy08MapperExp;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy08Exp;
import com.bysj.cqjtu.student.dao.Sy06Mapper;
import com.bysj.cqjtu.student.dao.Sy09Mapper;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.teacher.service.ExperimentService;

@Service
public class ExpetimentServiceImpl implements ExperimentService {

	//实验课程操作对象
    @Autowired
	private Sy08MapperExp sy08;
	/**
	 * 实验报告对象
	 */
    @Autowired
	private Sy09Mapper sy09;
	/**
	 * 学生对象
	 */
    @Autowired
	private Sy04Mapper sy04;
    
    /**
     * 课程表
     */
    @Autowired
    private Sy06Mapper sy06;
	
	/**
	 * 查询所有实验安排
	 */
    @SystemServiceLog(description="查询所有实验安排")
	public List<Sy08Exp> queryExp(Integer csy050) {
		List<Sy08Exp> list = new ArrayList<>();
		list = sy08.selectExp(csy050);
		return list;
	}
	/**
	 * 查询所有学生的实验报告
	 */
	@Override
	public Map queryReport() {
		Map<String,List> map = new HashMap<String, List>();
		List<Sy09> list = new ArrayList<>();		
		list = sy09.queryReport();
		List<Sy08> sy08List = new ArrayList<>();
		for(Sy09 s : list){
			Sy08 type = new Sy08();
			if(s.getCsy080()!=null){
				type = sy08.queryInfo(Integer.parseInt(s.getCsy080()));
			}
			sy08List.add(type);
		}
		map.put("Sy09", list);
		map.put("Sy08", sy08List);
		return map;
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
	@Override
	public int deleteExp(String[] record) {
		int num=0;
		if(record.length>0){
			for(int i =0;i<record.length;i++){
				num += sy08.deleteExp(Integer.valueOf(record[i]));
			}
		}
		if(num>0){
		System.out.println("删除成功，共删除"+num+"条数据");
		}else{
			System.out.println("删除失败！");
		}
		return num;
		
	}
	@Override
	public Sy06 queryClassByName(String className) {
		Sy06 result = sy06.queryClassByName(className);
		if(null==result){
			System.out.println("没有找到该课程信息，请检查课程名是否正确！");
		}
		return result;
	}
	@Override
	public int addExp(Sy08 record) {
		int num = 0;
		if(null!=record){
			num = sy08.addExp(record);
		}
		if(num>0){
			System.out.println("添加成功!");
		}else{
			System.out.println("添加失败!");
		}
		return num;
		
		
	}
	@Override
	public void addExpComplete(Sy09 record) {
		
	}
	@Override
	public String queryId(Sy08 record) {
		String csy080 = sy08.queryId(record);
		if(csy080!=""){
			System.out.println("查询成功");
			return csy080;
		}else{
			System.out.println("查询失败");
			return "查询失败";
		}
	}
	

}

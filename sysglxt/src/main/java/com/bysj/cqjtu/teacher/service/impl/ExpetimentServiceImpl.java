package com.bysj.cqjtu.teacher.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
import com.bysj.cqjtu.student.dao.Sy07Mapper;
import com.bysj.cqjtu.student.dao.Sy09Mapper;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy07;
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
     * 成绩表
     */
    @Autowired
    private Sy07Mapper sy07;
	
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
		List<Sy04> sy04List = new ArrayList<>();
		HashSet<Integer> hash = new HashSet<>();
		for(Sy09 s : list){
			Sy04 student = new Sy04();
			Sy08 type = new Sy08();
			if(s.getCsy080()!=null){
				type = sy08.queryInfo(Integer.parseInt(s.getCsy080()));
				hash.add(type.getCsy080());
			}
			if(s.getCsy040()!=null){
				student = sy04.queryStudentById(s.getCsy040());
			}
			sy04List.add(student);
			sy08List.add(type);
		}

		map.put("Sy09", list);
		map.put("Sy08", sy08List);
		map.put("Sy04", sy04List);
		List<Sy08> clearList = new ArrayList<>();
		Iterator<Integer> it=hash.iterator();
		Sy08 sy08model;
		while(it.hasNext()){
			sy08model=new Sy08();
			sy08model = sy08.queryInfo(it.next());
			clearList.add(sy08model);
		}
		map.put("Sy08Clear", clearList);
		return map;
	}
	/**
	 * 查询所有学生课程
	 */
	@Override
	public Map queryClass() {
		Map<String,List> map = new HashMap<String, List>();
		List<Sy07> list = new ArrayList<>();		
		list = sy07.queryScore();
		List<Sy06> sy06List = new ArrayList<>();
		List<Sy04> sy04List = new ArrayList<>();
		HashSet<Integer> hash = new HashSet<>();
		for(Sy07 s : list){
			Sy04 student = new Sy04();
			Sy06 className = new Sy06();
			if(s.getCsy040()!=null){
				student = sy04.selectByPrimaryKey(s.getCsy040());
			}
			if(s.getCsy060()!=null){
				className = sy06.selectByPrimaryKey(Integer.parseInt(s.getCsy060()));
				hash.add(className.getCsy060());
			}
			sy04List.add(student);
			sy06List.add(className);
			
		}
		map.put("Sy07", list);
		map.put("Sy06", sy06List);
		map.put("Sy04", sy04List);
		List<Sy06> clearList = new ArrayList<>();
		Iterator<Integer> it=hash.iterator();
		Sy06 sy06model;
		while(it.hasNext()){
			sy06model=new Sy06();
			sy06model = sy06.selectByPrimaryKey(it.next());
			clearList.add(sy06model);
		}
		map.put("Sy06Clear", clearList);
		return map;
	}
	/**
	 * 
	 */
	@Override
	public Map queryStudentClass(Sy07 record) {
		Map<String,Object> map = new HashMap<String, Object>();
		Sy07 score= sy07.queryScoreById(record);
		Sy06 className = new Sy06();
		Sy04 student = new Sy04();
		if(score.getCsy040()!=null){
			student = sy04.selectByPrimaryKey(score.getCsy040());
		}
		if(score.getCsy060()!=null){
			className = sy06.selectByPrimaryKey(Integer.parseInt(score.getCsy060()));
		}
		map.put("Sy07", score);
		map.put("Sy06", className);
		map.put("Sy04", student);
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
	public int updateReposrt(Sy09 record) {
		return sy09.updateByPrimaryKeySelective(record);		
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

	/**
	 * 查询实验安排
	 */
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
	
	/**
	 * 根据课程名查询实验
	 */
	@Override
	public List<Sy08Exp> searchExp(String record) {
		List<Sy08Exp> resultLis = sy08.searchExp(record);
		return resultLis;
	}
	/**
	 * 
	 * @param record
	 * @return
	 */
	@Override
	public int insert(Sy07 record){
		return sy07.updateByPrimaryKey(record);
	}
	
	@Override
	public Map queryReportByid(int parseInt) {
		Map<String,List> map = new HashMap<String, List>();
		List<Sy09> list = new ArrayList<>();		
		list = sy09.queryReportByid(parseInt);
		List<Sy08> sy08List = new ArrayList<>();
		List<Sy04> sy04List = new ArrayList<>();
		for(Sy09 s : list){
			Sy04 student = new Sy04();
			Sy08 type = new Sy08();
			if(s.getCsy080()!=null){
				type = sy08.queryInfo(Integer.parseInt(s.getCsy080()));
			}
			if(s.getCsy040()!=null){
				student = sy04.queryStudentById(s.getCsy040());
			}
			sy04List.add(student);
			sy08List.add(type);
		}

		map.put("Sy09", list);
		map.put("Sy08", sy08List);
		map.put("Sy04", sy04List);
		return map;
	}
	@Override
	public Map<String, List> queryClassByid(int csy060) {
		Map<String, List> map = new HashMap<String, List>();
		List<Sy07> list = new ArrayList<>();		
		list = sy07.queryClassByid(csy060);
		List<Sy06> sy06List = new ArrayList<>();
		List<Sy04> sy04List = new ArrayList<>();
		for(Sy07 s : list){
			Sy04 student = new Sy04();
			Sy06 className = new Sy06();
			if(s.getCsy040()!=null){
				student = sy04.selectByPrimaryKey(s.getCsy040());
			}
			if(s.getCsy060()!=null){
				className = sy06.selectByPrimaryKey(Integer.parseInt(s.getCsy060()));
			}
			sy04List.add(student);
			sy06List.add(className);
			
		}
		map.put("Sy07", list);
		map.put("Sy06", sy06List);
		map.put("Sy04", sy04List);
		return map;
	}
	@Override
	public List<Sy06> queryExpName(Integer csy050) {
		return sy08.queryExpName(csy050);
	}
	

}

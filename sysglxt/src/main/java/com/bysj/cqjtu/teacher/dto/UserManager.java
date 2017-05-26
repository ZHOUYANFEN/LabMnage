package com.bysj.cqjtu.teacher.dto;

import java.util.List;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy03;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.domain.Sy13;

/**
 * 所有用户关联对象
 * @author xiong
 *
 */
public class UserManager {
	
	/**
	 * 人员信息表
	 */
	private List<Sy02> sy02List;
	/**
	 * 科研人员信息表
	 */
	private List<Sy03> sy03List;
	/**
	 * 学生信息表
	 */
	private List<Sy04> sy04List;
	/**
	 * 教师信息表
	 */
	private List<Sy05> sy05List;
	
	private List<Sy13> sy13List;
	
	
	public List<Sy13> getSy13List() {
		return sy13List;
	}
	public void setSy13List(List<Sy13> sy13List) {
		this.sy13List = sy13List;
	}
	public List<Sy02> getSy02List() {
		return sy02List;
	}
	public void setSy02List(List<Sy02> sy02List) {
		this.sy02List = sy02List;
	}
	public List<Sy03> getSy03List() {
		return sy03List;
	}
	public void setSy03List(List<Sy03> sy03List) {
		this.sy03List = sy03List;
	}
	public List<Sy04> getSy04List() {
		return sy04List;
	}
	public void setSy04List(List<Sy04> sy04List) {
		this.sy04List = sy04List;
	}
	public List<Sy05> getSy05List() {
		return sy05List;
	}
	public void setSy05List(List<Sy05> sy05List) {
		this.sy05List = sy05List;
	}
	
	

}

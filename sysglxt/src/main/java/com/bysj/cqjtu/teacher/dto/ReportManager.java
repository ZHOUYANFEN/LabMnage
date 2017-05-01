package com.bysj.cqjtu.teacher.dto;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;

/**
 * 实验报告关联的对象
 * @author xiong
 *
 */
public class ReportManager {
	/**
	 * 学生对象
	 */
	private Sy04 sy04;
	/**
	 * 实验安排对象
	 */
	private Sy08 sy08;
	
	/**
	 * 实验完成对象
	 */
	private Sy09 sy09;
	
	/**
	 * 教师对象
	 */
	private Sy05 sy05;
	
	/**
	 * 课程表
	 */
	private Sy06 sy06;
	
	/**
	 * 成绩表
	 */
	private Sy07 sy07;

	public Sy04 getSy04() {
		return sy04;
	}

	public void setSy04(Sy04 sy04) {
		this.sy04 = sy04;
	}

	public Sy08 getSy08() {
		return sy08;
	}

	public void setSy08(Sy08 sy08) {
		this.sy08 = sy08;
	}

	public Sy09 getSy09() {
		return sy09;
	}

	public void setSy09(Sy09 sy09) {
		this.sy09 = sy09;
	}

	public Sy05 getSy05() {
		return sy05;
	}

	public void setSy05(Sy05 sy05) {
		this.sy05 = sy05;
	}

	public Sy06 getSy06() {
		return sy06;
	}

	public void setSy06(Sy06 sy06) {
		this.sy06 = sy06;
	}

	public Sy07 getSy07() {
		return sy07;
	}

	public void setSy07(Sy07 sy07) {
		this.sy07 = sy07;
	}
	
	

}

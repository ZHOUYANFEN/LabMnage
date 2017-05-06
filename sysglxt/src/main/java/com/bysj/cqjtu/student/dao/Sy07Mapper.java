package com.bysj.cqjtu.student.dao;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.student.domain.Sy07;

public interface Sy07Mapper {
    int insert(Sy07 record);

    int insertSelective(Sy07 record);
    /**
     * 查询所有成绩
     * @param sy07
     * @return
     */
    List<Map> queryGrade(Sy07 sy07);
    /**
     * 查询成绩详情
     * @param sy07
     * @return
     */
    List<Map> queryGradeDetai(Sy07 sy07);
    /**
     * 成绩统计
     * @return
     */
    List<Map> gradestatistics();
    /**
     * 查询各个班级每个课程的平均成绩
     * @return
     */
    List<Map> classGradestatistics();
    /**
     * 查询各个班级每个课程的平均分布
     * @param csy043
     * @param csy060
     * @return
     */
    List<Map> classpeopleGradestatistics(Map map);
    /**
     * 删除课程下的学生
     * @param sy07
     * @return
     */
    int deleteStudent(Sy07 sy07);
    /**
     * 添加学生到课程
     * @param ids
     * @param csy060
     * @return
     */
    int addStudentToCourse(Sy07 sy07);
    /**
     * 验证课程下是否有学生
     * @param sy07
     * @return
     */
    Sy07 validateStudentInCource(Sy07 sy07);

}
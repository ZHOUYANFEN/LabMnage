package com.bysj.cqjtu.teacher.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.domain.Sy07;

/**
 * 实验课程的学生管理service
 * @author fuzhengjun
 *2017年5月4日上午8:47:47
 *
 */
public interface StudentManageService {
    /**
     * 查询自己所有的实验课程
     * @param csy050
     * @return
     * @throws Exception
     */
    public List<Map> queryCourse(Sy05 sy05) throws Exception;
    /**
     * 获取所有学院
     * @return
     * @throws Exception
     */
    public List<Map> queryCollege() throws Exception;
    /**
     * 获取学院下对应的班级
     * @return
     * @throws Exception
     */
    public List<Map> queryClass(String aaa105) throws Exception;
    /**
     * 按照班级获取学生
     * @param csy043
     * @return
     * @throws Exception
     */
    public List<Sy04> queryStudentList(String csy043) throws Exception;
    /**
     * 按照实验课程获取学生列表
     * @param csy060
     * @return
     * @throws Exception
     */
    public List<Sy04> queryStudentListByCourse(String csy060) throws Exception;
    /**
     * 删除课程下的学生
     * @param sy07
     * @return
     * @throws Exception
     */
    public Map deleteStudent(Sy07 sy07) throws Exception;
    /**
     * 添加 学生到课程
     * @param ids
     * @param csy060
     * @return
     * @throws Exception
     */
    public Map addStudentToCourse(String ids, String csy060) throws Exception;
    /**
     * 验证该课程下是否有该学生
     * @param ids
     * @param csy060
     * @return
     * @throws Exception
     */
    public Map validateStudentInCource(String ids, String csy060) throws Exception;
    /**
     * 批量删除课程下的学生
     * @param ids
     * @param csy060
     * @return
     * @throws Exception
     */
    public Map deleteStudentInCourseBatch(String ids, String csy060) throws Exception;
}

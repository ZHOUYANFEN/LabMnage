package com.bysj.cqjtu.teacher.service;

import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy05;
import com.bysj.cqjtu.student.domain.Sy06;
import com.bysj.cqjtu.util.PageEntity;

/**
 * 课程管理Service
 * @author fuzhengjun
 *2017年5月15日上午12:01:35
 *
 */
public interface CourseManageService {
    /**
     * 获取课程数量
     * @param csy050
     * @return
     */
    public Integer getCourseCount(Sy05 sy05) throws Exception;
    /**
     * 获取课程信息
     * @param sy05
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageEntity<Map> getCourse(Sy05 sy05,Integer pageNum,Integer pageSize)throws Exception;
    /**
     * 按照条件查询课程
     * @param sy05
     * @param csy061
     * @param pageNum
     * @param pageSize
     * @return
     * @throws Exception
     */
    public PageEntity<Map> getCourseByCondition(Sy05 sy05, String csy061,
            Integer pageNum, Integer pageSize)throws Exception;
    /**
     * 获取条件查询课程的数量
     * @param sy05
     * @param csy061
     * @return
     * @throws Exception
     */
    public Integer getCourseCountByCondition(Sy05 sy05, String csy061) throws Exception;
    /**
     * 添加课程
     * @param sy06
     * @return
     * @throws Exception
     */
    public Map addCourse(Sy06 sy06) throws Exception;
    /**
     * 验证课程
     * @param sy06
     * @return
     * @throws Exception
     */
    public Map validateCourse(Sy06 sy06) throws Exception;
    /**
     * 删除实验课程
     * @param sy06
     * @return
     * @throws Exception
     */
    public Map deleteCourse(Sy06 sy06) throws Exception;
    /**
     * 批量删除课程信息
     * @param sy05
     * @param ids
     * @return
     */
    public Map deleteCourseBatch(Sy05 sy05, String ids) throws Exception;
}

package com.bysj.cqjtu.index.dao;

import java.util.List;

import com.bysj.cqjtu.index.domain.Sy15;

/**
 * 菜单mapper
 * @author fuzhengjun
 *2017年3月21日上午9:21:27
 *
 */
public interface Sy15Mapper {
    int deleteByPrimaryKey(Integer csy150);

    int insert(Sy15 record);

    int insertSelective(Sy15 record);

    Sy15 selectByPrimaryKey(Integer csy150);

    int updateByPrimaryKeySelective(Sy15 record);

    int updateByPrimaryKey(Sy15 record);
    /**
     * 根据类型查询父级菜单
     * @param csy010
     * @return
     */
    List<Sy15> selectSy15ByCsy010(Integer csy010);
    /**
     * 根据父级菜单id查询子级菜单
     * @param csy010
     * @return
     */
    List<Sy15> selectSy15ByCsy155(Integer csy155);
    /**
     * 查询所有菜单
     * @return
     */
    List<Sy15> queryAllMenu();
    /**
     * 按照id删除菜单功能
     * @param csy150
     * @return
     */
    int deleteMenuByCsy150(int csy150);
}
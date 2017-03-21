package com.bysj.cqjtu.index.service;

import java.util.List;

import com.bysj.cqjtu.index.domain.Sy15;

/**
 * 菜单获取service
 * @author fuzhengjun
 *2017年3月20日下午4:42:28
 *
 */
public interface MenuService {
    /**
     * 查询父级菜单
     * @param csy010
     * @return
     * @throws Exception
     */
    public List<Sy15> queryMenu(int csy010) throws Exception;
    /**
     * 查询子级菜单
     * @param csy010
     * @return
     * @throws Exception
     */
    public List<Sy15> selectMenu(int csy155) throws Exception;
    /**
     * 查询所有菜单
     * @return
     * @throws Exception
     */
    public List<Sy15> queryAllMenu() throws Exception;
    /**
     * 按照id删除菜单功能
     * @param csy150
     * @return
     * @throws Exception
     */
    public boolean deleteMenuByCsy150(int csy150) throws Exception;
}

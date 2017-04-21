package com.bysj.cqjtu.index.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.index.domain.Sy01;
import com.bysj.cqjtu.index.domain.Sy15;
import com.bysj.cqjtu.util.PageEntity;

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
    public List<Sy15> queryMenuChilde(int csy155) throws Exception;
    /**
     * 查询所有菜单
     * @return
     * @throws Exception
     */
    public PageEntity<Sy15> queryAllMenu(Integer pageNum,Integer pageSize) throws Exception;
    /**
     * 按照id删除菜单功能
     * @param csy150
     * @return
     * @throws Exception
     */
    public Map deleteMenuByCsy150(int csy150) throws Exception;
    /**
     * 获取人员类型
     * @return
     * @throws Exception
     */
    public List<Sy01> queryCsy010() throws Exception;
    /**
     * 获取父级菜单
     * @return
     * @throws Exception
     */
    public List<Sy15> queryParentMenu(Integer csy010) throws Exception;
    /**
     * 保存菜单
     * @param sy15
     * @throws Exception
     */
    public Map saveMenu(Sy15 sy15) throws Exception;
    /**
     * 按条件查询菜单
     * @param sy15
     * @return
     * @throws Exception
     */
    public List<Sy15> queryMenuByCondition(Sy15 sy15) throws Exception;
    /**
     * 查询菜单的数量
     * @return
     * @throws Exception
     */
    public int getMenuCount() throws Exception;
    /**
     *批量删除菜单
     * @param ids
     * @return
     * @throws Exception
     */
    public Map deleteMenuBatch(String ids) throws Exception;
}

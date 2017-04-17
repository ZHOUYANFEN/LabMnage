package com.bysj.cqjtu.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.index.dao.Sy01Mapper;
import com.bysj.cqjtu.index.dao.Sy15Mapper;
import com.bysj.cqjtu.index.domain.Sy01;
import com.bysj.cqjtu.index.domain.Sy15;
import com.bysj.cqjtu.index.service.MenuService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;

@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    private Sy15Mapper sy15Mapper;
    @Autowired
    private Sy01Mapper sy01Mapper;
    
    @Override
    public List<Sy15> queryMenu(int csy010) throws Exception {
        List list = (List) sy15Mapper.selectSy15ByCsy010(csy010);
        return list;
    }

    @Override
    public List<Sy15> queryMenuChilde(int csy155) throws Exception {
        List list = (List) sy15Mapper.selectSy15ByCsy155(csy155);
        return list;
    }

    @Override
    public PageEntity<Sy15> queryAllMenu(Integer pageNum,Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Sy15> allList = sy15Mapper.queryAllMenu();
        PageEntity<Sy15> pageBean = new PageEntity<Sy15>();
        pageBean.setList(allList);
        int size =sy15Mapper.queryAllMenu().size();
        pageBean.setCount(size);
        return pageBean;

    }

    @Override
    public boolean deleteMenuByCsy150(int csy150) throws Exception {
        int i=sy15Mapper.deleteMenuByCsy150(csy150);
        if(i==1){
            return true;
        }else {
            throw new Exception("删除表失败");
        }
    }

    @Override
    public List<Sy01> queryCsy010() throws Exception {
        return sy01Mapper.getCsy010();
    }

    @Override
    public List<Sy15> queryParentMenu(Integer csy010) throws Exception {
        return sy15Mapper.getParentMenu(csy010);
    }

    @Override
    public boolean saveMenu(Sy15 sy15) throws Exception {       
        sy15.setCsy156(Byte.parseByte("0"));
        int i=sy15Mapper.saveMenu(sy15);
        if(i!=1){
            throw new Exception("添加菜单失败");
        }
        return true;
        
    }

    @Override
    public List<Sy15> queryMenuByCondition(Sy15 sy15) throws Exception {
        return sy15Mapper.queryMenuByCondition(sy15);
    }

    @Override
    public int getMenuCount() throws Exception {
       List<Sy15> list= sy15Mapper.queryAllMenu();    
       return list.size();
    }

}

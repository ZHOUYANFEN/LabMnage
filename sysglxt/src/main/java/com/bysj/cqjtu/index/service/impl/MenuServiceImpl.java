package com.bysj.cqjtu.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.index.dao.Sy15Mapper;
import com.bysj.cqjtu.index.domain.Sy15;
import com.bysj.cqjtu.index.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    private Sy15Mapper sy15Mapper;
    
    @Override
    public List<Sy15> queryMenu(int csy010) throws Exception {
        List list = (List) sy15Mapper.selectSy15ByCsy010(csy010);
        return list;
    }

    @Override
    public List<Sy15> selectMenu(int csy155) throws Exception {
        List list = (List) sy15Mapper.selectSy15ByCsy155(csy155);
        return list;
    }

    @Override
    public List<Sy15> queryAllMenu() throws Exception {
        return sy15Mapper.queryAllMenu();
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

}

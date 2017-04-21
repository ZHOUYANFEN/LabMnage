package com.bysj.cqjtu.index.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map deleteMenuByCsy150(int csy150) throws Exception {
        int i=sy15Mapper.deleteMenuByCsy150(csy150);
        Map map=new HashMap();
        if(i==1){
            map.put("statu", 1);
            return map;
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
    public Map  saveMenu(Sy15 sy15) throws Exception {       
        sy15.setCsy156(Byte.parseByte("0"));
        int i=sy15Mapper.saveMenu(sy15);
        if(i!=1){
            throw new Exception("添加菜单失败");
        }
        Map map= new HashMap<>();
        map.put("statu", "1");   
        return map;

        
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

    @Override
    public Map deleteMenuBatch(String ids) throws Exception {
        String []arr=ids.split(",");
        boolean deleteFlag;
        int count=0;
        for(int i=0;i<arr.length;i++){
            int j=sy15Mapper.deleteMenuByCsy150(Integer.parseInt(arr[i]));
            if(j==1){
                count++;
            }
        }
        Map map=new HashMap();
        if(count==arr.length){           
            map.put("statu", 1);
            return map;
        }else {
          throw new RuntimeException("批量删除菜单出错");
        }
        
    }

}

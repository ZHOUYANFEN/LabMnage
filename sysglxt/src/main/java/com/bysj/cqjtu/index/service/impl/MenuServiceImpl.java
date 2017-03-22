package com.bysj.cqjtu.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.index.dao.Sy01Mapper;
import com.bysj.cqjtu.index.dao.Sy15Mapper;
import com.bysj.cqjtu.index.domain.Sy01;
import com.bysj.cqjtu.index.domain.Sy15;
import com.bysj.cqjtu.index.service.MenuService;

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

    @Override
    public List<Sy01> getCsy010() throws Exception {
        return sy01Mapper.getCsy010();
    }

    @Override
    public List<Sy15> getParentMenu(Integer csy010) throws Exception {
        return sy15Mapper.getParentMenu(csy010);
    }

    @Override
    public void saveMenu(String str) throws Exception {
        String []arr=str.split(",");
        String []a;
        Sy15 sy15=new Sy15();
        for (String string : arr) {
            a=string.split(":");
            if("csy010".equals(a[0])){
                sy15.setCsy010(Byte.parseByte(a[1]));
            }
            if("z_index".equals(a[0])){
                sy15.setCsy154(Byte.parseByte(a[1]));
                if("1".equals(a[1])){                  
                    sy15.setCsy155(null);
                }                
            }
            if("parentMenu".equals(a[0])){
                if(!"null".equals(a[1])){
                   sy15.setCsy155(Byte.parseByte(a[1]));
                }
            }
            if("csy151_txt".equals(a[0])){
                sy15.setCsy151(a[1]);
            }
            if("csy152_txt".equals(a[0])){
                sy15.setCsy152(a[1]);
            }
            if("csy153_txt".equals(a[0])){
                sy15.setCsy153(a[1]);
            }
            if("csy157_txt".equals(a[0])){
                sy15.setCsy157(a[1]);
            }
        }
        sy15.setCsy156(Byte.parseByte("0"));
        System.out.println(sy15);
        int i=sy15Mapper.saveMenu(sy15);
        if(i!=1){
            throw new Exception("添加菜单失败");
        }
        
    }

}

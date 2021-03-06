package com.bysj.cqjtu.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.common.constance.UserConstance;
import com.bysj.cqjtu.common.dao.Sy14Mapper;
import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.common.service.AnouncementService;
import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;
@Service
public class AnouncementServiceImpl implements AnouncementService {
    
    @Autowired
    private Sy14Mapper sy14Mapper;
    
    @Override
    @SystemServiceLog(description="查询公告")
    public List<Sy14> queryanouncement() throws Exception {
        return sy14Mapper.queryanouncement();
    }

    @Override
    @SystemServiceLog(description="查询最新公告")
    public Sy14 queryNewAnouncement() throws Exception {
        return sy14Mapper.getNewAnouncement();
    }

    @Override
    @SystemServiceLog(description="分页查询所有公告")
    public PageEntity<Sy14> queryAllanouncement(Integer pageNum,Integer pageSize) throws Exception {    
        PageHelper.startPage(pageNum, pageSize);
        List<Sy14> allList = sy14Mapper.queryAllanouncement();
        PageEntity<Sy14> pageBean = new PageEntity<Sy14>();
        pageBean.setList(allList);
        int size = sy14Mapper.queryAllanouncement().size();
        pageBean.setCount(size);
        return pageBean;
    }

    @Override
    @SystemServiceLog(description="删除公告")
    public Map deleteanouncement(String csy140) throws Exception {
        int i=sy14Mapper.deleteanouncement(csy140);
        Map map=new HashMap();
        if(i!=1){
           throw new RuntimeException(UserConstance.DELETE_SY14_ERROR);
        }
        map.put("statu", UserConstance.DELETE_SY14_SUCCESS);
        return map;
    }

    @Override
    @SystemServiceLog(description="批量删除公告")
    public Map deleteBatch(String ids) throws Exception {
        String [] csy140s=ids.split(",");
        int count=0;
        for (String csy140 : csy140s) {
            int i=sy14Mapper.deleteanouncement(csy140);
            if(i==1){
                count++;
            }
        }
        Map map=new HashMap();
        if(count!=csy140s.length){
            throw new RuntimeException(UserConstance.DELETE_SY14_ERROR);
        }
        map.put("statu", UserConstance.DELETE_SY14_SUCCESS);
        return map;
    }

    @Override
    @SystemServiceLog(description="保存公告")
    public Map saveAnoucement(Sy14 sy14) throws Exception {
        sy14.setCsy145((byte)0);
        int i=sy14Mapper.saveAnoucement(sy14);
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(UserConstance.INSERT_SY14_ERROR);
        }
        map.put("statu", UserConstance.INSERT_SY14_SUCCESS);
        return map;
    }

    @Override
    @SystemServiceLog(description="公告详情")
    public Sy14 detailanouncement(String csy140) throws Exception {
        return sy14Mapper.detailanouncement(csy140);
    }

    @Override
    @SystemServiceLog(description="查询公告数量")
    public int getAnouncementCount() throws Exception {
        int i =sy14Mapper.queryAllanouncement().size();
        return i;
    }

}

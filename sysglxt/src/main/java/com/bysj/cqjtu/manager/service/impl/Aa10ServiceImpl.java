package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.dao.Aa10Mapper;
import com.bysj.cqjtu.manager.domain.Aa10;
import com.bysj.cqjtu.manager.domain.Aa10Key;
import com.bysj.cqjtu.manager.service.Aa10Service;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;
@Service
public class Aa10ServiceImpl implements Aa10Service {
    
    @Autowired
    private Aa10Mapper aa10Mapper;
    @Override
    public List<Map> queryCsy042() throws Exception {
        return aa10Mapper.queryCsy042();
    }
    @Override
    public List<Map> queryCsy043(String aaa105) throws Exception {
        return aa10Mapper.queryCsy043(aaa105);
    }
    @Override
    public int getAa10Count() throws Exception {
        int i = aa10Mapper.queryAa10().size();
        return i;
    }
    @Override
    public PageEntity<Aa10> queryAa10(Integer pageNum, Integer pageSize)
            throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Aa10> allList =aa10Mapper.queryAa10();
        PageEntity<Aa10> pageBean = new PageEntity<Aa10>();
        pageBean.setList(allList);
        int size =aa10Mapper.queryAa10().size();
        pageBean.setCount(size);
        return pageBean;
    }
    @Override
    public Map deleteAa10(String aaa100, String aaa102) throws Exception {
        Aa10Key aa10Key= new Aa10Key();
        aa10Key.setAaa100(aaa100);
        aa10Key.setAaa102(aaa102);
        int i = aa10Mapper.deleteAa10(aa10Key);
        Map map= new HashMap();
        if(i!=1){            
            throw new RuntimeException(OperateStatu.DELETE_AA10_FAIL);
        }
        map.put("statu", OperateStatu.DELETE_AA10_SUCCESS);
        return map;
    }
    @Override
    public Map deleteAa10Batch(String ids) throws Exception {
        String []idArr= ids.split(",");
        String aaa100;
        String aaa102;
        Aa10Key aa10Key;
        int count=0;
        for (String string : idArr) {
            aaa100=string.substring(0, string.indexOf("_")+1);
            aaa102=string.substring(string.indexOf("_")+1);
            aa10Key=new Aa10Key();
            aa10Key.setAaa100(aaa100);
            aa10Key.setAaa102(aaa102);
            int i = aa10Mapper.deleteAa10(aa10Key);
            if(i==1){
                count++;
            }
        }
        Map map= new HashMap();
        if(count!=idArr.length){
            throw new RuntimeException( OperateStatu.DELETE_AA10_FAIL);
        }
        map.put("statu", OperateStatu.DELETE_AA10_SUCCESS);
        return map;
    }

}

package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
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
    @SystemServiceLog(description="获取学院信息")
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
            aaa100=string.substring(0, string.indexOf("_"));
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
    @Override
    public Map saveAa10(Aa10 aa10) throws Exception {
        aa10.setAaa104(Byte.parseByte(OperateStatu.AAA104_0));
        int i =aa10Mapper.saveAa10(aa10);
        if(i!=1){
            throw new RuntimeException( OperateStatu.SAVE_AA10_FAIL);
        }
        Map map= new HashMap();
        map.put("statu", OperateStatu.SAVE_AA10_SUCCESS);
        return map;
    }
    @Override
    public Map setAaa101(String aaa100) throws Exception {
        return aa10Mapper.setAaa101(aaa100);
    }
    @Override
    public Map setvalidateAa10Aaa101(Aa10 aa10) throws Exception {
        List<Aa10> list=aa10Mapper.setvalidateAa10Aaa101(aa10);
        Map map= new HashMap();
        if(list.size()>0){
            map.put("statu", OperateStatu.VALIDATE_AA10_SUCCESS);
        }else {
            map.put("statu", OperateStatu.VALIDATE_AA10_FAIL);
        }
        return map;
    }
    @Override
    public List<Aa10> getAa10ByCondtion(Aa10 aa10) throws Exception {
        /*PageHelper.startPage(pageNum, pageSize);
        List<Aa10> allList =aa10Mapper.getAa10ByCondtion(aa10);
        PageEntity<Aa10> pageBean = new PageEntity<Aa10>();
        pageBean.setList(allList);
        int size =aa10Mapper.getAa10ByCondtion(aa10).size();
        pageBean.setCount(size);
        return pageBean;*/
       return  aa10Mapper.getAa10ByCondtion(aa10);
    }
    @Override
    public List<Aa10> queryWeek() throws Exception {
        Aa10 aa10 =new Aa10();
        aa10.setAaa100("WEEK");;
        return  aa10Mapper.getAa10ByCondtion(aa10);
    }

}

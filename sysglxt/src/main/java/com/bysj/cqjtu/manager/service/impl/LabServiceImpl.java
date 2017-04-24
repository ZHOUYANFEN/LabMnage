package com.bysj.cqjtu.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.manager.constance.OperateStatu;
import com.bysj.cqjtu.manager.dao.Aa10Mapper;
import com.bysj.cqjtu.manager.dao.Sy10Mapper;
import com.bysj.cqjtu.manager.dao.Sy11Mapper;
import com.bysj.cqjtu.manager.dao.Sy12Mapper;
import com.bysj.cqjtu.manager.domain.Sy10;
import com.bysj.cqjtu.manager.domain.Sy11;
import com.bysj.cqjtu.manager.service.LabService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;
@Service
public class LabServiceImpl implements LabService {
    @Autowired 
    private Sy10Mapper sy10Mapper;
    @Autowired 
    private Sy11Mapper sy11Mapper;
    @Autowired 
    private Sy12Mapper sy12Mapper;
    @Autowired 
    private Aa10Mapper aa10Mapper;
    @Override
    public List<Map> queryLabType() throws Exception {
        return sy10Mapper.queryLabType();
    }
    @Override
    public List<Map> queryLabList(String csy100) throws Exception {
        Map map=new HashMap();
        map.put("csy100", csy100);
        return sy11Mapper.queryLabList(map); 
    }
    @Override
    public Map addLab(Sy11 sy11) throws Exception {
        sy11.setCsy116((byte)0);
        int i=sy11Mapper.addLab(sy11);
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(OperateStatu.INSERT_SY11_FAIL);
        }
        map.put("statu", OperateStatu.INSERT_SY11_SUCCESS);
        return map;
    }
    @Override
    public Map deleteBatch(String ids) throws Exception {
        String [] csy110_list=ids.split(",");
        Map map=new HashMap();
        Map resultmap=new HashMap();
        int success_num=0;
        for (String csy110 : csy110_list) {
            map.put("csy110", csy110);
            int i=sy11Mapper.deleteSy11(map);
            if(i==1){
                success_num+=1;
            }
        }
        if(success_num!=csy110_list.length){
            throw new RuntimeException(OperateStatu.DELETE_SY11_FAIL);
        }
        resultmap.put("statu", OperateStatu.DELETE_SY11_SUCCESS);
        return resultmap;
    }
    @Override
    public Map queryLab(String csy110) throws Exception {
        Map map=new HashMap();
        map.put("csy110", csy110);
        return sy11Mapper.queryLab(map);
    }
    @Override
    public Map updateLab(Sy11 sy11) throws Exception {
        sy11.setCsy116((byte)0);
        int i=sy11Mapper.updateLab(sy11);
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(OperateStatu.UPDATE_SY11_FAIL);
        }
        map.put("statu", OperateStatu.INSERT_SY11_SUCCESS);
        return map;
    }
    @Override
    public Map validateCsy101(String csy101) throws Exception {
        Sy10 sy10=new Sy10();
        sy10.setCsy101(csy101);
        Map map=new HashMap();
        Map map_1=new HashMap();
        map_1.put("csy101", csy101);
        Integer i=sy10Mapper.validateCsy101(map_1);
        if(i!=0){
            map.put("statu", OperateStatu.VALIDATE_SY10_FAIL);
            return map;
        }
        map.put("statu", OperateStatu.VALIDATE_SY10_SUCCESS);
        return map;
    }
    @Override
    public Map addCsy101(Sy10 sy10) throws Exception {
        sy10.setCsy102((byte)0);
        int i=sy10Mapper.addCsy101(sy10);
        
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(OperateStatu.INSERT_SY10_FAIL);
        }
        map.put("statu", OperateStatu.INSERT_SY10_SUCCESS);
        return map;
    }
    @Override
    public Map deleteType(String csy100) throws Exception {
        int i=sy10Mapper.deleteType(csy100);
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(OperateStatu.DELETE_SY10_FAIL);
        }
        map.put("statu", OperateStatu.DELETE_SY10_SUCCESS);
        return map;
    }
    @Override
    public Map validateIsOkDelete(String csy100) throws Exception {
        Map map=new HashMap();
        map.put("csy100", csy100);
        List<Map> list=sy11Mapper.queryLabList(map);
        Map map_1=new HashMap();
        if(list.size()>0){
            map_1.put("statu", OperateStatu.VALIDATE_DELETE_SY10_FAIL);
            return map_1;
        }
        map_1.put("statu", OperateStatu.VALIDATE_DELETE_SY10_SUCCESS);
        return map_1;
    }
    @Override
    public Map updateType(Sy10 sy10) throws Exception {
        int i=sy10Mapper.updateType(sy10);
        Map map=new HashMap();
        if(i!=1){
            throw new RuntimeException(OperateStatu.UPDATE_SY10_FAIL);
        }
        map.put("statu", OperateStatu.UPDATE_SY10_SUCCESS);
        return map;
    }
    @Override
    public Map validateLab(Sy11 sy11) throws Exception {
        List<Sy11> list=sy11Mapper.validateLab(sy11);
        Map map=new HashMap();
        if(list.size()>0){
            map.put("statu", OperateStatu.VALIDATE_SY11_FAIL);
            return map;
        }
        map.put("statu", OperateStatu.VALIDATE_SY11_SUCCESS);
        return map;
    }
    @Override
    public PageEntity<Map> queryLabApply(Integer pageNum,Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Map> allList =sy12Mapper.queryLabApply();
        PageEntity<Map> pageBean = new PageEntity<Map>();
        pageBean.setList(allList);
        int size =sy12Mapper.queryLabApply().size();
        pageBean.setCount(size);
        return pageBean;
    }
    @Override
    public int queryLabApplyCount() throws Exception {
        return sy12Mapper.queryLabApply().size();
    }
    @Override
    public List<Map> queryCsy113() throws Exception {
        return aa10Mapper.queryCsy113();
    }

}

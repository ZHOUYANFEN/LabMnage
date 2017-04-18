package com.bysj.cqjtu.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.dao.Sy17Mapper;
import com.bysj.cqjtu.log.domain.Sy17;
import com.bysj.cqjtu.manager.service.RecordService;
import com.bysj.cqjtu.util.PageEntity;
import com.github.pagehelper.PageHelper;
@Service
public class RecordServiceImpl implements RecordService {
    
    @Autowired 
    private Sy17Mapper sy17Mapper;
    @Override
    public PageEntity<Sy17> querySy17(Integer pageNum, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Sy17> allList =sy17Mapper.querySy17();
        PageEntity<Sy17> pageBean = new PageEntity<Sy17>();
        pageBean.setList(allList);
        int size =sy17Mapper.querySy17().size();
        pageBean.setCount(size);
        return pageBean;
    }
    @Override
    public int querySy17Count() throws Exception {
        return sy17Mapper.querySy17().size();
    }

}

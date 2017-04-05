package com.bysj.cqjtu.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.common.dao.Sy14Mapper;
import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.common.service.AnouncementService;
@Service
public class AnouncementServiceImpl implements AnouncementService {
    
    @Autowired
    private Sy14Mapper sy14Mapper;
    
    @Override
    public List<Sy14> queryanouncement() throws Exception {
        return sy14Mapper.queryanouncement();
    }

    @Override
    public Sy14 getNewAnouncement() throws Exception {
        return sy14Mapper.getNewAnouncement();
    }

}

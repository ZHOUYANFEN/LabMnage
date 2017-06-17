package com.bysj.cqjtu.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.manager.service.ResourceService;
import com.bysj.cqjtu.student.dao.Sy13Mapper;
import com.bysj.cqjtu.student.dao.Sy16Mapper;
import com.bysj.cqjtu.student.domain.Sy13;
/**
 * 资源管理实现类
 * @author fuzhengjun
 *2017年4月14日上午9:37:03
 *
 */
@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    private Sy16Mapper sy16Mapper;
    @Autowired
    private Sy13Mapper sy13Mapper;
   
    @Override
    @SystemServiceLog(description="获取资源类型")
    public List<Map> queryResourceType() throws Exception {
        return sy16Mapper.queryResourceType();
    }
    @Override
    public List<Map> queryResourceList(String csy160) throws Exception {
        Sy13 sy13 =new Sy13();
        sy13.setCsy160(Integer.parseInt(csy160));
        return sy13Mapper.queryResourceList(sy13);
    }

}

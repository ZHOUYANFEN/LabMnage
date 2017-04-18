package com.bysj.cqjtu.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.service.ResourceService;

/**
 * 管理员的资源管理部分
 * @author fuzhengjun
 *2017年4月14日上午9:33:18
 *
 */
@Controller
@RequestMapping("/resource")
public class ResourceController {
    
    @Autowired
    private ResourceService resourceService;
    /**
     * 查看资源类型
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceType")
    @ResponseBody
    @SystemControllerLog(description ="查看资源类型")
    public List<Map> queryResourceType() throws Exception{
        
        List<Map> list=resourceService.queryResourceType();
        return list;
    }
    /**
     * 查看资源列表
     * @param csy160
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceList")
    @ResponseBody
    @SystemControllerLog(description ="查看资源列表")
    public List<Map>  queryResourceList(String csy160) throws Exception{
        List<Map> list=resourceService.queryResourceList(csy160);
        return list;
    }
}

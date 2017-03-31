package com.bysj.cqjtu.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.common.domain.Sy14;
import com.bysj.cqjtu.common.service.AnouncementService;

@RequestMapping("/anouncement")
@Controller
public class AnouncementController {
    @Autowired
    private AnouncementService anouncementService;
    
    /**
     * 查询公告
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryanouncement")
    @ResponseBody
    public List<Sy14> queryanouncement() throws Exception{
        List<Sy14> list=anouncementService.queryanouncement();
        return list;
    }
}

package com.bysj.cqjtu.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.cqjtu.manager.domain.Sy10;
import com.bysj.cqjtu.manager.domain.Sy11;
import com.bysj.cqjtu.manager.service.LabService;
/**
 * 实验室管理controller
 * @author fuzhengjun
 *2017年4月7日下午10:30:06
 *
 */
@Controller
@RequestMapping("/lab")
public class LabController {
    
    @Autowired
    private LabService labService;
    
    /**
     * 查询实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabType")
    @ResponseBody
    public List<Map> queryLabType() throws Exception{
        List<Map> list=labService.queryLabType();
        return list;
    }
    /**
     * 查询对应类型下的实验室列表
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLabList")
    @ResponseBody
    public List<Map> queryLabList(String csy100) throws Exception{
        List<Map> list=labService.queryLabList(csy100);
        return list;
    }
    /**
     * 添加实验室信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/addLab")
    @ResponseBody
    public Map addLab(@RequestBody Sy11 sy11) throws Exception{
        Map map=labService.addLab(sy11);
        return map;
    }
    /**
     * 删除实验室信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Map deleteBatch(String ids) throws Exception{
        Map map=labService.deleteBatch(ids);
        return map;
    }
    /**
     * 查询实验室具体信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLab")
    @ResponseBody
    public Map queryLab(String csy110) throws Exception{
        Map map=labService.queryLab(csy110);
        return map;
    }
    /**
     * 修改实验室具体信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateLab")
    @ResponseBody
    public Map updateLab(@RequestBody Sy11 sy11) throws Exception{
        Map map=labService.updateLab(sy11);
        return map;
    }
    /**
     * 验证实验室类型是否存在
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateCsy101")
    @ResponseBody
    public Map validateCsy101(String csy101) throws Exception{
        Map map=labService.validateCsy101(csy101);
        return map;
    }
    /**
     * 添加实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/addCsy101")
    @ResponseBody
    public Map addCsy101(@RequestBody Sy10 sy10) throws Exception{
        Map map=labService.addCsy101(sy10);
        return map;
    }
    /**
     * 刪除实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteType")
    @ResponseBody
    public Map deleteType(String csy100) throws Exception{
        Map map=labService.deleteType(csy100);
        return map;
    }
    /**
     * 判断实验室类型是否可以删除
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateIsOkDelete")
    @ResponseBody
    public Map validateIsOkDelete(String csy100) throws Exception{
        Map map=labService.validateIsOkDelete(csy100);
        return map;
    }
    /**
     * 修改实验室类型
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateType")
    @ResponseBody
    public Map updateType(@RequestBody Sy10 sy10) throws Exception{
        Map map=labService.updateType(sy10);
        return map;
    }
    /**
     * 验证实验室是否存在
     * @param sy11
     * @return
     * @throws Exception
     */
    @RequestMapping("/validateLab")
    @ResponseBody
    public Map validateLab(@RequestBody Sy11 sy11) throws Exception{
        Map map=labService.validateLab(sy11);
        return map;
    }
}

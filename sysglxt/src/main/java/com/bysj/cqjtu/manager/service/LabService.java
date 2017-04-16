package com.bysj.cqjtu.manager.service;

import java.util.List;
import java.util.Map;

import com.bysj.cqjtu.manager.domain.Sy10;
import com.bysj.cqjtu.manager.domain.Sy11;

/**
 * 实验室管理service
 * @author fuzhengjun
 *2017年4月7日下午10:32:20
 *
 */
public interface LabService {
    
    /**
     * 查询实验室类型
     * @return
     * @throws Exception
     */
    public List<Map> queryLabType() throws Exception;
    /**
     * 查询对应类型下的实验室列表
     * @return
     * @throws Exception
     */
    public List<Map> queryLabList(String csy100) throws Exception;
    /**
     * 添加实验室信息
     * @return
     * @throws Exception
     */
    public Map addLab(Sy11 sy11) throws Exception;
    /**
     * 批量删除实验室信息
     * @param ids
     * @return
     * @throws Exception
     */
    public Map deleteBatch(String ids) throws Exception;
    /**
     * 查询实验室具体信息
     * @return
     * @throws Exception
     */
    public Map queryLab(String csy110) throws Exception;
    /**
     * 修改实验室具体信息
     * @return
     * @throws Exception
     */
    public Map updateLab(Sy11 sy11) throws Exception;
    /**
     * 验证实验室类型是否存在
     * @return
     * @throws Exception
     */
    public Map validateCsy101(String csy101) throws Exception;
    /**
     * 添加实验室类型
     * @param sy10
     * @return
     * @throws Exception
     */
    public Map addCsy101(Sy10 sy10) throws Exception;
    /**
     * 刪除实验室类型
     * @return
     * @throws Exception
     */
    public Map deleteType(String csy100) throws Exception;
    /**
     * 判断实验室类型是否可以删除
     * @return
     * @throws Exception
     */
    public Map validateIsOkDelete(String csy100) throws Exception;
    /**
     * 修改实验室类型
     * @param sy10
     * @return
     * @throws Exception
     */
    public Map updateType(Sy10 sy10) throws Exception;
    /**
     * 验证实验室是否存在
     * @param sy11
     * @return
     * @throws Exception
     */
    public Map validateLab(Sy11 sy11) throws Exception;
    /**
     * 查询实验室申请
     * @return
     * @throws Exception
     */
    public List<Map> queryLabApply() throws Exception;
}

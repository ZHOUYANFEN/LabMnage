package com.bysj.cqjtu.util;

import java.io.Serializable;
import java.util.List;

/**
 * 分页实体
 * @author fuzhengjun
 *2017年4月17日下午2:15:13
 *@param <T>
 *
 */
public class PageEntity<T> implements Serializable {
    private List<T> list;// 分页后的数据
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}

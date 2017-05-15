package com.bysj.cqjtu.manager.pojo;

import java.io.Serializable;
/**
 * 打印用户信息
 * @author fuzhengjun
 *2017年5月15日下午5:00:22
 *
 */

public class UserPrint implements Serializable{
    private String orders;
    private String csy021;
    private String csy020;
    private String csy011;

    public String getCsy020() {
        return csy020;
    }
    public void setCsy020(String csy020) {
        this.csy020 = csy020;
    }
    public String getOrders() {
        return orders;
    }
    public void setOrders(String orders) {
        this.orders = orders;
    }
    public String getCsy021() {
        return csy021;
    }
    public void setCsy021(String csy021) {
        this.csy021 = csy021;
    }
    public String getCsy011() {
        return csy011;
    }
    public void setCsy011(String csy011) {
        this.csy011 = csy011;
    }
      
    
}

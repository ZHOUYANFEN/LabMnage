package com.bysj.cqjtu.log.domain;

import java.io.Serializable;

public class Sy17 implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private Integer csy170;

    private String csy171;

    private String csy172;

    private String csy173;

    private String csy174;

    private String csy175;

    private String csy176;

    private String csy177;

    private String csy178;

    public Integer getCsy170() {
        return csy170;
    }

    public void setCsy170(Integer csy170) {
        this.csy170 = csy170;
    }

    public String getCsy171() {
        return csy171;
    }

    public void setCsy171(String csy171) {
        this.csy171 = csy171 == null ? null : csy171.trim();
    }

    public String getCsy172() {
        return csy172;
    }

    public void setCsy172(String csy172) {
        this.csy172 = csy172 == null ? null : csy172.trim();
    }

    public String getCsy173() {
        return csy173;
    }

    public void setCsy173(String csy173) {
        this.csy173 = csy173 == null ? null : csy173.trim();
    }

    public String getCsy174() {
        return csy174;
    }

    public void setCsy174(String csy174) {
        this.csy174 = csy174 == null ? null : csy174.trim();
    }

    public String getCsy175() {
        return csy175;
    }

    public void setCsy175(String csy175) {
        this.csy175 = csy175 == null ? null : csy175.trim();
    }

    public String getCsy176() {
        return csy176;
    }

    public void setCsy176(String csy176) {
        this.csy176 = csy176 == null ? null : csy176.trim();
    }

    public String getCsy177() {
        return csy177;
    }

    public void setCsy177(String csy177) {
        this.csy177 = csy177 == null ? null : csy177.trim();
    }

    public String getCsy178() {
        return csy178;
    }

    public void setCsy178(String csy178) {
        this.csy178 = csy178 == null ? null : csy178.trim();
    }

    @Override
    public String toString() {
        return "日志信息[ 登录用户：" + csy171 + ", 访问方法："
                + csy172 + ", IP地址：" + csy173 + ",访问时间 ：" + csy174
                + ", 浏览器类型：" + csy175 + ", 访问系统：" + csy176 + ", 主机名称："
                + csy177 + ", MAC地址：" + csy178 + "]";
    }
    
}
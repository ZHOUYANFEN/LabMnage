package com.bysj.cqjtu.student.domain;

import java.io.Serializable;

public class Sy07 implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private String csy040;

    private String csy060;

    private Integer csy071;

    public String getCsy040() {
        return csy040;
    }

    public void setCsy040(String csy040) {
        this.csy040 = csy040 == null ? null : csy040.trim();
    }

    public String getCsy060() {
        return csy060;
    }

    public void setCsy060(String csy060) {
        this.csy060 = csy060 == null ? null : csy060.trim();
    }

    public Integer getCsy071() {
        return csy071;
    }

    public void setCsy071(Integer csy071) {
        this.csy071 = csy071;
    }
}
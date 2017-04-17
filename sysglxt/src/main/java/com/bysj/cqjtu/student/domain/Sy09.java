package com.bysj.cqjtu.student.domain;

import java.io.Serializable;
import java.util.Date;

public class Sy09 implements Serializable{
    private Integer csy090;

    private String csy040;

    private String csy080;

    private String csy091;

    private Date csy092;

    private String csy093;

    private String csy094;

    private Byte csy095;

    public Integer getCsy090() {
        return csy090;
    }

    public void setCsy090(Integer csy090) {
        this.csy090 = csy090;
    }

    public String getCsy040() {
        return csy040;
    }

    public void setCsy040(String csy040) {
        this.csy040 = csy040 == null ? null : csy040.trim();
    }

    public String getCsy080() {
        return csy080;
    }

    public void setCsy080(String csy080) {
        this.csy080 = csy080 == null ? null : csy080.trim();
    }

    public String getCsy091() {
        return csy091;
    }

    public void setCsy091(String csy091) {
        this.csy091 = csy091 == null ? null : csy091.trim();
    }

    public Date getCsy092() {
        return csy092;
    }

    public void setCsy092(Date csy092) {
        this.csy092 = csy092;
    }

    public String getCsy093() {
        return csy093;
    }

    public void setCsy093(String csy093) {
        this.csy093 = csy093 == null ? null : csy093.trim();
    }

    public String getCsy094() {
        return csy094;
    }

    public void setCsy094(String csy094) {
        this.csy094 = csy094 == null ? null : csy094.trim();
    }

    public Byte getCsy095() {
        return csy095;
    }

    public void setCsy095(Byte csy095) {
        this.csy095 = csy095;
    }
}
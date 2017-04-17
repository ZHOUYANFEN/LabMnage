package com.bysj.cqjtu.manager.domain;

import java.io.Serializable;

public class Sy11 implements Serializable{
    private Integer csy110;

    private String csy100;

    private String csy111;

    private String csy112;

    private String csy113;

    private Byte csy114;

    private String csy115;

    private Byte csy116;

    public Integer getCsy110() {
        return csy110;
    }

    public void setCsy110(Integer csy110) {
        this.csy110 = csy110;
    }

    public String getCsy100() {
        return csy100;
    }

    public void setCsy100(String csy100) {
        this.csy100 = csy100 == null ? null : csy100.trim();
    }

    public String getCsy111() {
        return csy111;
    }

    public void setCsy111(String csy111) {
        this.csy111 = csy111 == null ? null : csy111.trim();
    }

    public String getCsy112() {
        return csy112;
    }

    public void setCsy112(String csy112) {
        this.csy112 = csy112 == null ? null : csy112.trim();
    }

    public String getCsy113() {
        return csy113;
    }

    public void setCsy113(String csy113) {
        this.csy113 = csy113 == null ? null : csy113.trim();
    }

    public Byte getCsy114() {
        return csy114;
    }

    public void setCsy114(Byte csy114) {
        this.csy114 = csy114;
    }

    public String getCsy115() {
        return csy115;
    }

    public void setCsy115(String csy115) {
        this.csy115 = csy115 == null ? null : csy115.trim();
    }

    public Byte getCsy116() {
        return csy116;
    }

    public void setCsy116(Byte csy116) {
        this.csy116 = csy116;
    }
}
package com.bysj.cqjtu.manager.domain;

import java.io.Serializable;

public class Sy02 implements Serializable{
    private Integer csy020;

    private Byte csy010;

    private String csy021;

    private String csy022;

    private Byte csy023;

    public Integer getCsy020() {
        return csy020;
    }

    public void setCsy020(Integer csy020) {
        this.csy020 = csy020;
    }

    public Byte getCsy010() {
        return csy010;
    }

    public void setCsy010(Byte csy010) {
        this.csy010 = csy010;
    }

    public String getCsy021() {
        return csy021;
    }

    public void setCsy021(String csy021) {
        this.csy021 = csy021 == null ? null : csy021.trim();
    }

    public String getCsy022() {
        return csy022;
    }

    public void setCsy022(String csy022) {
        this.csy022 = csy022 == null ? null : csy022.trim();
    }

    public Byte getCsy023() {
        return csy023;
    }

    public void setCsy023(Byte csy023) {
        this.csy023 = csy023;
    }

    @Override
    public String toString() {
        return "Sy02 [csy020=" + csy020 + ", csy010=" + csy010 + ", csy021="
                + csy021 + ", csy022=" + csy022 + ", csy023=" + csy023 + "]";
    }
    
}
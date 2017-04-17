package com.bysj.cqjtu.manager.domain;

import java.io.Serializable;

public class Sy03 implements Serializable{
    private Integer csy030;

    private String csy020;

    private String csy031;

    private String csy032;

    public Integer getCsy030() {
        return csy030;
    }

    public void setCsy030(Integer csy030) {
        this.csy030 = csy030;
    }

    public String getCsy020() {
        return csy020;
    }

    public void setCsy020(String csy020) {
        this.csy020 = csy020 == null ? null : csy020.trim();
    }

    public String getCsy031() {
        return csy031;
    }

    public void setCsy031(String csy031) {
        this.csy031 = csy031 == null ? null : csy031.trim();
    }

    public String getCsy032() {
        return csy032;
    }

    public void setCsy032(String csy032) {
        this.csy032 = csy032 == null ? null : csy032.trim();
    }

    @Override
    public String toString() {
        return "Sy03 [csy030=" + csy030 + ", csy020=" + csy020 + ", csy031="
                + csy031 + ", csy032=" + csy032 + "]";
    }
    
}
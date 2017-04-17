package com.bysj.cqjtu.manager.domain;

import java.io.Serializable;

public class Sy05 implements Serializable{
    private Integer csy050;

    private String csy020;

    private String csy051;

    private String csy052;

    private String csy053;

    public Integer getCsy050() {
        return csy050;
    }

    public void setCsy050(Integer csy050) {
        this.csy050 = csy050;
    }

    public String getCsy020() {
        return csy020;
    }

    public void setCsy020(String csy020) {
        this.csy020 = csy020 == null ? null : csy020.trim();
    }

    public String getCsy051() {
        return csy051;
    }

    public void setCsy051(String csy051) {
        this.csy051 = csy051 == null ? null : csy051.trim();
    }

    public String getCsy052() {
        return csy052;
    }

    public void setCsy052(String csy052) {
        this.csy052 = csy052 == null ? null : csy052.trim();
    }

    public String getCsy053() {
        return csy053;
    }

    public void setCsy053(String csy053) {
        this.csy053 = csy053 == null ? null : csy053.trim();
    }

    @Override
    public String toString() {
        return "Sy05 [csy050=" + csy050 + ", csy020=" + csy020 + ", csy051="
                + csy051 + ", csy052=" + csy052 + ", csy053=" + csy053 + "]";
    }
    
}
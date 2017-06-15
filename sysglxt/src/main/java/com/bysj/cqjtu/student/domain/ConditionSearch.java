package com.bysj.cqjtu.student.domain;

import com.bysj.cqjtu.manager.domain.Sy05;

public class ConditionSearch {
    private Sy05 sy05;
    private String csy061;
    
    public ConditionSearch(Sy05 sy05, String csy061) {
        super();
        this.sy05 = sy05;
        this.csy061 = csy061;
    }
    public Sy05 getSy05() {
        return sy05;
    }
    public void setSy05(Sy05 sy05) {
        this.sy05 = sy05;
    }
    public String getCsy061() {
        return csy061;
    }
    public void setCsy061(String csy061) {
        this.csy061 = csy061;
    }
    @Override
    public String toString() {
        return "ConditionSearch [sy05=" + sy05 + ", csy061=" + csy061 + "]";
    }
    
}

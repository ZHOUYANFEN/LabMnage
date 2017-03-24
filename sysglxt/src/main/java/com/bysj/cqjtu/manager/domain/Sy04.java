package com.bysj.cqjtu.manager.domain;

public class Sy04 {
    private String csy040;

    private Integer csy020;

    private String csy041;

    private String csy042;

    private String csy043;

    public String getCsy040() {
        return csy040;
    }

    public void setCsy040(String csy040) {
        this.csy040 = csy040 == null ? null : csy040.trim();
    }

    public Integer getCsy020() {
        return csy020;
    }

    public void setCsy020(Integer csy020) {
        this.csy020 = csy020;
    }

    public String getCsy041() {
        return csy041;
    }

    public void setCsy041(String csy041) {
        this.csy041 = csy041 == null ? null : csy041.trim();
    }

    public String getCsy042() {
        return csy042;
    }

    public void setCsy042(String csy042) {
        this.csy042 = csy042 == null ? null : csy042.trim();
    }

    public String getCsy043() {
        return csy043;
    }

    public void setCsy043(String csy043) {
        this.csy043 = csy043 == null ? null : csy043.trim();
    }

    @Override
    public String toString() {
        return "Sy04 [csy040=" + csy040 + ", csy020=" + csy020 + ", csy041="
                + csy041 + ", csy042=" + csy042 + ", csy043=" + csy043 + "]";
    }
    
}
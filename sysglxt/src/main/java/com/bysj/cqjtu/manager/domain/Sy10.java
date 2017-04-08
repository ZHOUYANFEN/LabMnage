package com.bysj.cqjtu.manager.domain;

public class Sy10 {
    private Integer csy100;

    private String csy101;

    private Byte csy102;

    public Integer getCsy100() {
        return csy100;
    }

    public void setCsy100(Integer csy100) {
        this.csy100 = csy100;
    }

    public String getCsy101() {
        return csy101;
    }

    public void setCsy101(String csy101) {
        this.csy101 = csy101 == null ? null : csy101.trim();
    }

    public Byte getCsy102() {
        return csy102;
    }

    public void setCsy102(Byte csy102) {
        this.csy102 = csy102;
    }
}
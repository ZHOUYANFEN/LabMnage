package com.bysj.cqjtu.index.domain;

import java.io.Serializable;

public class Sy01 implements Serializable{
    private Byte csy010;

    private String csy011;

    private Byte csy012;

    public Byte getCsy010() {
        return csy010;
    }

    public void setCsy010(Byte csy010) {
        this.csy010 = csy010;
    }

    public String getCsy011() {
        return csy011;
    }

    public void setCsy011(String csy011) {
        this.csy011 = csy011 == null ? null : csy011.trim();
    }

    public Byte getCsy012() {
        return csy012;
    }

    public void setCsy012(Byte csy012) {
        this.csy012 = csy012;
    }
}
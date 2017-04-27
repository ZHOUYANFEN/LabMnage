package com.bysj.cqjtu.student.domain;

import java.io.Serializable;
import java.util.Date;

public class Sy08 implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private Integer csy080;


    private String csy060;

    private String csy050;

    private String csy081;

    private String csy082;

    private Date csy083;

    private Date csy084;

    private Byte csy085;

    public Integer getCsy080() {
        return csy080;
    }

    public void setCsy080(Integer csy080) {
        this.csy080 = csy080;
    }


    public String getCsy060() {
        return csy060;
    }

    public void setCsy060(String csy060) {
        this.csy060 = csy060 == null ? null : csy060.trim();
    }

    public String getCsy050() {
        return csy050;
    }

    public void setCsy050(String csy050) {
        this.csy050 = csy050 == null ? null : csy050.trim();
    }

    public String getCsy081() {
        return csy081;
    }

    public void setCsy081(String csy081) {
        this.csy081 = csy081 == null ? null : csy081.trim();
    }

    public String getCsy082() {
        return csy082;
    }

    public void setCsy082(String csy082) {
        this.csy082 = csy082 == null ? null : csy082.trim();
    }

    public Date getCsy083() {
        return csy083;
    }

    public void setCsy083(Date csy083) {
        this.csy083 = csy083;
    }

    public Date getCsy084() {
        return csy084;
    }

    public void setCsy084(Date csy084) {
        this.csy084 = csy084;
    }

    public Byte getCsy085() {
        return csy085;
    }

    public void setCsy085(Byte csy085) {
        this.csy085 = csy085;
    }
}
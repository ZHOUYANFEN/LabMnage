package com.bysj.cqjtu.manager.pojo;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.domain.Sy03;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.domain.Sy05;

/**
 * 封装类，用于保存学生信息
 * @author fuzhengjun
 *2017年3月24日上午9:58:54
 *
 */
public class UserMessage {
    private Sy02 sy02;
    private Sy04 sy04;
    private Sy03 sy03;
    private Sy05 sy05;
    
    public Sy03 getSy03() {
        return sy03;
    }
    public void setSy03(Sy03 sy03) {
        this.sy03 = sy03;
    }
    public Sy05 getSy05() {
        return sy05;
    }
    public void setSy05(Sy05 sy05) {
        this.sy05 = sy05;
    }
    public Sy02 getSy02() {
        return sy02;
    }
    public void setSy02(Sy02 sy02) {
        this.sy02 = sy02;
    }
    public Sy04 getSy04() {
        return sy04;
    }
    public void setSy04(Sy04 sy04) {
        this.sy04 = sy04;
    }
    @Override
    public String toString() {
        return "UserMessage [sy02=" + sy02 + ", sy04=" + sy04 + ", sy03="
                + sy03 + ", sy05=" + sy05 + "]";
    }
    
}

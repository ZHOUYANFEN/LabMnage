package com.bysj.cqjtu.teacher.dto;

import com.bysj.cqjtu.manager.domain.Sy10;
import com.bysj.cqjtu.manager.domain.Sy11;
import com.bysj.cqjtu.manager.domain.Sy12;

public class LabManager {
	
    private Sy10 sy10;
    private Sy11 sy11;
    private Sy12 sy12;
    
	public Sy10 getSy10() {
		return sy10;
	}
	public void setSy10(Sy10 sy10) {
		this.sy10 = sy10;
	}
	public Sy11 getSy11() {
		return sy11;
	}
	public void setSy11(Sy11 sy11) {
		this.sy11 = sy11;
	}
	public Sy12 getSy12() {
		return sy12;
	}
	public void setSy12(Sy12 sy12) {
		this.sy12 = sy12;
	}
    
    @Override
    public String toString() {
        return "LabManager [sy10=" + sy10 + ", sy11=" + sy11 + ", sy12="
                + sy12 + "]";
    }

}

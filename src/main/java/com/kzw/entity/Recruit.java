package com.kzw.entity;

import java.util.Date;

public class Recruit {
    private Integer reid;

    private Integer deptid;

    private Integer positionid;

    private String describes;

    private String numbs;

    private Date valuetime;
    
    private Dept dept;
    
    private Position position;
    

    
    
    @Override
	public String toString() {
		return "Recruit [reid=" + reid + ", deptid=" + deptid + ", positionid=" + positionid + ", describe=" + describes
				+ ", numbs=" + numbs + ", valuetime=" + valuetime + ", dept=" + dept + ", position=" + position + "]";
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Integer getReid() {
        return reid;
    }

    public void setReid(Integer reid) {
        this.reid = reid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describe) {
        this.describes = describe == null ? null : describe.trim();
    }

    public String getNumbs() {
        return numbs;
    }

    public void setNumbs(String numbs) {
        this.numbs = numbs == null ? null : numbs.trim();
    }

    public Date getValuetime() {
        return valuetime;
    }

    public void setValuetime(Date valuetime) {
        this.valuetime = valuetime;
    }
}
package com.kzw.entity;

import java.util.Date;

public class Train {
    private Integer trainId;

    private String content;

    private Integer deptId;

    private Integer empId;

    private Date time;
    
    private Dept dept;
    
    private Position position;

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

	public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

	@Override
	public String toString() {
		return "Train [trainId=" + trainId + ", content=" + content + ", deptId=" + deptId + ", empId=" + empId
				+ ", time=" + time + ", dept=" + dept + ", position=" + position + "]";
	}
    
    
    
}
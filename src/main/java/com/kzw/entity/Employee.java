package com.kzw.entity;

public class Employee {
    private Integer empId;

    private String empName;

    private Integer status;

    private Integer deptId;

    private Integer positionId;

    private Dept dept;
    
    private Position position;   
    
    
    @Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", status=" + status + ", deptId=" + deptId
				+ ", positionId=" + positionId + ", dept=" + dept + ", position=" + position + "]";
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

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }
}
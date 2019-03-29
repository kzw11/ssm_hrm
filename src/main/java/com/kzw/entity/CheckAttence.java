package com.kzw.entity;

import java.util.Date;

public class CheckAttence {
    private Integer id;

    private Date starttime;

    private Date endtime;

    private String status;

    private Integer empId;

    private Integer islate;

    private Integer isabsent;
    
    private Employee emp;
    
    

    public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getIslate() {
        return islate;
    }

    public void setIslate(Integer islate) {
        this.islate = islate;
    }

    public Integer getIsabsent() {
        return isabsent;
    }

    public void setIsabsent(Integer isabsent) {
        this.isabsent = isabsent;
    }
}
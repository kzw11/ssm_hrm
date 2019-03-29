package com.kzw.entity;

import java.util.Date;

public class ObjectionSalary {
    private Integer id;

    private Integer empId;

    private Date time;

    private String errcontent;

    private Double money;

    private Date reissueTime;

    private Integer isexecute;
    
    private Employee employee;
    
    

    public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getErrcontent() {
        return errcontent;
    }

    public void setErrcontent(String errcontent) {
        this.errcontent = errcontent == null ? null : errcontent.trim();
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getReissueTime() {
        return reissueTime;
    }

    public void setReissueTime(Date reissueTime) {
        this.reissueTime = reissueTime;
    }

    public Integer getIsexecute() {
        return isexecute;
    }

    public void setIsexecute(Integer isexecute) {
        this.isexecute = isexecute;
    }
}
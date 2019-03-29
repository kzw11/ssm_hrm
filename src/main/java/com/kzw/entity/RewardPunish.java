package com.kzw.entity;

import java.util.Date;

public class RewardPunish {
    private Integer id;

    private Double money;

    private Date time;

    private String reason;

    private Integer empId;
    
    private Employee emp;
    
    

    @Override
	public String toString() {
		return "RewardPunish [id=" + id + ", money=" + money + ", time=" + time + ", reason=" + reason + ", empId="
				+ empId + ", emp=" + emp + "]";
	}

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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }
}
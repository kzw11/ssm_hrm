package com.kzw.entity;

import java.util.Date;

public class Salary {
    private Integer id;

    private Integer empId;

    private Date time;

    private Double base;

    private Double achievement;

    private Integer rewardId;

    private Double socialsec;

    private Integer disgree;

    private Integer ishandle;
    
    private RewardPunish rewardPunish;
    

    public RewardPunish getRewardPunish() {
		return rewardPunish;
	}

	public void setRewardPunish(RewardPunish rewardPunish) {
		this.rewardPunish = rewardPunish;
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

    public Double getBase() {
        return base;
    }

    public void setBase(Double base) {
        this.base = base;
    }

    public Double getAchievement() {
        return achievement;
    }

    public void setAchievement(Double achievement) {
        this.achievement = achievement;
    }

    public Integer getRewardId() {
        return rewardId;
    }

    public void setRewardId(Integer rewardId) {
        this.rewardId = rewardId;
    }

    public Double getSocialsec() {
        return socialsec;
    }

    public void setSocialsec(Double socialsec) {
        this.socialsec = socialsec;
    }

    public Integer getDisgree() {
        return disgree;
    }

    public void setDisgree(Integer disgree) {
        this.disgree = disgree;
    }

    public Integer getIshandle() {
        return ishandle;
    }

    public void setIshandle(Integer ishandle) {
        this.ishandle = ishandle;
    }
}
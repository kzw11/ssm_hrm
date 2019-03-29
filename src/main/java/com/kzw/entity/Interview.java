package com.kzw.entity;

import java.util.Date;

public class Interview {
    private Integer interviewId;

    private Integer reid;

    private Integer uid;

    private Date delivertime;

    private Integer resumeId;

    private Integer isread;

    private Integer noticeinterview;

    private Date interviewtime;

    private Integer isinterview;

    private Integer empId;

    private Integer isavail;
    
    private User user;
    
    

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(Integer interviewId) {
        this.interviewId = interviewId;
    }

    public Integer getReid() {
        return reid;
    }

    public void setReid(Integer reid) {
        this.reid = reid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getDelivertime() {
        return delivertime;
    }

    public void setDelivertime(Date delivertime) {
        this.delivertime = delivertime;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public Integer getNoticeinterview() {
        return noticeinterview;
    }

    public void setNoticeinterview(Integer noticeinterview) {
        this.noticeinterview = noticeinterview;
    }

    public Date getInterviewtime() {
        return interviewtime;
    }

    public void setInterviewtime(Date interviewtime) {
        this.interviewtime = interviewtime;
    }

    public Integer getIsinterview() {
        return isinterview;
    }

    public void setIsinterview(Integer isinterview) {
        this.isinterview = isinterview;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getIsavail() {
        return isavail;
    }

    public void setIsavail(Integer isavail) {
        this.isavail = isavail;
    }
}
package com.kzw.entity;

public class Resume {
    private Integer resumeId;

    private Integer userid;

    private String realname;

    private Integer age;

    private String phone;

    private String lastjob;

    private String salary;

    private String gender;

    private String eduction;

    private String email;

    private String politicalstatus;

    private String experience;

    private String hobby;

    private Integer deptId;

    private Integer positonId;
    
    

    @Override
	public String toString() {
		return "Resume [resumeId=" + resumeId + ", userid=" + userid + ", realname=" + realname + ", age=" + age
				+ ", phone=" + phone + ", lastjob=" + lastjob + ", salary=" + salary + ", gender=" + gender
				+ ", eduction=" + eduction + ", email=" + email + ", politicalstatus=" + politicalstatus
				+ ", experience=" + experience + ", hobby=" + hobby + ", deptId=" + deptId + ", positonId=" + positonId
				+ "]";
	}

	public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getLastjob() {
        return lastjob;
    }

    public void setLastjob(String lastjob) {
        this.lastjob = lastjob == null ? null : lastjob.trim();
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary == null ? null : salary.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEduction() {
        return eduction;
    }

    public void setEduction(String eduction) {
        this.eduction = eduction == null ? null : eduction.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPoliticalstatus() {
        return politicalstatus;
    }

    public void setPoliticalstatus(String politicalstatus) {
        this.politicalstatus = politicalstatus == null ? null : politicalstatus.trim();
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPositonId() {
        return positonId;
    }

    public void setPositonId(Integer positonId) {
        this.positonId = positonId;
    }
}
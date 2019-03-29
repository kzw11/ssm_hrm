package com.kzw.entity;

import java.util.Date;

public class Notice {
    private Integer id;

    private String title;

    private String content;

    private Date createtime;

    private Integer userId;
    
    private User user;
    
    

    
    
    @Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", content=" + content + ", createtime=" + createtime
				+ ", userId=" + userId + ", user=" + user + "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
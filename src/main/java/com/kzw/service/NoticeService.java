package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.NoticeMapper;
import com.kzw.entity.Notice;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper nm;
	
	public List<Notice> getAllNotice(){
		List<Notice> noticelist = nm.selectByExampleWithUser(null);
		if(noticelist!=null){
			return noticelist;
		}
		return null;
	}

	public int deleteNoticeById(Integer delDeptId) {
		return nm.deleteByPrimaryKey(delDeptId);
	}

	public int insertNotice(Notice notice) {
		return nm.insertSelective(notice);
	}
	
	public Notice getNoticeById(Integer id){
		return nm.selectByPrimaryKey(id);
	}

	public int updateNotice(Notice notice) {
		return nm.updateByPrimaryKeySelective(notice);
	}
	
}

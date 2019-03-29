package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.ResumeMapper;
import com.kzw.entity.Resume;
import com.kzw.entity.ResumeExample;
import com.kzw.entity.ResumeExample.Criteria;

@Service
public class ResumeService {

	@Autowired
	private ResumeMapper rMapper;
	
	public Resume getResumeById(int resumeId){
		Resume resume = rMapper.selectByPrimaryKey(resumeId);
		if(resume!=null){
			return resume;
		}
		return null;
	}
	
	public int insert(Resume resume){
		int i = rMapper.insertSelective(resume);
		return i;
	}
	
	/**
	 * 通过用户id获取简历信息
	 * @param userid
	 * @return
	 */
	public Resume getResumeBuUId(int userid){
		
		ResumeExample example = new ResumeExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Resume> resumelist = rMapper.selectByExample(example);
		if(resumelist.size()!=0){
			return resumelist.get(0);
		}
		
		return null;
	}
	
	public int updateResumeByPrimaryKey(Resume resume){
		
		int i = rMapper.updateByPrimaryKeySelective(resume);
		return i;
	}
	
	public int updateResume(Resume resume,int userid){
		ResumeExample example = new ResumeExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		
		int i = rMapper.updateByExampleSelective(resume, example);
		return i;
	}
}

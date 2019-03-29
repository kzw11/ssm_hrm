package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.RecruitMapper;
import com.kzw.entity.Recruit;

@Service
public class RecruitService {

	@Autowired
	private RecruitMapper reMapper;
	
	/**
	 * 查询所有的招聘信息
	 * @return
	 */
	public List<Recruit> getAllRecruit(){
		
		List<Recruit> reclist = reMapper.selectByExampleWithDeptAndPos(null);
		if(reclist.size()>0){
			return reclist;
		}
		
		return null;
	}
	
	/**
	 * 插入招聘信息
	 * @param rec
	 * @return
	 */
	public int insert(Recruit rec){

		int i = reMapper.insertSelective(rec);
		
		return i;		
	}
	
	/**
	 * 通过主键查找招聘信息
	 * @param rid
	 * @return
	 */
	public Recruit getRecruitById(int rid){
		Recruit recruit = reMapper.selectByPrimaryKeyWithDeptAndPos(rid);
		if(recruit!=null){
			return recruit;
		}
		return null;
	}
	
	
}

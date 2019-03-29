package com.kzw.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.InterviewMapper;
import com.kzw.entity.Interview;
import com.kzw.entity.InterviewExample;
import com.kzw.entity.InterviewExample.Criteria;

@Service
public class InterviewService {

	@Autowired
	private InterviewMapper iMapper;
	
	/**
	 * 查询所有的面试信息
	 * @return
	 */
	public List<Interview> getAllInterview(){
		List<Interview> interviewlist = iMapper.selectByExampleWithUser(null);
		if(interviewlist.size()>0){
			return interviewlist;
		}
		return null;
	}

	//通过id获取面试信息
	public Interview getInterviewById(Integer id){
		Interview interview = iMapper.selectByPrimaryKey(id);
		if(interview!=null){
			return interview;
		}
		return null;
	}
	
	public int insertInterview(int uid, Integer rid, int resumeId) {

		Interview interview  = new Interview();
		interview.setReid(rid);
		interview.setUid(uid);
		interview.setResumeId(resumeId);
		interview.setDelivertime(new Date());
		interview.setIsread(0);
		interview.setIsinterview(0);
		interview.setIsavail(0);
		interview.setEmpId(0);
		interview.setInterviewtime(null);
		interview.setNoticeinterview(0);
		int i = iMapper.insertSelective(interview);
		return i;
	}
	
	/**
	 * 通过用户Id获取所有的面试信息
	 * @param uid
	 * @return
	 */
	public List<Interview> getInterviewByUId(int uid){
		
		InterviewExample example = new InterviewExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		List<Interview> interviewlist = iMapper.selectByExample(example);
		
		if(interviewlist.size()!=0){
			return interviewlist;
		}
		return null;
	}

	/**
	 * 更新面试信息是否面试
	 * @param viewid
	 */
	public void updateInterview(Integer viewid) {
		Interview interview = new Interview();
		interview.setInterviewId(viewid);
		interview.setIsinterview(1);
		iMapper.updateByPrimaryKeySelective(interview);
	}

	
	
	public void updateInterviewandtime(Integer viewid,Date itime) {
		Interview interview = new Interview();
		interview.setInterviewId(viewid);
		interview.setInterviewtime(itime);
		interview.setIsread(1);
		interview.setNoticeinterview(1);
		iMapper.updateByPrimaryKeySelective(interview);
	}

	public void updateInterviewOffer(Integer interviewId, int empId) {

		Interview interview = new Interview();
		interview.setInterviewId(interviewId);
		interview.setIsavail(1);
		interview.setEmpId(empId);
		iMapper.updateByPrimaryKeySelective(interview);
	}
	
}

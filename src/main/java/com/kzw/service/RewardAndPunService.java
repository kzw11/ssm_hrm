package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.RewardPunishMapper;
import com.kzw.entity.RewardPunish;
import com.kzw.entity.RewardPunishExample;
import com.kzw.entity.RewardPunishExample.Criteria;

@Service
public class RewardAndPunService {

	@Autowired
	private RewardPunishMapper rm;
	
	/**
	 * 获取所有的员工的奖惩信息
	 * @return
	 */
	public List<RewardPunish> getAllRewardPunish(){
		
		List<RewardPunish> rwlist = rm.selectByExampleWithEmp(null);
		
		if(rwlist!=null){
			return rwlist;
		}
		
		return null;		
	}
	
	/**
	 * 根据员工号获取奖惩信息
	 * @param empId
	 * @return
	 */
	public List<RewardPunish> getAllRewardPubishById(Integer empId){

		RewardPunishExample example = new RewardPunishExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdEqualTo(empId);
		List<RewardPunish> rplist = rm.selectByExample(example);
		if(rplist.size()!=0){
			return rplist;
		}
		
		return null;
		
	}

	public int deleteReward(Integer rewardId) {
		int i = rm.deleteByPrimaryKey(rewardId);
		return i;
	}

	public int updateReward(RewardPunish reward) {
		return rm.updateByPrimaryKeySelective(reward);
	}
	
	
	public int insertReward(RewardPunish reward){
		int i = rm.insertSelective(reward);
		return i;
	}
}

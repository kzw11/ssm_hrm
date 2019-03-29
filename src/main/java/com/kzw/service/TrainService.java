package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.EmpTrainMapper;
import com.kzw.dao.TrainMapper;
import com.kzw.entity.EmpTrain;
import com.kzw.entity.Train;
import com.kzw.entity.TrainExample;
import com.kzw.entity.TrainExample.Criteria;

@Service
public class TrainService {

	@Autowired
	private TrainMapper trMapper;
	
	@Autowired
	private EmpTrainMapper etMapper;
	/**
	 * 返回所有的培训信息
	 * @return
	 */
	public List<Train> getAllTrain(){
		List<Train> trainlist = trMapper.selectByExampleWithDeptAndPos(null);
		if(trainlist.size()>0){
			return trainlist;
		}
		return null;
	}
	
	/**
	 * 通过部门Id得到培新内容
	 * @param deptId
	 * @return
	 */
	public List<Train> getTrainByDeptId(int deptId){
		TrainExample example = new TrainExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptIdEqualTo(deptId);
		List<Train> trainlist = trMapper.selectByExample(example);
		if(trainlist.size()>0){
			return trainlist;
		}
		return null;
	}
	
	
	/**
	 * 通过职位Id得到培新内容
	 * @param deptId
	 * @return
	 */
	public List<Train> getTrainByPosId(int positionid){
		TrainExample example = new TrainExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdEqualTo(positionid);
		List<Train> trainlist = trMapper.selectByExample(example);
		if(trainlist.size()>0){
			return trainlist;
		}
		return null;
	}
	
	//增加一条培训内容
	public int insertTrain(Train train){
		
		int i = trMapper.insertSelective(train);
		
		return i;
	}

	//根据主键删除
	public int deleteTrainById(Integer trainId) {
		int i = trMapper.deleteByPrimaryKey(trainId);
		return i;
	}

	/**
	 * 更新培训信息
	 * @param train
	 * @return
	 */
	public int updateTrain(Train train) {
		return trMapper.updateByPrimaryKeySelective(train);
	}
	
	
	/**
	 * 
	 */
	public void insertEmpTrain(EmpTrain et){
		etMapper.insertSelective(et);
	}
	
}

package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kzw.dao.PositionMapper;
import com.kzw.entity.Position;
import com.kzw.entity.PositionExample;
import com.kzw.entity.PositionExample.Criteria;

@Service
public class PositionService {

	@Autowired
	private PositionMapper posMapper;
	
	public List<Position> getAllPos(){
		
		List<Position> poslist = posMapper.selectByExampleWithDept(null);
		if(poslist.size()>0){
			return poslist;
		}
		
		return null;
	}
	
	
	/**
	 * 根据部门id获取所有的职位
	 * @param deptId
	 * @return
	 */
	public List<Position> getPosByDept(Integer deptId){
		PositionExample example = new PositionExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptIdEqualTo(deptId);		
		List<Position> poslist = posMapper.selectByExample(example);
		if(poslist.size()>0){
			return poslist;
		}
		return null;
	}


	public int deleteByPosId(Integer delposId) {
		return posMapper.deleteByPrimaryKey(delposId);
	}


	public int updatePos(Position positon) {
		return posMapper.updateByPrimaryKeySelective(positon);
	}


	public int insertPosition(Position positon) {
		return posMapper.insertSelective(positon);
	}
	
	
	
	
}

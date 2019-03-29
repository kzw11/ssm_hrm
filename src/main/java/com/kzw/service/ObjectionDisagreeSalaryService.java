package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.ObjectionSalaryMapper;
import com.kzw.entity.ObjectionSalary;

@Service
public class ObjectionDisagreeSalaryService {

	@Autowired
	private ObjectionSalaryMapper osm;
	
	public List<ObjectionSalary> getAllObjectionSalary(){
		List<ObjectionSalary> objsalarylist = osm.selectByExampleWithEmp(null);
		if(objsalarylist!=null){
			return objsalarylist;
		}
		return null;		
	}

	public void insert(ObjectionSalary objs) {
		osm.insertSelective(objs);
	}

	public int deleteObjSalary(Integer rewardId) {
		return osm.deleteByPrimaryKey(rewardId);
	}
	
	
	public int updateObjSalary(ObjectionSalary objsalary){
		
		return osm.updateByPrimaryKeySelective(objsalary);
	}
	
	public ObjectionSalary getObjectionSalaryById(Integer id){
		ObjectionSalary salary = osm.selectByPrimaryKey(id);
		if(salary!=null){
			return salary;
		}
		return null;
	}
	
}

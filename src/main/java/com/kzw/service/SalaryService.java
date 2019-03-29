package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.SalaryMapper;
import com.kzw.entity.Salary;
import com.kzw.entity.SalaryExample;
import com.kzw.entity.SalaryExample.Criteria;

@Service
public class SalaryService {

	
	@Autowired
	private SalaryMapper sm;
	
	public List<Salary> getAllSalaryByEmpId(Integer EmpId){
			
		List<Salary> salarylist = sm.selectByExampleWithRP(EmpId);
		if(salarylist!=null){
			return salarylist;
		}
		return null;
		
	}
	
	public int insertSalary(Salary salary){
		int i = sm.insertSelective(salary);
		return i;
	}
}

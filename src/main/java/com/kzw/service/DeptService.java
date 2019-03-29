package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.DeptMapper;
import com.kzw.entity.Dept;
import com.kzw.entity.DeptExample;
import com.kzw.entity.Employee;
import com.kzw.entity.EmployeeExample;
import com.kzw.entity.DeptExample.Criteria;

@Service
public class DeptService {

	@Autowired
	private DeptMapper deptMapper;
	
	/**
	 * 添加部门信息
	 * @param dept
	 */
	public void insert(Dept dept){
		
		deptMapper.insertSelective(dept);
		
	}
	
	/**
	 * @return 所有的部门信息
	 */
	public List<Dept> getAllDept(){
		
		List<Dept> deptlist = deptMapper.selectByExampleWithEmp(null);
		
		if(deptlist.size()>0){
			return deptlist;
		}
		return null;
	}
	
	/**
	 * 通过员工号查找部门信息
	 * @param empid
	 * @return
	 */
	public Dept getDeptByEmpId(int empid){
		DeptExample de = new DeptExample();
		Criteria criteria = de.createCriteria();
		criteria.andEmpIdEqualTo(empid);
		List<Dept> deptlist = deptMapper.selectByExample(de);
		
		if(deptlist.size()>0){
			return deptlist.get(0);
		}
		return null;
	}

	public int deleteDeptById(Integer delDeptId) {
		return deptMapper.deleteByPrimaryKey(delDeptId);
	}

	public void updateDept(Dept dept) {
		deptMapper.updateByPrimaryKeySelective(dept);
	}
	
	/**
	 * @param empName
	 * @return
	 */
	public Dept getDeptByName(String deptName) {
		DeptExample example = new DeptExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptNameEqualTo(deptName);
		List<Dept> list = deptMapper.selectByExample(example);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
	
}

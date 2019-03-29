package com.kzw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kzw.dao.EmployeeMapper;
import com.kzw.entity.Employee;
import com.kzw.entity.EmployeeExample;
import com.kzw.entity.EmployeeExample.Criteria;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper empMapper;
	
	/**
	 * @return 所有的员工信息
	 */
	public List<Employee> getAllEmployee(){
		List<Employee> emplist = empMapper.selectByExampleWithDeptAndPosition(null);
		
		if(emplist.size()>0){
			return emplist;
		}
		return null;
	}
	
	/**
	 * @param deptId
	 * @return
	 */
	public Employee getEmpByDeptId(int deptId){
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptIdEqualTo(deptId);
		List<Employee> emplist = empMapper.selectByExample(example);
		if(emplist.size()>0){
			return emplist.get(0);
		}
		return null;
	}

	/**
	 * @param deptId
	 * @return
	 */
	public List<Employee> getEmpsByDeptId(int deptId){
		/*EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andDeptIdEqualTo(deptId);*/
		List<Employee> emplist = empMapper.selectBydeptIdWithDeptAndPosition(deptId);
		if(emplist.size()>0){
			return emplist;
		}
		return null;
	}
	
	/**
	 * 通过职位获得所有的员工
	 * @param posid
	 * @return
	 */
	public List<Employee> getEmpsByPosId(int posid){
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andPositionIdEqualTo(posid);
		List<Employee> emplist = empMapper.selectByExample(example);
		if(emplist.size()>0){
			return emplist;
		}
		return null;
	}


	public int save(Employee emp) {
		
		int i = empMapper.insertSelective(emp);
		
		return i;
	}

	public int deleteEmpById(Integer empId) {
		int i = empMapper.deleteByPrimaryKey(empId);
		
		return i;
	}

	public Employee getEmpById(Integer empId) {
		return empMapper.selectByPrimaryKeyWithDeptAndPosition(empId);
	}

	public int updateEmpById(Employee employee) {
		int i = empMapper.updateByPrimaryKeySelective(employee);
		return i;
	}

	/**
	 * 通过员工名，获取员工信息
	 * @param empName
	 * @return
	 */
	public Employee getEmpByName(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		List<Employee> list = empMapper.selectByExample(example);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
	
	
}

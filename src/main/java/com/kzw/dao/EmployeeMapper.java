package com.kzw.dao;

import com.kzw.entity.Employee;
import com.kzw.entity.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer empId);
    /**
     * 带上部门和职位信息
     * @param example
     * @return
     */
    List<Employee> selectByExampleWithDeptAndPosition(EmployeeExample example);
    /**
     * 根据部门编号获取员工信息和职位信息
     * @param deptId
     * @return
     */
    List<Employee> selectBydeptIdWithDeptAndPosition(Integer deptId);

    Employee selectByPrimaryKeyWithDeptAndPosition(Integer empId);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}
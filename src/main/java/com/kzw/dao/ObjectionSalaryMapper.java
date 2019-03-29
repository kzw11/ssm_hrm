package com.kzw.dao;

import com.kzw.entity.ObjectionSalary;
import com.kzw.entity.ObjectionSalaryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ObjectionSalaryMapper {
    long countByExample(ObjectionSalaryExample example);

    int deleteByExample(ObjectionSalaryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ObjectionSalary record);

    int insertSelective(ObjectionSalary record);

    List<ObjectionSalary> selectByExample(ObjectionSalaryExample example);
    
    List<ObjectionSalary> selectByExampleWithEmp(ObjectionSalaryExample example);

    ObjectionSalary selectByPrimaryKey(Integer id);
    
    ObjectionSalary selectByPrimaryKeyWithEmp(Integer id);

    int updateByExampleSelective(@Param("record") ObjectionSalary record, @Param("example") ObjectionSalaryExample example);

    int updateByExample(@Param("record") ObjectionSalary record, @Param("example") ObjectionSalaryExample example);

    int updateByPrimaryKeySelective(ObjectionSalary record);

    int updateByPrimaryKey(ObjectionSalary record);
}
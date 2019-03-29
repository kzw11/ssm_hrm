package com.kzw.dao;

import com.kzw.entity.Dept;
import com.kzw.entity.DeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptMapper {
    long countByExample(DeptExample example);

    int deleteByExample(DeptExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(Dept record);

    int insertSelective(Dept record);

    List<Dept> selectByExample(DeptExample example);
    
    /**
     * 带上员工信息
     * @param example
     * @return
     */
    List<Dept> selectByExampleWithEmp(DeptExample example);

    Dept selectByPrimaryKey(Integer deptId);
    /**
     * 带上员工信息
     * @param deptId
     * @return
     */
    Dept selectByPrimaryKeyWithEmp(Integer deptId);

    int updateByExampleSelective(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByExample(@Param("record") Dept record, @Param("example") DeptExample example);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}
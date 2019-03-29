package com.kzw.dao;

import com.kzw.entity.Recruit;
import com.kzw.entity.RecruitExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RecruitMapper {
    long countByExample(RecruitExample example);

    int deleteByExample(RecruitExample example);

    int deleteByPrimaryKey(Integer reid);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    List<Recruit> selectByExample(RecruitExample example);
    
    //带上部门信息和职位信息
    List<Recruit> selectByExampleWithDeptAndPos(RecruitExample example);

    Recruit selectByPrimaryKey(Integer reid);
    
    Recruit selectByPrimaryKeyWithDeptAndPos(Integer reid);

    int updateByExampleSelective(@Param("record") Recruit record, @Param("example") RecruitExample example);

    int updateByExample(@Param("record") Recruit record, @Param("example") RecruitExample example);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
}
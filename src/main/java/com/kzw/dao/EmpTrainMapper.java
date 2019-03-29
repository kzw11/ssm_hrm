package com.kzw.dao;

import com.kzw.entity.EmpTrain;
import com.kzw.entity.EmpTrainExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpTrainMapper {
    long countByExample(EmpTrainExample example);

    int deleteByExample(EmpTrainExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EmpTrain record);

    int insertSelective(EmpTrain record);

    List<EmpTrain> selectByExample(EmpTrainExample example);

    EmpTrain selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EmpTrain record, @Param("example") EmpTrainExample example);

    int updateByExample(@Param("record") EmpTrain record, @Param("example") EmpTrainExample example);

    int updateByPrimaryKeySelective(EmpTrain record);

    int updateByPrimaryKey(EmpTrain record);
}
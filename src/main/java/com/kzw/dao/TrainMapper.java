package com.kzw.dao;

import com.kzw.entity.Train;
import com.kzw.entity.TrainExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TrainMapper {
    long countByExample(TrainExample example);

    int deleteByExample(TrainExample example);

    int deleteByPrimaryKey(Integer trainId);

    int insert(Train record);

    int insertSelective(Train record);

    List<Train> selectByExample(TrainExample example);

    Train selectByPrimaryKey(Integer trainId);
    /**
     * 带上部门信息和职位信息
     * @param example
     * @return
     */
    List<Train> selectByExampleWithDeptAndPos(TrainExample example);

    /**
     * 带上部门信息和职位信息
     * @param example
     * @return
     */
    Train selectByPrimaryKeyWithDeptAndPos(Integer trainId);

    int updateByExampleSelective(@Param("record") Train record, @Param("example") TrainExample example);

    int updateByExample(@Param("record") Train record, @Param("example") TrainExample example);

    int updateByPrimaryKeySelective(Train record);

    int updateByPrimaryKey(Train record);
}
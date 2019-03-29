package com.kzw.dao;

import com.kzw.entity.Position;
import com.kzw.entity.PositionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PositionMapper {
    long countByExample(PositionExample example);

    int deleteByExample(PositionExample example);

    int deleteByPrimaryKey(Integer positionId);

    int insert(Position record);

    int insertSelective(Position record);

    List<Position> selectByExample(PositionExample example);

    Position selectByPrimaryKey(Integer positionId);

    /**
     * 查询所有的职位和部门信息
     * @param example
     * @return
     */
    List<Position> selectByExampleWithDept(PositionExample example);

    Position selectByPrimaryKeyWithDept(Integer positionId);
    
    int updateByExampleSelective(@Param("record") Position record, @Param("example") PositionExample example);

    int updateByExample(@Param("record") Position record, @Param("example") PositionExample example);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);
}
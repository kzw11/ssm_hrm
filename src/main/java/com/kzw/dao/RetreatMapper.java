package com.kzw.dao;

import com.kzw.entity.Retreat;
import com.kzw.entity.RetreatExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RetreatMapper {
    long countByExample(RetreatExample example);

    int deleteByExample(RetreatExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Retreat record);

    int insertSelective(Retreat record);

    List<Retreat> selectByExample(RetreatExample example);

    Retreat selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Retreat record, @Param("example") RetreatExample example);

    int updateByExample(@Param("record") Retreat record, @Param("example") RetreatExample example);

    int updateByPrimaryKeySelective(Retreat record);

    int updateByPrimaryKey(Retreat record);
}
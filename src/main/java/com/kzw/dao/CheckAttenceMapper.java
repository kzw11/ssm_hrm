package com.kzw.dao;

import com.kzw.entity.CheckAttence;
import com.kzw.entity.CheckAttenceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CheckAttenceMapper {
    long countByExample(CheckAttenceExample example);

    int deleteByExample(CheckAttenceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CheckAttence record);

    int insertSelective(CheckAttence record);

    List<CheckAttence> selectByExample(CheckAttenceExample example);

    CheckAttence selectByPrimaryKey(Integer id);
    
    /**
     * 带上员工信息
     * @param example
     * @return
     */
    List<CheckAttence> selectByExampleWithEmp(CheckAttenceExample example);

    /**
     * 带上员工信息
     * @param example
     * @return
     */
    CheckAttence selectByPrimaryKeyWithEmp(Integer id);

    int updateByExampleSelective(@Param("record") CheckAttence record, @Param("example") CheckAttenceExample example);

    int updateByExample(@Param("record") CheckAttence record, @Param("example") CheckAttenceExample example);

    int updateByPrimaryKeySelective(CheckAttence record);

    int updateByPrimaryKey(CheckAttence record);
}
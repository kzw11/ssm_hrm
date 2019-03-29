package com.kzw.dao;

import com.kzw.entity.Interview;
import com.kzw.entity.InterviewExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InterviewMapper {
    int countByExample(InterviewExample example);

    int deleteByExample(InterviewExample example);

    int deleteByPrimaryKey(Integer interviewId);

    int insert(Interview record);

    int insertSelective(Interview record);

    List<Interview> selectByExample(InterviewExample example);
    
    /**
     * 带上用户信息
     * @param example
     * @return
     */
    List<Interview> selectByExampleWithUser(InterviewExample example);

    Interview selectByPrimaryKey(Integer interviewId);

    int updateByExampleSelective(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByExample(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByPrimaryKeySelective(Interview record);

    int updateByPrimaryKey(Interview record);
}
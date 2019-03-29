package com.kzw.dao;

import com.kzw.entity.RewardPunish;
import com.kzw.entity.RewardPunishExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RewardPunishMapper {
    long countByExample(RewardPunishExample example);

    int deleteByExample(RewardPunishExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RewardPunish record);

    int insertSelective(RewardPunish record);

    List<RewardPunish> selectByExample(RewardPunishExample example);

    RewardPunish selectByPrimaryKey(Integer id);

    /**
     * 带上员工信息
     * @param example
     * @return
     */
    List<RewardPunish> selectByExampleWithEmp(RewardPunishExample example);

    /**
     * 带上员工信息
     * @param example
     * @return
     */
    RewardPunish selectByPrimaryKeyWithEmp(Integer id);

    
    int updateByExampleSelective(@Param("record") RewardPunish record, @Param("example") RewardPunishExample example);

    int updateByExample(@Param("record") RewardPunish record, @Param("example") RewardPunishExample example);

    int updateByPrimaryKeySelective(RewardPunish record);

    int updateByPrimaryKey(RewardPunish record);
}
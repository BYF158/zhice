package com.etsong.personality.mapper;

import com.etsong.personality.domain.PersonalityRecord;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.Date;

/**
 * 题目管理Mapper接口
 *
 * @author ruoyi
 * @date 2025-07-01
 */
public interface PersonalityRecordMapper
{

    Integer saveRecord(PersonalityRecord record);

    /**
     * 根据用户ID查询最新测试时间
     * @param userId 用户ID
     * @return 最新测试时间
     */
    Date selectLatestTestTimeByUserId(@Param("userId") Long userId);
}

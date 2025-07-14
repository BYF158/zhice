package com.etsong.personality.mapper;

import com.etsong.personality.domain.PersonalityResults;

/**
 * 题目管理Mapper接口
 *
 * @author ruoyi
 * @date 2025-07-01
 */
public interface PersonalityResultMapper
{


    int save(PersonalityResults results);

    //获取用户最近一次测试结果
    PersonalityResults getLatestResult(Long userId);
}

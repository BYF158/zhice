package com.etsong.personality.mapper;

import com.etsong.personality.domain.PersonalityAnswer;

import java.util.List;

/**
 * 题目管理Mapper接口
 *
 * @author ruoyi
 * @date 2025-07-01
 */
public interface PersonalityAnswerMapper
{


    void saveAll(List<PersonalityAnswer> answers);
}

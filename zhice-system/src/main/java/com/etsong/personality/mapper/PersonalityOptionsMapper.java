package com.etsong.personality.mapper;

import com.etsong.personality.domain.PersonalityOptionsVO;

import java.util.List;

/**
 * 题目管理Mapper接口
 *
 * @author ruoyi
 * @date 2025-07-01
 */
public interface PersonalityOptionsMapper
{
    List<PersonalityOptionsVO> getPersonalityOptionsByQuestion();

    List<PersonalityOptionsVO> selectOptionDefinitionList();
}

package com.etsong.personality.service;

import com.etsong.personality.domain.PersonalityOptionsVO;


import java.util.List;

/**
 * 题目管理Service接口
 *
 * @author ruoyi
 * @date 2025-07-01
 */
public interface IPersonalityOptionsService
{

    List<PersonalityOptionsVO> selectPersonalityOptionsList();

    List<PersonalityOptionsVO> selectOptionDefinitionList();
}

package com.etsong.personality.service.impl;

import com.etsong.personality.domain.PersonalityOptionsVO;
import com.etsong.personality.mapper.PersonalityOptionsMapper;
import com.etsong.personality.service.IPersonalityOptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonalityOptionsServiceImpl  implements IPersonalityOptionsService {

    @Autowired
    private PersonalityOptionsMapper personalityOptionsMapper;
    @Override
    public List<PersonalityOptionsVO> selectPersonalityOptionsList() {
        return personalityOptionsMapper.getPersonalityOptionsByQuestion();
    }

    @Override
    public List<PersonalityOptionsVO> selectOptionDefinitionList() {
        return personalityOptionsMapper.selectOptionDefinitionList();
    }
}

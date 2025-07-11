package com.etsong.personality.service.impl;

import com.etsong.personality.domain.PersonalityAnswer;
import com.etsong.personality.mapper.PersonalityAnswerMapper;
import com.etsong.personality.service.IPersonalityAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonalityAnswerServiceImpl implements IPersonalityAnswerService {


    @Autowired
    private PersonalityAnswerMapper personalityAnswerMapper;
    @Override
    public void saveAll(List<PersonalityAnswer> answers) {
         personalityAnswerMapper.saveAll(answers);
    }
}

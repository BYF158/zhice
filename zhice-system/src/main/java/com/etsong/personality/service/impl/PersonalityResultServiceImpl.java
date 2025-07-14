package com.etsong.personality.service.impl;

import com.etsong.personality.domain.PersonalityResults;
import com.etsong.personality.mapper.PersonalityResultMapper;
import com.etsong.personality.service.IPersonalityResultService;
import com.etsong.system.domain.PersonalityResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PersonalityResultServiceImpl implements IPersonalityResultService {

    @Autowired
    private PersonalityResultMapper personalityResultMapper;

    @Transactional
    @Override
    public Integer save(PersonalityResults results) {
        return personalityResultMapper.save(results);
    }

    @Override
    public PersonalityResults getLatestResult(Long userId) {
        PersonalityResults personalityResult = personalityResultMapper.getLatestResult(userId);

        System.out.println(userId);
        System.out.println(personalityResult);
        return personalityResult;
    }
}

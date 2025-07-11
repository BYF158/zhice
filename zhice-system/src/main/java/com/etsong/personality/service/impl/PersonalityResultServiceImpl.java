package com.etsong.personality.service.impl;

import com.etsong.personality.domain.PersonalityResults;
import com.etsong.personality.mapper.PersonalityResultMapper;
import com.etsong.personality.service.IPersonalityResultService;
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
}

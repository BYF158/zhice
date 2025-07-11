package com.etsong.personality.service;

import com.etsong.personality.domain.PersonalityAnswer;

import java.util.List;

public interface IPersonalityAnswerService {
    void saveAll(List<PersonalityAnswer> answers);
}

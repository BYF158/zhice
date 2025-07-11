package com.etsong.personality.service.impl;

import com.etsong.personality.domain.PersonalityRecord;
import com.etsong.personality.mapper.PersonalityRecordMapper;
import com.etsong.personality.service.IPersonalityRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class PersonalityRecordServiceImpl implements IPersonalityRecordService {

    @Autowired
    private   PersonalityRecordMapper personalityRecordMapper;


    @Override
    public Date getLatestTestTimeByUserId(Long userId) {
        return personalityRecordMapper.selectLatestTestTimeByUserId(userId);
    }

    @Transactional
    @Override
    public Long saveRecord(Long userId) {
        PersonalityRecord record = new PersonalityRecord();
        record.setUserId(userId);
        record.setTestTime(new Date());
        Integer count = personalityRecordMapper.saveRecord(record);
        return record.getRecordId();
    }
}

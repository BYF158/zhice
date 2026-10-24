package com.etsong.mbti.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.mbti.domain.MbtiType;
import com.etsong.mbti.mapper.MbtiTypeMapper;
import com.etsong.mbti.service.IMbtiTypeService;

/**
 * MBTI 十六型人格 Service 实现
 *
 * @author openclaw
 */
@Service
public class MbtiTypeServiceImpl implements IMbtiTypeService
{
    @Autowired
    private MbtiTypeMapper mbtiTypeMapper;

    @Override
    public List<MbtiType> selectTypeList(MbtiType query)
    {
        return mbtiTypeMapper.selectMbtiTypeList(query);
    }

    @Override
    public MbtiType selectTypeByCode(String typeCode)
    {
        return mbtiTypeMapper.selectMbtiTypeByCode(typeCode);
    }
}

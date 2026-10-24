package com.etsong.mbti.mapper;

import java.util.List;
import com.etsong.mbti.domain.MbtiType;

/**
 * MBTI 十六型人格 Mapper
 *
 * @author openclaw
 */
public interface MbtiTypeMapper
{
    List<MbtiType> selectMbtiTypeList(MbtiType query);

    MbtiType selectMbtiTypeByCode(String typeCode);
}

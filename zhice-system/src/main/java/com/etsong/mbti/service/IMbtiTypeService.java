package com.etsong.mbti.service;

import java.util.List;
import com.etsong.mbti.domain.MbtiType;

/**
 * MBTI 十六型人格 Service
 *
 * @author openclaw
 */
public interface IMbtiTypeService
{
    List<MbtiType> selectTypeList(MbtiType query);

    MbtiType selectTypeByCode(String typeCode);
}

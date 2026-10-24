package com.etsong.mbti.mapper;

import java.util.List;
import com.etsong.mbti.domain.MbtiAnswer;

/**
 * MBTI 答题明细 Mapper
 *
 * @author openclaw
 */
public interface MbtiAnswerMapper
{
    int batchInsertMbtiAnswer(List<MbtiAnswer> answers);

    List<MbtiAnswer> selectMbtiAnswerByRecordId(Long recordId);
}

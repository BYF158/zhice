package com.etsong.mbti.mapper;

import java.util.List;
import com.etsong.mbti.domain.MbtiQuestion;

/**
 * MBTI 题目 Mapper
 *
 * @author openclaw
 */
public interface MbtiQuestionMapper
{
    List<MbtiQuestion> selectMbtiQuestionList(MbtiQuestion query);

    MbtiQuestion selectMbtiQuestionById(Long questionId);

    int updateMbtiQuestion(MbtiQuestion question);

    int deleteMbtiQuestionById(Long questionId);
}

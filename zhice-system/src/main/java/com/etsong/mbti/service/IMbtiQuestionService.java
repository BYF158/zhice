package com.etsong.mbti.service;

import java.util.List;
import com.etsong.mbti.domain.MbtiQuestion;

/**
 * MBTI 题目管理 Service
 *
 * @author openclaw
 */
public interface IMbtiQuestionService
{
    List<MbtiQuestion> selectQuestionList(MbtiQuestion query);

    MbtiQuestion selectQuestionById(Long questionId);

    int updateQuestion(MbtiQuestion question);
}

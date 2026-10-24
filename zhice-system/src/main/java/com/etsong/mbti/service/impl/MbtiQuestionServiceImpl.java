package com.etsong.mbti.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.mbti.domain.MbtiQuestion;
import com.etsong.mbti.mapper.MbtiQuestionMapper;
import com.etsong.mbti.service.IMbtiQuestionService;

/**
 * MBTI 题目管理 Service 实现
 *
 * @author openclaw
 */
@Service
public class MbtiQuestionServiceImpl implements IMbtiQuestionService
{
    @Autowired
    private MbtiQuestionMapper mbtiQuestionMapper;

    @Override
    public List<MbtiQuestion> selectQuestionList(MbtiQuestion query)
    {
        return mbtiQuestionMapper.selectMbtiQuestionList(query);
    }

    @Override
    public MbtiQuestion selectQuestionById(Long questionId)
    {
        return mbtiQuestionMapper.selectMbtiQuestionById(questionId);
    }

    @Override
    public int updateQuestion(MbtiQuestion question)
    {
        return mbtiQuestionMapper.updateMbtiQuestion(question);
    }
}

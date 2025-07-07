package com.etsong.questions.service;

import com.etsong.questions.domain.AnswerDTO;
import com.etsong.questions.domain.PersonalityScoreResponse;
import com.etsong.questions.domain.Topic;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * 题目相关服务接口
 */
public interface QuestionService {
    // 获取题目
    PageInfo<Topic> getQuestionByPage(Integer pageNum, Integer pageSize);


    /**
     * 处理前端提交的题目数据并存储到数据库
     * @param answers 前端提交的题目答案
     * @param userId 用户ID
     * @return 是否成功
     */
    public Integer processAndStoreAnswers(List<AnswerDTO.AnswerItem> answers, Long userId);

    /**
     * 获取人格评分数据
     * @param recordId 测试记录ID
     * @return PersonalityScoreResponse
     */
    PersonalityScoreResponse getPersonalityScores(Integer recordId);

}
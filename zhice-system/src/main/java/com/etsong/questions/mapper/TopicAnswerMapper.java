package com.etsong.questions.mapper;

import com.etsong.questions.domain.TopicAnswer;

/**
 * 题目作答Mapper接口
 */
public interface TopicAnswerMapper {
    /**
     * 插入题目作答记录
     * @param topicAnswer 题目作答对象
     * @return 影响的行数
     */
    int insertTopicAnswer(TopicAnswer topicAnswer);
}
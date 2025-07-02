package com.etsong.questions.service;

import com.github.pagehelper.PageInfo;
import com.etsong.questions.domain.Topic;

public interface QuestionService {
    PageInfo<Topic> getQuestionByPage(Integer pageNum, Integer pageSize);
}
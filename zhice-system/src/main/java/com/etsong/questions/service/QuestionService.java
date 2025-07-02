package com.etsong.questions.service;


import com.etsong.questions.domain.Topic;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Service;

import java.util.List;


public interface QuestionService {

    Page<Topic> getQuestionByPage(Integer pageNum, Integer pageSize);

}

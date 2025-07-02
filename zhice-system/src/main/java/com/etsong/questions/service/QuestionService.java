package com.etsong.questions.service;


import com.etsong.common.core.domain.R;
import com.etsong.questions.domain.Topic;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Service;

import java.util.List;


public interface QuestionService {

    R<Page<Topic>> getQuestionByPage(Integer pageNum, Integer pageSize);

}

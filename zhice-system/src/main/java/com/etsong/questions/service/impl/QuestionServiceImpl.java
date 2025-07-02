package com.etsong.questions.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.questions.mapper.QuestionMapper;
import com.etsong.questions.domain.Topic;
import com.etsong.questions.service.QuestionService;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public PageInfo<Topic> getQuestionByPage(Integer pageNum, Integer pageSize) {
        // 使用PageHelper插件进行分页查询
        PageHelper.startPage(pageNum, pageSize);

        // 执行查询，PageHelper会自动拦截并处理分页
        List<Topic> topics = questionMapper.selectAll();

        // 封装分页信息到PageInfo对象
        return new PageInfo<>(topics);
    }
}
package com.etsong.questions.controller;


import com.etsong.common.core.domain.R;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.questions.service.QuestionService;
import com.etsong.questions.domain.Topic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/questions/topic")
public class QuestionController {

    private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
    @Autowired
    private QuestionService questionService;

    /**
     * 分页获取问题列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页大小，默认为6
     * @return 分页结果
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:questions')")
    @GetMapping("/getQuestionByPage")
    public ResponseEntity<R<Page<Topic>>> getQuestionByPage(
            @RequestParam Integer pageNum,
            @RequestParam(defaultValue = "6") Integer pageSize) {
        R<Page<Topic>> questionPage = questionService.getQuestionByPage(pageNum, pageSize);
        return ResponseEntity.ok(questionPage);
    }
}

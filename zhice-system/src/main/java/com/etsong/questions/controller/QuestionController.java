package com.etsong.questions.controller;


import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.questions.service.QuestionService;
import com.etsong.questions.domain.Topic;

@RestController
@RequestMapping("/questions/topic")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    /**
     * 分页获取问题列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页大小，默认为6
     * @return 分页结果
     */
    @GetMapping("/getQuestionByPage")
    public ResponseEntity<Page<Topic>> getQuestionByPage(
            @RequestParam Integer pageNum,
            @RequestParam(defaultValue = "6") Integer pageSize) {
        Page<Topic> questionPage = questionService.getQuestionByPage(pageNum, pageSize);
        return ResponseEntity.ok(questionPage);
    }
}

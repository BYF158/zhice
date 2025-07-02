// QuestionController.java
package com.etsong.questions.controller;

import com.etsong.common.core.domain.R;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:questions')")
    @GetMapping("/getQuestionByPage")
    public ResponseEntity<R<PageInfo<Topic>>> getQuestionByPage(
            @RequestParam Integer pageNum,
            @RequestParam(defaultValue = "6") Integer pageSize) {
        PageInfo<Topic> pageInfo = questionService.getQuestionByPage(pageNum, pageSize);
        
        // 将PageInfo转换为前端期望的格式
        R<PageInfo<Topic>> response = R.ok(pageInfo);
        response.getData().setTotal(pageInfo.getTotal());
        response.getData().setPageNum(pageInfo.getPageNum());
        response.getData().setPageSize(pageInfo.getPageSize());
        response.getData().setList(pageInfo.getList());
        
        return ResponseEntity.ok(response);
    }
}
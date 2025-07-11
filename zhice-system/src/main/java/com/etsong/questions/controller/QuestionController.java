// QuestionController.java
package com.etsong.questions.controller;

import com.etsong.common.core.domain.R;
import com.etsong.questions.domain.AnswerDTO;
import com.etsong.personality.domain.PersonalityScoreResponse;
import com.etsong.questions.domain.Topic;
import com.etsong.questions.service.QuestionService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题目相关控制器
 */
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

    /**
     * 处理前端提交的题目数据
     * @param answerDTO 包含所有题目的答案对象
     * @param userId 用户ID
     * @return 操作结果
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:questions')")
    @PostMapping("/submit-answers")
    public R<?> submitAnswers(@RequestBody AnswerDTO answerDTO,
                                @RequestParam Long userId) {
        Integer recordId = questionService.processAndStoreAnswers(answerDTO.getAnswers(), userId);
        if (recordId != null) {
            return R.ok(recordId,"提交成功");
        } else {
            return R.fail("提交失败");
        }
    }

    @GetMapping("/scores")
    public R<PersonalityScoreResponse> getPersonalityScores(
            @RequestParam("recordId") Integer recordId
    ) {
        PersonalityScoreResponse response = questionService.getPersonalityScores(recordId);
        return R.ok(response, "Success");
    }

}
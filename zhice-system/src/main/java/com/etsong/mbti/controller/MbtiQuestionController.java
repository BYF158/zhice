package com.etsong.mbti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.common.annotation.Log;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.common.core.page.TableDataInfo;
import com.etsong.common.enums.BusinessType;
import com.etsong.mbti.domain.MbtiQuestion;
import com.etsong.mbti.service.IMbtiQuestionService;

/**
 * MBTI 题目管理 Controller
 *
 * @author openclaw
 * @date 2026-10-21
 */
@RestController
@RequestMapping("/mbti/question")
public class MbtiQuestionController extends BaseController
{
    @Autowired
    private IMbtiQuestionService mbtiQuestionService;

    @PreAuthorize("@ss.hasPermi('mbti:test:view')")
    @GetMapping("/list")
    public TableDataInfo list(MbtiQuestion query)
    {
        startPage();
        List<MbtiQuestion> list = mbtiQuestionService.selectQuestionList(query);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('mbti:test:query')")
    @GetMapping("/{questionId}")
    public AjaxResult getInfo(@PathVariable Long questionId)
    {
        return success(mbtiQuestionService.selectQuestionById(questionId));
    }

    @PreAuthorize("@ss.hasPermi('mbti:test:query')")
    @Log(title = "MBTI题目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MbtiQuestion question)
    {
        return toAjax(mbtiQuestionService.updateQuestion(question));
    }
}

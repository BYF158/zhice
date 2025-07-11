// QuestionController.java
package com.etsong.personality.controller;

import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.R;
import com.etsong.personality.domain.PersonalityResults;
import com.etsong.personality.service.IPersonalityRecordService;
import com.etsong.personality.service.IPersonalityResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 题目相关控制器
 */
@RestController
@RequestMapping("/personality/results")
public class PersonalityResultController extends BaseController {

    @Autowired
    private IPersonalityResultService personalityResultService;

    @Autowired
    private IPersonalityRecordService personalityRecordService;



    @PostMapping("/add")
    public  R<?> submitPersonalityTest(@RequestBody PersonalityResults personalityResults) {

        //查询最新时间
        Date latestTestTimeByUserId = personalityRecordService.getLatestTestTimeByUserId(personalityResults.getUserId());

        PersonalityResults result = new PersonalityResults();
        result.setUserId(personalityResults.getUserId());
        result.setTestDate(latestTestTimeByUserId);
        result.setTypeCScore(personalityResults.getTypeCScore());
        result.setTypePScore(personalityResults.getTypePScore());
        result.setTypeMScore(personalityResults.getTypeMScore());
        result.setTypeSScore(personalityResults.getTypeSScore());

        //存储4得分
        personalityResultService.save(result);


        return R.ok(result.getResultId(),"保存成功");

    }



}

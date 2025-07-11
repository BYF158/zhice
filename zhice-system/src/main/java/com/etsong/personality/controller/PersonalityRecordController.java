// QuestionController.java
package com.etsong.personality.controller;

import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.R;
import com.etsong.personality.domain.PersonalityAnswer;
import com.etsong.personality.domain.PersonalityTestRequest;
import com.etsong.personality.service.IPersonalityAnswerService;
import com.etsong.personality.service.IPersonalityRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 题目相关控制器
 */
@RestController
@RequestMapping("/personality/records")
public class PersonalityRecordController extends BaseController {

    @Autowired
    private IPersonalityRecordService personalityRecordService;

    @Autowired
    private IPersonalityAnswerService personalityAnswerService;


    @PostMapping("/add")
    public  R<?> submitPersonalityTest(@RequestBody PersonalityTestRequest personalityTestRequest) {

        Long userId = personalityTestRequest.getUserId();
        List<Integer> selectedOptionIds = personalityTestRequest.getSelectedOptionIds();
//        ArrayList<Integer> selectedOptionIds = new ArrayList<>(Arrays.asList(1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157));

        //插入record
        Long recordId = personalityRecordService.saveRecord(userId);

        //插入答案
        List<PersonalityAnswer> answers = new ArrayList<>();

        for (int i = 0; i < selectedOptionIds.size(); i++) {
            PersonalityAnswer answer = new PersonalityAnswer();
            answer.setRecordId(recordId);
            answer.setOptionId(Long.valueOf(selectedOptionIds.get(i)));
            answers.add(answer);
        }

        // 批量插入
        personalityAnswerService.saveAll(answers);
        //插入四个分数


        return R.ok(recordId,"提交成功");

    }



}

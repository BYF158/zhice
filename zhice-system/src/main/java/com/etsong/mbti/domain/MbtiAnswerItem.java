package com.etsong.mbti.domain;

import java.io.Serializable;

/**
 * 单题作答项
 *
 * @author openclaw
 */
public class MbtiAnswerItem implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 题目ID */
    private Long questionId;

    /** 选择 A/B */
    private String choice;

    public Long getQuestionId()
    {
        return questionId;
    }

    public void setQuestionId(Long questionId)
    {
        this.questionId = questionId;
    }

    public String getChoice()
    {
        return choice;
    }

    public void setChoice(String choice)
    {
        this.choice = choice;
    }
}

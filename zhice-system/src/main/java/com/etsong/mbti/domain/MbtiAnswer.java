package com.etsong.mbti.domain;

import java.io.Serializable;

/**
 * MBTI 答题明细对象 mbti_answers
 *
 * @author openclaw
 * @date 2026-10-21
 */
public class MbtiAnswer implements Serializable
{
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long recordId;

    private Long questionId;

    /** 选择 A/B */
    private String choice;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getRecordId()
    {
        return recordId;
    }

    public void setRecordId(Long recordId)
    {
        this.recordId = recordId;
    }

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

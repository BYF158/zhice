package com.etsong.mbti.domain;

import com.etsong.common.core.domain.BaseEntity;

/**
 * MBTI 题目对象 mbti_questions
 *
 * @author openclaw
 * @date 2026-10-21
 */
public class MbtiQuestion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目ID */
    private Long questionId;

    /** 题号 */
    private Integer questionNo;

    /** 维度 EI/SN/TF/JP */
    private String dimension;

    /** 题干引导语 */
    private String content;

    /** 选项A文字 */
    private String optionA;

    /** 选项A对应极 */
    private String optionAPole;

    /** 选项B文字 */
    private String optionB;

    /** 选项B对应极 */
    private String optionBPole;

    /** 状态（0正常 1停用） */
    private String status;

    public Long getQuestionId()
    {
        return questionId;
    }

    public void setQuestionId(Long questionId)
    {
        this.questionId = questionId;
    }

    public Integer getQuestionNo()
    {
        return questionNo;
    }

    public void setQuestionNo(Integer questionNo)
    {
        this.questionNo = questionNo;
    }

    public String getDimension()
    {
        return dimension;
    }

    public void setDimension(String dimension)
    {
        this.dimension = dimension;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getOptionA()
    {
        return optionA;
    }

    public void setOptionA(String optionA)
    {
        this.optionA = optionA;
    }

    public String getOptionAPole()
    {
        return optionAPole;
    }

    public void setOptionAPole(String optionAPole)
    {
        this.optionAPole = optionAPole;
    }

    public String getOptionB()
    {
        return optionB;
    }

    public void setOptionB(String optionB)
    {
        this.optionB = optionB;
    }

    public String getOptionBPole()
    {
        return optionBPole;
    }

    public void setOptionBPole(String optionBPole)
    {
        this.optionBPole = optionBPole;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}

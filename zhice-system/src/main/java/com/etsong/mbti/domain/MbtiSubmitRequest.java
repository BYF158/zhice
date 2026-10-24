package com.etsong.mbti.domain;

import java.io.Serializable;
import java.util.List;

/**
 * MBTI 提交答卷请求
 *
 * @author openclaw
 */
public class MbtiSubmitRequest implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 测试人昵称（匿名测试时使用） */
    private String userName;

    /** 用时（秒） */
    private Integer duration;

    /** 作答列表 */
    private List<MbtiAnswerItem> answers;

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public Integer getDuration()
    {
        return duration;
    }

    public void setDuration(Integer duration)
    {
        this.duration = duration;
    }

    public List<MbtiAnswerItem> getAnswers()
    {
        return answers;
    }

    public void setAnswers(List<MbtiAnswerItem> answers)
    {
        this.answers = answers;
    }
}

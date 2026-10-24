package com.etsong.mbti.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * MBTI 测试结果
 *
 * @author openclaw
 */
public class MbtiResultVO implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 结果类型 如 INTJ */
    private String resultType;

    /** 测试人 */
    private String userName;

    /** 用时（秒） */
    private Integer duration;

    /** 测试时间 */
    private Date testTime;

    /** 四个维度明细 */
    private List<MbtiDimensionVO> dimensions;

    /** 类型详情 */
    private MbtiType type;

    public Long getRecordId()
    {
        return recordId;
    }

    public void setRecordId(Long recordId)
    {
        this.recordId = recordId;
    }

    public String getResultType()
    {
        return resultType;
    }

    public void setResultType(String resultType)
    {
        this.resultType = resultType;
    }

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

    public Date getTestTime()
    {
        return testTime;
    }

    public void setTestTime(Date testTime)
    {
        this.testTime = testTime;
    }

    public List<MbtiDimensionVO> getDimensions()
    {
        return dimensions;
    }

    public void setDimensions(List<MbtiDimensionVO> dimensions)
    {
        this.dimensions = dimensions;
    }

    public MbtiType getType()
    {
        return type;
    }

    public void setType(MbtiType type)
    {
        this.type = type;
    }
}

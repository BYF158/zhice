package com.etsong.mbti.domain;

import java.util.Date;
import com.etsong.common.annotation.Excel;
import com.etsong.common.core.domain.BaseEntity;

/**
 * MBTI 测试记录对象 mbti_records
 *
 * @author openclaw
 * @date 2026-10-21
 */
public class MbtiRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 用户ID */
    private Long userId;

    /** 测试人 */
    @Excel(name = "测试人")
    private String userName;

    /** 结果类型 */
    @Excel(name = "结果类型")
    private String resultType;

    @Excel(name = "E得分")
    private Integer scoreE;

    @Excel(name = "I得分")
    private Integer scoreI;

    @Excel(name = "S得分")
    private Integer scoreS;

    @Excel(name = "N得分")
    private Integer scoreN;

    @Excel(name = "T得分")
    private Integer scoreT;

    @Excel(name = "F得分")
    private Integer scoreF;

    @Excel(name = "J得分")
    private Integer scoreJ;

    @Excel(name = "P得分")
    private Integer scoreP;

    /** 用时（秒） */
    private Integer duration;

    /** 测试时间 */
    @Excel(name = "测试时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date testTime;

    public Long getRecordId()
    {
        return recordId;
    }

    public void setRecordId(Long recordId)
    {
        this.recordId = recordId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getResultType()
    {
        return resultType;
    }

    public void setResultType(String resultType)
    {
        this.resultType = resultType;
    }

    public Integer getScoreE()
    {
        return scoreE;
    }

    public void setScoreE(Integer scoreE)
    {
        this.scoreE = scoreE;
    }

    public Integer getScoreI()
    {
        return scoreI;
    }

    public void setScoreI(Integer scoreI)
    {
        this.scoreI = scoreI;
    }

    public Integer getScoreS()
    {
        return scoreS;
    }

    public void setScoreS(Integer scoreS)
    {
        this.scoreS = scoreS;
    }

    public Integer getScoreN()
    {
        return scoreN;
    }

    public void setScoreN(Integer scoreN)
    {
        this.scoreN = scoreN;
    }

    public Integer getScoreT()
    {
        return scoreT;
    }

    public void setScoreT(Integer scoreT)
    {
        this.scoreT = scoreT;
    }

    public Integer getScoreF()
    {
        return scoreF;
    }

    public void setScoreF(Integer scoreF)
    {
        this.scoreF = scoreF;
    }

    public Integer getScoreJ()
    {
        return scoreJ;
    }

    public void setScoreJ(Integer scoreJ)
    {
        this.scoreJ = scoreJ;
    }

    public Integer getScoreP()
    {
        return scoreP;
    }

    public void setScoreP(Integer scoreP)
    {
        this.scoreP = scoreP;
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
}

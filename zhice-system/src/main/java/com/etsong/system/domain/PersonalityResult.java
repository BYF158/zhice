package com.etsong.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.etsong.common.annotation.Excel;
import com.etsong.common.core.domain.BaseEntity;

/**
 * 得分管理对象 personality_results
 * 
 * @author ruoyi
 * @date 2025-07-10
 */
public class PersonalityResult extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 结果ID */
    private Long resultId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 测试时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "测试时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date testDate;

    /** S(活泼型)分数 */
    @Excel(name = "S(活泼型)分数")
    private Long typeSScore;

    /** M（完美型）分数 */
    @Excel(name = "M(完美型)分数", readConverterExp = "完=美型")
    private Long typeMScore;

    /** C(力量型)分数 */
    @Excel(name = "C(力量型)分数")
    private Long typeCScore;

    /** P(和平型)分数 */
    @Excel(name = "P(和平型)分数")
    private Long typePScore;

    public void setResultId(Long resultId) 
    {
        this.resultId = resultId;
    }

    public Long getResultId() 
    {
        return resultId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setTestDate(Date testDate) 
    {
        this.testDate = testDate;
    }

    public Date getTestDate() 
    {
        return testDate;
    }

    public void setTypeSScore(Long typeSScore) 
    {
        this.typeSScore = typeSScore;
    }

    public Long getTypeSScore() 
    {
        return typeSScore;
    }

    public void setTypeMScore(Long typeMScore) 
    {
        this.typeMScore = typeMScore;
    }

    public Long getTypeMScore() 
    {
        return typeMScore;
    }

    public void setTypeCScore(Long typeCScore) 
    {
        this.typeCScore = typeCScore;
    }

    public Long getTypeCScore() 
    {
        return typeCScore;
    }

    public void setTypePScore(Long typePScore) 
    {
        this.typePScore = typePScore;
    }

    public Long getTypePScore() 
    {
        return typePScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("resultId", getResultId())
            .append("userId", getUserId())
            .append("testDate", getTestDate())
            .append("typeSScore", getTypeSScore())
            .append("typeMScore", getTypeMScore())
            .append("typeCScore", getTypeCScore())
            .append("typePScore", getTypePScore())
            .toString();
    }
}

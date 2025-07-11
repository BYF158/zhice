package com.etsong.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@EqualsAndHashCode(callSuper = true)
@Data
public class PersonalityResult extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 结果ID */
    private Long resultId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String userName;

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

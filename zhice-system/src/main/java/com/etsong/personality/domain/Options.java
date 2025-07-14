package com.etsong.personality.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.etsong.common.annotation.Excel;
import com.etsong.common.core.domain.BaseEntity;

/**
 * 选项管理对象 personality_options
 * 
 * @author BYF
 * @date 2025-07-11
 */
public class Options extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 选项id */
    private Long optionId;

    /** 选项文本 */
    @Excel(name = "选项文本")
    private String optionText;

    /** 选项类型 */
    @Excel(name = "选项类型")
    private String optionType;

    /** 选项定义 */
    @Excel(name = "选项定义")
    private String optionDefinition;

    /** 所属题号 */
    @Excel(name = "所属题号")
    private Long questionNumber;

    public void setOptionId(Long optionId) 
    {
        this.optionId = optionId;
    }

    public Long getOptionId() 
    {
        return optionId;
    }

    public void setOptionText(String optionText) 
    {
        this.optionText = optionText;
    }

    public String getOptionText() 
    {
        return optionText;
    }

    public void setOptionType(String optionType) 
    {
        this.optionType = optionType;
    }

    public String getOptionType() 
    {
        return optionType;
    }

    public void setOptionDefinition(String optionDefinition) 
    {
        this.optionDefinition = optionDefinition;
    }

    public String getOptionDefinition() 
    {
        return optionDefinition;
    }

    public void setQuestionNumber(Long questionNumber) 
    {
        this.questionNumber = questionNumber;
    }

    public Long getQuestionNumber() 
    {
        return questionNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("optionId", getOptionId())
            .append("optionText", getOptionText())
            .append("optionType", getOptionType())
            .append("optionDefinition", getOptionDefinition())
            .append("questionNumber", getQuestionNumber())
            .toString();
    }
}

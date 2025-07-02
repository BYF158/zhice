package com.etsong.questions.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.etsong.common.annotation.Excel;
import com.etsong.common.core.domain.BaseEntity;

/**
 * 题目管理对象 topic
 * 
 * @author ruoyi
 * @date 2025-07-01
 */
public class Topic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目序号 */
    private Integer topicId;

    /** 题干 */
    @Excel(name = "题干")
    private String topicContent;

    /** 题目类别 */
    @Excel(name = "题目类别")
    private Integer prototypeId;

    public void setTopicId(Integer topicId) 
    {
        this.topicId = topicId;
    }

    public Integer getTopicId() 
    {
        return topicId;
    }

    public void setTopicContent(String topicContent) 
    {
        this.topicContent = topicContent;
    }

    public String getTopicContent() 
    {
        return topicContent;
    }

    public void setPrototypeId(Integer prototypeId) 
    {
        this.prototypeId = prototypeId;
    }

    public Integer getPrototypeId() 
    {
        return prototypeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("topicId", getTopicId())
            .append("topicContent", getTopicContent())
            .append("prototypeId", getPrototypeId())
            .toString();
    }
}

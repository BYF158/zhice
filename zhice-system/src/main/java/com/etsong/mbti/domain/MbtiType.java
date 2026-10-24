package com.etsong.mbti.domain;

import java.io.Serializable;

/**
 * MBTI 十六型人格对象 mbti_types
 *
 * @author openclaw
 * @date 2026-10-21
 */
public class MbtiType implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 类型代码 */
    private String typeCode;

    /** 中文别称 */
    private String typeName;

    /** 英文别称 */
    private String nickName;

    /** 所属群体 */
    private String groupName;

    /** 主题色 */
    private String color;

    /** 一句话概述 */
    private String summary;

    /** 性格描述 */
    private String description;

    /** 优势 */
    private String strengths;

    /** 劣势 */
    private String weaknesses;

    /** 适合职业 */
    private String careers;

    /** 人际关系 */
    private String relationships;

    /** 代表人物 */
    private String famous;

    public String getTypeCode()
    {
        return typeCode;
    }

    public void setTypeCode(String typeCode)
    {
        this.typeCode = typeCode;
    }

    public String getTypeName()
    {
        return typeName;
    }

    public void setTypeName(String typeName)
    {
        this.typeName = typeName;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getGroupName()
    {
        return groupName;
    }

    public void setGroupName(String groupName)
    {
        this.groupName = groupName;
    }

    public String getColor()
    {
        return color;
    }

    public void setColor(String color)
    {
        this.color = color;
    }

    public String getSummary()
    {
        return summary;
    }

    public void setSummary(String summary)
    {
        this.summary = summary;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getStrengths()
    {
        return strengths;
    }

    public void setStrengths(String strengths)
    {
        this.strengths = strengths;
    }

    public String getWeaknesses()
    {
        return weaknesses;
    }

    public void setWeaknesses(String weaknesses)
    {
        this.weaknesses = weaknesses;
    }

    public String getCareers()
    {
        return careers;
    }

    public void setCareers(String careers)
    {
        this.careers = careers;
    }

    public String getRelationships()
    {
        return relationships;
    }

    public void setRelationships(String relationships)
    {
        this.relationships = relationships;
    }

    public String getFamous()
    {
        return famous;
    }

    public void setFamous(String famous)
    {
        this.famous = famous;
    }
}

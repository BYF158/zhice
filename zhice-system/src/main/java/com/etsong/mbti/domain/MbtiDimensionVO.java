package com.etsong.mbti.domain;

import java.io.Serializable;

/**
 * 单个维度的得分情况
 *
 * @author openclaw
 */
public class MbtiDimensionVO implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 维度标识 EI/SN/TF/JP */
    private String dimension;

    /** 维度名称 如 精力方向 */
    private String dimensionName;

    /** 左侧极（如 E） */
    private String leftPole;

    /** 右侧极（如 I） */
    private String rightPole;

    /** 左侧极中文（如 外向） */
    private String leftLabel;

    /** 右侧极中文（如 内向） */
    private String rightLabel;

    /** 左侧得分 */
    private Integer leftScore;

    /** 右侧得分 */
    private Integer rightScore;

    /** 左侧占比（0-100） */
    private Integer leftPercent;

    /** 右侧占比（0-100） */
    private Integer rightPercent;

    /** 主导极（E/I/S/N/T/F/J/P） */
    private String dominant;

    public String getDimension()
    {
        return dimension;
    }

    public void setDimension(String dimension)
    {
        this.dimension = dimension;
    }

    public String getDimensionName()
    {
        return dimensionName;
    }

    public void setDimensionName(String dimensionName)
    {
        this.dimensionName = dimensionName;
    }

    public String getLeftPole()
    {
        return leftPole;
    }

    public void setLeftPole(String leftPole)
    {
        this.leftPole = leftPole;
    }

    public String getRightPole()
    {
        return rightPole;
    }

    public void setRightPole(String rightPole)
    {
        this.rightPole = rightPole;
    }

    public String getLeftLabel()
    {
        return leftLabel;
    }

    public void setLeftLabel(String leftLabel)
    {
        this.leftLabel = leftLabel;
    }

    public String getRightLabel()
    {
        return rightLabel;
    }

    public void setRightLabel(String rightLabel)
    {
        this.rightLabel = rightLabel;
    }

    public Integer getLeftScore()
    {
        return leftScore;
    }

    public void setLeftScore(Integer leftScore)
    {
        this.leftScore = leftScore;
    }

    public Integer getRightScore()
    {
        return rightScore;
    }

    public void setRightScore(Integer rightScore)
    {
        this.rightScore = rightScore;
    }

    public Integer getLeftPercent()
    {
        return leftPercent;
    }

    public void setLeftPercent(Integer leftPercent)
    {
        this.leftPercent = leftPercent;
    }

    public Integer getRightPercent()
    {
        return rightPercent;
    }

    public void setRightPercent(Integer rightPercent)
    {
        this.rightPercent = rightPercent;
    }

    public String getDominant()
    {
        return dominant;
    }

    public void setDominant(String dominant)
    {
        this.dominant = dominant;
    }
}

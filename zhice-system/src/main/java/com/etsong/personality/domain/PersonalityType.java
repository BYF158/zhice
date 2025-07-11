package com.etsong.personality.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 性格类型实体类
 */
@Data
public class PersonalityType implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */

    private Long id;

    /**
     * 类型编码(S/M/C/P)
     */
    private String typeCode;

    /**
     * 类型名称
     */
    private String typeName;

    /**
     * 核心特质
     */
    private String coreTraits;

    /**
     * 情感优势
     */
    private String emotionalStrengths;

    /**
     * 工作优势
     */
    private String workStrengths;

    /**
     * 交友优势
     */
    private String friendStrengths;

    /**
     *  parenting优势
     */
    private String parentStrengths;

    /**
     * 创建时间
     */
    private Date createdAt;

    /**
     * 更新时间
     */
    private Date updatedAt;
}

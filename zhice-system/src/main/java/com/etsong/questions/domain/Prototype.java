package com.etsong.questions.domain;

/**
 * 原型实体类，对应prototype表
 */
public class Prototype {
    private Integer prototypeId;
    private String prototypeName;
    private String description;

    // Getters and Setters
    public Integer getPrototypeId() {
        return prototypeId;
    }

    public void setPrototypeId(Integer prototypeId) {
        this.prototypeId = prototypeId;
    }

    public String getPrototypeName() {
        return prototypeName;
    }

    public void setPrototypeName(String prototypeName) {
        this.prototypeName = prototypeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
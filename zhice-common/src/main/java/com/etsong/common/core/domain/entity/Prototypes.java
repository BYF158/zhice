package com.etsong.common.core.domain.entity;

import com.etsong.common.core.domain.BaseEntity;

public class Prototypes extends BaseEntity {
    private static final long serialVersionUID = 1L;


    private int prototypeId;
    private String prototypeName;
    private String description;

    // 无参构造函数
    public Prototypes() {
    }

    // 全参构造函数
    public Prototypes(int prototypeId, String prototypeName, String description) {
        this.prototypeId = prototypeId;
        this.prototypeName = prototypeName;
        this.description = description;
    }

    // Getter 和 Setter 方法
    public int getPrototypeId() {
        return prototypeId;
    }

    public void setPrototypeId(int prototypeId) {
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

    // toString 方法
    @Override
    public String toString() {
        return "Prototype{" +
                "prototypeId=" + prototypeId +
                ", prototypeName='" + prototypeName + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}

package com.etsong.common.core.domain.entity;

import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;

import java.util.Date;

public class PrototypeScoreDTO {

    private Integer recordId;      // 用户名称
    private String userName;      // 用户名称
    private String prototypeName; // 原型名称
    private Integer score;        // 分数
    private Date submitTime;      // 提交时间

    // 构造函数、getter和setter方法
    public PrototypeScoreDTO() {
    }

    public PrototypeScoreDTO(Integer recordId,String userName, String prototypeName, Integer score, Date submitTime) {
        this.recordId= recordId;
        this.userName = userName;
        this.prototypeName = prototypeName;
        this.score = score;
        this.submitTime = submitTime;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPrototypeName() {
        return prototypeName;
    }

    public void setPrototypeName(String prototypeName) {
        this.prototypeName = prototypeName;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }
// getter和setter方法...
    // toString方法...

    @Override
    public String toString() {
        return "PrototypeScoreDTO{" +
                "userName='" + userName + '\'' +
                ", prototypeName='" + prototypeName + '\'' +
                ", score=" + score +
                ", submitTime=" + submitTime +
                '}';
    }
}

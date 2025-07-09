package com.etsong.common.core.domain.entity;

import com.etsong.common.core.domain.BaseEntity;

import java.util.Date;

public class TestRecordS extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private Integer recordId;    // 主键，自增
    private Long userId;        // 外键，关联sys_user表的user_id
    private Date submitTime;    // 提交时间

    // 无参构造函数
    public TestRecordS() {
    }

    // 全参构造函数
    public TestRecordS(Integer recordId, Long userId, Date submitTime) {
        this.recordId = recordId;
        this.userId = userId;
        this.submitTime = submitTime;
    }

    // Getter 和 Setter 方法
    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    // toString 方法
    @Override
    public String toString() {
        return "TestRecord{" +
                "recordId=" + recordId +
                ", userId=" + userId +
                ", submitTime=" + submitTime +
                '}';
    }
}

package com.etsong.common.core.domain.entity;

import com.etsong.common.core.domain.BaseEntity;

public class PrototypeScores extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private Integer id;          // 主键，自增
    private Integer recordId;    // 外键，关联test_record表的record_id
    private Integer prototypeId; // 外键，关联prototype表的prototype_id
    private Integer score;       // 分数

    // 无参构造函数
    public PrototypeScores() {
    }

    // 全参构造函数
    public PrototypeScores(Integer id, Integer recordId, Integer prototypeId, Integer score) {
        this.id = id;
        this.recordId = recordId;
        this.prototypeId = prototypeId;
        this.score = score;
    }

    // Getter 和 Setter 方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getPrototypeId() {
        return prototypeId;
    }

    public void setPrototypeId(Integer prototypeId) {
        this.prototypeId = prototypeId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    // toString 方法
    @Override
    public String toString() {
        return "PrototypeScore{" +
                "id=" + id +
                ", recordId=" + recordId +
                ", prototypeId=" + prototypeId +
                ", score=" + score +
                '}';
    }
}

package com.etsong.questions.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * 测试记录实体类
 */
@Getter
public class TestRecord {
    // Getters and Setters
    private Integer recordId;
    @Setter
    private Long userId;

    @Setter
    private LocalDateTime submitTime;
}
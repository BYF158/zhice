package com.etsong.questions.domain;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PrototypeScore {
    // Getters & Setters
    private Integer id;
    private Integer recordId;
    private Integer prototypeId;
    private Integer score;
    private String prototypeName; // 用于关联查询

}
package com.etsong.personality.domain;

import lombok.Data;

import java.util.Date;

@Data
public class PersonalityResults {
    private Long resultId;
    private Long userId;
    private Date testDate;
    private Long typeSScore;
    private Long typeMScore;
    private Long typeCScore;
    private Long typePScore;
}

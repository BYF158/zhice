package com.etsong.personality.domain;

import lombok.Data;

import java.util.List;

@Data
public class PersonalityTestRequest {
    private Long userId;
    private List<Integer> selectedOptionIds;
}

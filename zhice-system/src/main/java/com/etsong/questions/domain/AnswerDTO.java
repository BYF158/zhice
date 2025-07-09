package com.etsong.questions.domain;



import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class AnswerDTO {
    private List<AnswerItem> answers;

    @Setter
    @Getter
    public static class AnswerItem {
        // Getters and Setters
        private Integer topicId;
        private Integer score;

    }
}

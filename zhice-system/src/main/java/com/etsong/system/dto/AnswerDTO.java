package com.etsong.system.dto;

import java.util.List;

/**
 * 用于接收前端提交的答案数据
 */
public class AnswerDTO {
    private List<AnswerItem> answers;

    public List<AnswerItem> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AnswerItem> answers) {
        this.answers = answers;
    }

    public static class AnswerItem {
        private Long topicId;
        private Integer score;

        // Getters and Setters
        public Long getTopicId() {
            return topicId;
        }

        public void setTopicId(Long topicId) {
            this.topicId = topicId;
        }

        public Integer getScore() {
            return score;
        }

        public void setScore(Integer score) {
            this.score = score;
        }
    }
}
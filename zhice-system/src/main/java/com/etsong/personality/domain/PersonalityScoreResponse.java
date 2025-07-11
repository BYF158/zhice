package com.etsong.personality.domain;



import java.util.List;

public class PersonalityScoreResponse {
    private List<ScoreItem> scores;

    public static class ScoreItem {
        private String name;
        private Integer score;

        // Getters & Setters
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public Integer getScore() { return score; }
        public void setScore(Integer score) { this.score = score; }
    }

    // Getters & Setters
    public List<ScoreItem> getScores() { return scores; }
    public void setScores(List<ScoreItem> scores) { this.scores = scores; }
}
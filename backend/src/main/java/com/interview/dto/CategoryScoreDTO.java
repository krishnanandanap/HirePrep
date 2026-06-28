package com.interview.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CategoryScoreDTO {
    private String category;
    private int totalQuestions;
    private int correctAnswers;
    private double percentage;
}
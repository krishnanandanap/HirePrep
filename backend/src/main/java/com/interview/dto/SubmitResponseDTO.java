package com.interview.dto;

import lombok.*;
import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class SubmitResponseDTO {
    private int score;
    private int correctAnswers;
    private int wrongAnswers;
    private int totalQuestions;
    private List<QuestionResultDTO> breakdown;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class QuestionResultDTO {
        private Long questionId;
        private String questionText;
        private String yourAnswer;
        private String correctAnswer;
        private boolean correct;
    }
}

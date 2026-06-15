package com.interview.dto;

import lombok.*;
import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ResultResponseDTO {
    private Long id;
    private int score;
    private int correctAnswers;
    private int wrongAnswers;
    private int totalQuestions;
    private LocalDateTime date;
}

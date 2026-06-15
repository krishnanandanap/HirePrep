package com.interview.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class QuestionResponseDTO {
    private Long id;
    private String question;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    // correctAnswer intentionally omitted
}

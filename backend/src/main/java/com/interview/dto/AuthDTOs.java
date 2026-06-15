package com.interview.dto;

import lombok.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

// ── Auth DTOs ────────────────────────────────────────────────
public class AuthDTOs {

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class RegisterRequest {
        private String name;
        private String email;
        private String password;
    }

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class LoginRequest {
        private String email;
        private String password;
    }

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class AuthResponse {
        private String token;
        private Long userId;
        private String name;
        private String email;
        private String message;
    }
}

// ── Question DTOs ────────────────────────────────────────────
class QuestionDTO {

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class QuestionResponse {
        private Long id;
        private String question;
        private String optionA;
        private String optionB;
        private String optionC;
        private String optionD;
        // NOTE: correctAnswer is NOT included — never expose answers to frontend
    }
}

// ── Submit DTOs ──────────────────────────────────────────────
class SubmitDTOs {

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor
    public static class SubmitRequest {
        private Long userId;
        // Map of questionId → chosen answer ("A", "B", "C", "D")
        private Map<Long, String> answers;
    }

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class SubmitResponse {
        private int score;
        private int correctAnswers;
        private int wrongAnswers;
        private int totalQuestions;
        private List<QuestionResult> breakdown;
    }

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class QuestionResult {
        private Long questionId;
        private String questionText;
        private String yourAnswer;
        private String correctAnswer;
        private boolean isCorrect;
    }
}

// ── Result DTOs ──────────────────────────────────────────────
class ResultDTOs {

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class ResultResponse {
        private Long id;
        private int score;
        private int correctAnswers;
        private int wrongAnswers;
        private int totalQuestions;
        private LocalDateTime date;
    }
}

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


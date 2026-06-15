package com.interview.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "result")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    @Column(nullable = false)
    private int score;

    @Column(nullable = false)
    private int correctAnswers;

    @Column(nullable = false)
    private int wrongAnswers;

    @Column(nullable = false)
    private int totalQuestions;

    @Column(nullable = false)
    private LocalDateTime date;
}

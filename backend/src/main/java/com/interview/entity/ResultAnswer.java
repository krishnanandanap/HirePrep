package com.interview.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "result_answer")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ResultAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long resultId;

    @Column(nullable = false)
    private Long questionId;

    @Column(nullable = false)
    private String selectedAnswer;

    @Column(nullable = false)
    private boolean correct;

    @Column(nullable = false)
    private String category;
}
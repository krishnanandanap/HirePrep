package com.interview.controller;

import com.interview.dto.QuestionResponseDTO;
import com.interview.entity.Question;
import com.interview.repository.QuestionRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class QuestionController {

    private final QuestionRepository questionRepository;

    public QuestionController(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    // GET /api/questions — returns 10 random questions (without correct answers)
    @GetMapping("/questions")
    public ResponseEntity<List<QuestionResponseDTO>> getQuestions() {
        List<Question> questions = questionRepository.findRandom10Questions();

        List<QuestionResponseDTO> response = questions.stream()
                .map(q -> QuestionResponseDTO.builder()
                        .id(q.getId())
                        .question(q.getQuestion())
                        .optionA(q.getOptionA())
                        .optionB(q.getOptionB())
                        .optionC(q.getOptionC())
                        .optionD(q.getOptionD())
                        .build())
                .collect(Collectors.toList());

        return ResponseEntity.ok(response);
    }
}

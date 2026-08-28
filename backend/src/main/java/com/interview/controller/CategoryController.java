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
public class CategoryController {

    private final QuestionRepository questionRepository;

    public CategoryController(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @GetMapping("/questions/category/{category}")
    public ResponseEntity<List<QuestionResponseDTO>> getQuestionsByCategory(
            @PathVariable String category) {

        List<Question> questions = questionRepository.findAll()
                .stream()
                .filter(q -> q.getCategory() != null)
                .filter(q -> q.getCategory().equalsIgnoreCase(category))
                .sorted((a, b) -> Math.random() > 0.5 ? 1 : -1)
                .limit(10)
                .collect(Collectors.toList());

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

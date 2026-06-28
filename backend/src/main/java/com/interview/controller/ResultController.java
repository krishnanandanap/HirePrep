package com.interview.controller;

import com.interview.dto.CategoryScoreDTO;
import com.interview.dto.ResultResponseDTO;
import com.interview.entity.ResultAnswer;
import com.interview.repository.ResultAnswerRepository;
import com.interview.repository.ResultRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class ResultController {

    private final ResultRepository resultRepository;
    private final ResultAnswerRepository resultAnswerRepository; // ADD THIS

    public ResultController(ResultRepository resultRepository,
                            ResultAnswerRepository resultAnswerRepository) { // ADD THIS
        this.resultRepository = resultRepository;
        this.resultAnswerRepository = resultAnswerRepository; // ADD THIS
    }

    // existing endpoint — unchanged
    @GetMapping("/results/{userId}")
    public ResponseEntity<List<ResultResponseDTO>> getResults(@PathVariable Long userId) {
        List<ResultResponseDTO> results = resultRepository.findByUserIdOrderByDateDesc(userId)
                .stream()
                .map(r -> ResultResponseDTO.builder()
                        .id(r.getId())
                        .score(r.getScore())
                        .correctAnswers(r.getCorrectAnswers())
                        .wrongAnswers(r.getWrongAnswers())
                        .totalQuestions(r.getTotalQuestions())
                        .date(r.getDate())
                        .build())
                .collect(Collectors.toList());
        return ResponseEntity.ok(results);
    }

    // NEW endpoint
    @GetMapping("/results/{resultId}/category-scores")
    public ResponseEntity<List<CategoryScoreDTO>> getCategoryScores(@PathVariable Long resultId) {
        List<ResultAnswer> answers = resultAnswerRepository.findByResultId(resultId);

        // Group by category
        Map<String, List<ResultAnswer>> grouped = answers.stream()
                .collect(Collectors.groupingBy(ResultAnswer::getCategory));

        List<CategoryScoreDTO> categoryScores = grouped.entrySet().stream()
                .map(entry -> {
                    String category = entry.getKey();
                    List<ResultAnswer> categoryAnswers = entry.getValue();
                    int total = categoryAnswers.size();
                    int correct = (int) categoryAnswers.stream().filter(ResultAnswer::isCorrect).count();
                    double percentage = total > 0 ? (correct * 100.0) / total : 0;

                    return CategoryScoreDTO.builder()
                            .category(category)
                            .totalQuestions(total)
                            .correctAnswers(correct)
                            .percentage(percentage)
                            .build();
                })
                .collect(Collectors.toList());

        return ResponseEntity.ok(categoryScores);
    }
}
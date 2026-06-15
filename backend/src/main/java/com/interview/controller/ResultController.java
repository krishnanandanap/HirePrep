package com.interview.controller;

import com.interview.dto.ResultResponseDTO;
import com.interview.repository.ResultRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class ResultController {

    private final ResultRepository resultRepository;

    public ResultController(ResultRepository resultRepository) {
        this.resultRepository = resultRepository;
    }

    // GET /api/results/{userId}
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
}

package com.interview.controller;

import com.interview.dto.SubmitRequestDTO;
import com.interview.dto.SubmitResponseDTO;
import com.interview.entity.Question;
import com.interview.entity.Result;
import com.interview.repository.QuestionRepository;
import com.interview.repository.ResultRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class TestController {

    private final QuestionRepository questionRepository;
    private final ResultRepository resultRepository;

    public TestController(QuestionRepository questionRepository,
                          ResultRepository resultRepository) {
        this.questionRepository = questionRepository;
        this.resultRepository = resultRepository;
    }

    // POST /api/submit
    @PostMapping("/submit")
    public ResponseEntity<SubmitResponseDTO> submitTest(@RequestBody SubmitRequestDTO request) {

        Map<Long, String> userAnswers = request.getAnswers();
        List<Long> questionIds = new ArrayList<>(userAnswers.keySet());

        // Fetch all answered questions from DB
        List<Question> questions = questionRepository.findAllById(questionIds);

        List<SubmitResponseDTO.QuestionResultDTO> breakdown = new ArrayList<>();
        int correctCount = 0;

        for (Question q : questions) {
            String userAnswer = userAnswers.get(q.getId());
            boolean isCorrect = q.getCorrectAnswer().equalsIgnoreCase(userAnswer);
            if (isCorrect) correctCount++;

            breakdown.add(SubmitResponseDTO.QuestionResultDTO.builder()
                    .questionId(q.getId())
                    .questionText(q.getQuestion())
                    .yourAnswer(userAnswer)
                    .correctAnswer(q.getCorrectAnswer())
                    .correct(isCorrect)
                    .build());
        }

        int total = questions.size();
        int wrong = total - correctCount;
        int score = correctCount * 10; // 10 points per correct answer

        // Save result to DB
        Result result = Result.builder()
                .userId(request.getUserId())
                .score(score)
                .correctAnswers(correctCount)
                .wrongAnswers(wrong)
                .totalQuestions(total)
                .date(LocalDateTime.now())
                .build();
        resultRepository.save(result);

        return ResponseEntity.ok(SubmitResponseDTO.builder()
                .score(score)
                .correctAnswers(correctCount)
                .wrongAnswers(wrong)
                .totalQuestions(total)
                .breakdown(breakdown)
                .build());
    }
}

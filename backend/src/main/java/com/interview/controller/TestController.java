package com.interview.controller;

import com.interview.dto.SubmitRequestDTO;
import com.interview.dto.SubmitResponseDTO;
import com.interview.entity.Question;
import com.interview.entity.Result;
import com.interview.entity.ResultAnswer;
import com.interview.repository.QuestionRepository;
import com.interview.repository.ResultAnswerRepository;
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
    private final ResultAnswerRepository resultAnswerRepository; // ADD THIS

    public TestController(QuestionRepository questionRepository,
                          ResultRepository resultRepository,
                          ResultAnswerRepository resultAnswerRepository) { // ADD THIS
        this.questionRepository = questionRepository;
        this.resultRepository = resultRepository;
        this.resultAnswerRepository = resultAnswerRepository; // ADD THIS
    }

    @PostMapping("/submit")
    public ResponseEntity<SubmitResponseDTO> submitTest(@RequestBody SubmitRequestDTO request) {

        Map<Long, String> userAnswers = request.getAnswers();
        List<Long> questionIds = new ArrayList<>(userAnswers.keySet());
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
        int score = correctCount * 10;

        // Save Result
        Result result = Result.builder()
                .userId(request.getUserId())
                .score(score)
                .correctAnswers(correctCount)
                .wrongAnswers(wrong)
                .totalQuestions(total)
                .date(LocalDateTime.now())
                .build();
        Result savedResult = resultRepository.save(result); // ← capture saved result

        // Save ResultAnswers (NEW)
        List<ResultAnswer> resultAnswers = questions.stream()
                .map(q -> ResultAnswer.builder()
                        .resultId(savedResult.getId())
                        .questionId(q.getId())
                        .selectedAnswer(userAnswers.get(q.getId()))
                        .correct(q.getCorrectAnswer().equalsIgnoreCase(userAnswers.get(q.getId())))
                        .category(q.getCategory())
                        .build())
                .collect(Collectors.toList());
        resultAnswerRepository.saveAll(resultAnswers); // ← save all at once

        return ResponseEntity.ok(SubmitResponseDTO.builder()
                .id(savedResult.getId()) 
                .score(score)
                .correctAnswers(correctCount)
                .wrongAnswers(wrong)
                .totalQuestions(total)
                .breakdown(breakdown)
                .build());
    }
}
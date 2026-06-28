package com.interview.repository;

import com.interview.entity.ResultAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ResultAnswerRepository extends JpaRepository<ResultAnswer, Long> {
    List<ResultAnswer> findByResultId(Long resultId);
}
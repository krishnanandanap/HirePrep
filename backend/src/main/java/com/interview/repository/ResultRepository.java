package com.interview.repository;

import com.interview.entity.Result;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findByUserIdOrderByDateDesc(Long userId);
}

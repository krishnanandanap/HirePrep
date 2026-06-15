package com.interview.dto;

import lombok.*;
import java.util.List;
import java.util.Map;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class SubmitRequestDTO {
    private Long userId;
    private Map<Long, String> answers; // questionId → "A"/"B"/"C"/"D"
}

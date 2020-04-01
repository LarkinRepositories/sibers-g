package com.larkinds.sibers.dto;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class NewsDto {
    private final Long id;
    private final LocalDateTime created;
    private String img;
    private final String  message;
}

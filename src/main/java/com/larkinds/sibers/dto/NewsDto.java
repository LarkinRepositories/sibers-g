package com.larkinds.sibers.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * Data to object class describing News class
 */

@Data
public class NewsDto {
    private Long id;
    private LocalDateTime created;
    private String img;
    private String text;


}

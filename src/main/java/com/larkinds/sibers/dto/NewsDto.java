package com.larkinds.sibers.dto;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * Data to object class describing News class
 */

@Data
public class NewsDto {
    private Long id;
    @NotNull
    @NotBlank(message = "Title should not be empty")
    @Length(max = 1000, message = "Title is too long. Should be less than or equal 1000 characters")
    private String title;
    private LocalDateTime created;
    private String img;
    @NotNull
    @NotBlank(message = "Text should not be empty")
    @Length(max = 2048, message = "Text is too long. Should be less than or equal 2048 characters ")
    private String text;


}

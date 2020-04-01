package com.larkinds.sibers.model;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "news")
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "title")
    private String title;
    @CreatedDate
    @Column(name = "created")
    private LocalDateTime created;
    @Column(name = "img")
    private String img;
    @Column(name = "text")
    private String text;
}

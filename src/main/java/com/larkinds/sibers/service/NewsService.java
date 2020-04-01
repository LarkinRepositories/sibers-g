package com.larkinds.sibers.service;

import com.larkinds.sibers.dto.NewsDto;

import java.util.List;

public interface NewsService {
    /**
     * Adds news to the database
     * @param newsDto DTO representation of the news entity
     * @return news added
     */
    NewsDto add(NewsDto newsDto);

    /**
     * Returns all news stored in the database
     * @return List of news stored in the database
     */
    List<NewsDto> getAll();

    /**
     * Updates the news by its id
     * @param id id of the news
     * @return updated news dto
     */
    NewsDto update(Long id);

    /**
     * Returns a limited count of news
     * @param limit limiter
     * @return a list of news matching param criteria
     */
    List<NewsDto> getAllWithPagination(Integer limit);
}

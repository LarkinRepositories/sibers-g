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
     * Updates a particular news in the database
     * @param newsDto news to update
     * @return updated news dto
     */
    NewsDto update(NewsDto newsDto);

    /**
     * Returns a limited count of news
     * @param limit limiter
     * @return a list of news matching param criteria
     */
    List<NewsDto> getAllWithPagination(Integer limit);

    /**
     * Filters news to display only containing filterText ones
     * @param filterText a text to filter the news
     * @return List of filtered news matching param criteria
     */
    List<NewsDto> filter(String filterText);

}

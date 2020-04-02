package com.larkinds.sibers.service;

import com.larkinds.sibers.dto.NewsDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface NewsService {
    /**
     * Adds news to the database
     * @param newsDto DTO representation of the news entity
     * @return news added
     */
    NewsDto add(NewsDto newsDto);

    /**
     * Gets a particular news with param id
     * @param id id of the news
     * @return News with id matching param criteria
     */
    NewsDto get(Long id);

    /**
     * Checks if news record with title param exists
     * @param title title of the news
     * @return exists ? true : false
     */
    boolean exitsByTitle(String title);

    /**
     * Returns all news stored in the database
     * @return List of news stored in the database
     */
    List<NewsDto> getAll();

    /**
     * Returns list of news limited to pageable
     * @param pageable limiter
     * @return a list of news
     */
    Page<NewsDto> getPage(Pageable pageable);

    /**
     * Updates a particular news in the database
     * @param newsDto news to update
     * @return updated news dto
     */
    NewsDto update(NewsDto newsDto);

    /**
     * Filters news to display only containing filterText ones
     * @param filterText a text to filter the news
     * @param pageable limiter
     * @return List of filtered news matching param criteria
     */
    Page<NewsDto> filter(String filterText, Pageable pageable);

}

package com.larkinds.sibers.repository;

import com.larkinds.sibers.model.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {
    /**
     * Returns page with limited news count
     * @param pageable news count limiter
     * @return page of news
     */
    Page<News> findAll(Pageable pageable);

    /**
     * Returns page of news containing specific text
     * @param searchText text to search
     * @param  titleText title text to search
     * @param pageable limiter
     * @return page of news containing specific text
     */
    Page<News> findAllByTextContainingOrTitleContaining(String searchText, String titleText, Pageable pageable);
}

package com.larkinds.sibers.repository;

import com.larkinds.sibers.model.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {
    /**
     * Returns page with limited news count
     * @param pageable news count limiter
     * @return page of news
     */
    Page<News> findAll(Pageable pageable);
}

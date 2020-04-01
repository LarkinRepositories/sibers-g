package com.larkinds.sibers.mapper;

import com.larkinds.sibers.dto.NewsDto;
import com.larkinds.sibers.model.News;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * Mapper resolving reversible mapping between News class and NewsDto class instances
 */
@Component
public class NewsMapper {
    @Autowired
    ModelMapper mapper;

    /**
     * Maps a single object of NewsDto class to a single object of News class
     * @param dto object of NewsDto class which needs mapping
     * @return mapped object of News class
     */
    public News toEntity(NewsDto dto) {
        return Objects.isNull(dto) ? null : mapper.map(dto, News.class);
    }

    /**
     * Maps a single object of News class to a single object of NewsDto class
     * @param news object of News class wich needs mapping
     * @return mapped object of NewsDto class
     */
    public NewsDto toDto(News news) {
        return Objects.isNull(news) ? null : mapper.map(news, NewsDto.class);
    }

    /**
     * Maps list of NewsDto objects into a list of News objects
     * @param newsDto list of NewsDto objects
     * @return list of News objects
     */
    public List<News> toEntityList(List<NewsDto> newsDto) {
        return Objects.isNull(newsDto) ? null : newsDto.stream().map(this::toEntity).collect(Collectors.toList());
    }

    /**
     * Maps list of News objects to a list of NewsDto objects
     * @param news list of News objects
     * @return list of NewsDto objects
     */
    public List<NewsDto> toDtoList(List<News> news) {
        return Objects.isNull(news) ? null : news.stream().map(this::toDto).collect(Collectors.toList());
    }
}

package com.larkinds.sibers.service.impl;

import com.larkinds.sibers.dto.NewsDto;
import com.larkinds.sibers.mapper.NewsMapper;
import com.larkinds.sibers.repository.NewsRepository;
import com.larkinds.sibers.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    private NewsMapper mapper;
    private NewsRepository repository;

    @Autowired
    public NewsServiceImpl(NewsMapper mapper, NewsRepository repository) {
        this.mapper = mapper;
        this.repository = repository;
    }

    @Override
    public NewsDto add(NewsDto newsDto) {
        return mapper.toDto(repository.save(mapper.toEntity(newsDto)));
    }

    @Override
    public List<NewsDto> getAll() {
        return mapper.toDtoList(repository.findAll());
    }

    @Override
    public NewsDto update(NewsDto newsDto) {
        return mapper.toDto(repository.save(mapper.toEntity(newsDto)));
    }

    @Override
    public List<NewsDto> getAllWithPagination(Integer limit) {
        return mapper.toDtoList(repository.findAllWithPagination(PageRequest.of(0,limit)).toList());
    }
}
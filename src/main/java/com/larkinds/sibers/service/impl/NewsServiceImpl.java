package com.larkinds.sibers.service.impl;

import com.larkinds.sibers.dto.NewsDto;
import com.larkinds.sibers.mapper.NewsMapper;
import com.larkinds.sibers.repository.NewsRepository;
import com.larkinds.sibers.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    public Page<NewsDto> getPage(Pageable pageable) {
        return repository.findAll(pageable).map(e->mapper.toDto(e));
    }

    @Override
    public NewsDto update(NewsDto newsDto) {
        return mapper.toDto(repository.save(mapper.toEntity(newsDto)));
    }

    @Override
    public Page<NewsDto> filter(String filterText, Pageable pageable) {
        return repository.findAllByTextContainingOrTitleContaining(filterText, filterText, pageable).map(e->mapper.toDto(e));
    }
}

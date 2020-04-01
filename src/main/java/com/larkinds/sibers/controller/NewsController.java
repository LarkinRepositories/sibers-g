package com.larkinds.sibers.controller;

import com.larkinds.sibers.dto.NewsDto;
import com.larkinds.sibers.service.NewsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@Slf4j
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Value("${upload.path}")
    private String uploadPath;
    @GetMapping
    public String index(@RequestParam(name ="filterText", required = false, defaultValue = "") String filterText,
                        Model model) {
        List<NewsDto> news = new ArrayList<>();
        if (filterText != null && !filterText.isEmpty()) {
            news = newsService.filter(filterText);
        } else {
            news = newsService.getAll();
        }
        model.addAttribute("news", news);
        model.addAttribute("filter", filterText);
        return "index";
    }

    @PostMapping
    public String add(@RequestParam(name="title")String title,
                      @RequestParam(name="file", required = false) MultipartFile file,
                      @RequestParam(name="text") String text,
                      Map<String, Object> model) throws IOException {
            NewsDto newsDto = new NewsDto();
            newsDto.setTitle(title);
            newsDto.setCreated(LocalDateTime.now());
            newsDto.setText(text);
            if (file !=null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuid = UUID.randomUUID().toString();
                String result = uuid.concat(".").concat(file.getOriginalFilename());
                file.transferTo(new File(uploadPath+"/"+result));
                newsDto.setImg(result);
            }
            log.info(newsDto.toString());
            newsService.add(newsDto);
            Iterable<NewsDto> news = newsService.getAll();
            model.put("news", news);
        return "index";
    }

}

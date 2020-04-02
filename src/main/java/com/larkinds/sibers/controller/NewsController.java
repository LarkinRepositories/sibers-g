package com.larkinds.sibers.controller;

import com.larkinds.sibers.dto.NewsDto;
import com.larkinds.sibers.service.NewsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
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
    public String index(@RequestParam(name ="filterText", required = false, defaultValue = "") String filterText, Model model,
                        @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<NewsDto> news;
        if (filterText != null && !filterText.isEmpty()) {
            news = newsService.filter(filterText,pageable);
        } else {
            news = newsService.getPage(pageable);
        }
        model.addAttribute("news", news);
        model.addAttribute("url", "");
        model.addAttribute("filter", filterText);
        return "index";
    }

    @PostMapping
    public String add(@Valid NewsDto newsDto,
                      BindingResult bindingResult,
                      @RequestParam(name="file", required = false) MultipartFile file,
                      @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                      Model model) throws IOException {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
        }
        else if (newsService.exitsByTitle(newsDto.getTitle())) {
            model.addAttribute("alreadyExitsError", "Record already exists");

        } else if (isImage(file, model)) {
            saveFile(newsDto, file, model);
            log.info(newsDto.toString());
            newsDto.setCreated(LocalDateTime.now());
            newsService.add(newsDto);
        }

        Page<NewsDto> news = newsService.getPage(pageable);
        model.addAttribute("url", "");
        model.addAttribute("title", newsDto.getTitle());
        model.addAttribute("text", newsDto.getText());
        model.addAttribute("news", news);
        return "index";
    }

    @GetMapping("/show")
    public String show(@RequestParam("id")String id, Model model) {
        NewsDto newsDto = newsService.get(Long.valueOf(id));
        model.addAttribute("newsRecord", newsDto);
        return "detail";
    }

    private void saveFile(@Valid NewsDto newsDto, @RequestParam("file")MultipartFile file, Model model) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuid = UUID.randomUUID().toString();
            String result = uuid.concat(".").concat(file.getOriginalFilename());
            file.transferTo(new File(uploadPath + "/" + result));
            newsDto.setImg(result);
        }
    }

    private boolean isImage(@RequestParam("file")MultipartFile file, Model model) {
        final String format = "image/jpg|image/png|image/gif|image/svg";
        if (file != null && !file.getOriginalFilename().isEmpty() && !file.getContentType().matches(format)) {
            String fileError = "File should be an image";
            model.addAttribute("fileError", fileError);
            return false;
        } else {
            return true;
        }
    }
}

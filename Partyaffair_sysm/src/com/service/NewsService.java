package com.service;
import com.base.ResultInfo;
import com.pojo.News;
import org.springframework.ui.Model;

public interface NewsService {
    ResultInfo add(News news);
    ResultInfo delete(Integer news_id);
    boolean findNewsByid(Integer news_id,Model model);
    boolean querys(News news, Model model);
}

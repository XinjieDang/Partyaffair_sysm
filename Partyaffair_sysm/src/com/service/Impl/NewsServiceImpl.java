package com.service.Impl;

import com.base.ResultInfo;
import com.dao.NewsDao;
import com.pojo.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao newsDao;
    @Override
    public ResultInfo add(News news) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        if(news.getNews_id()!=null){//修改操作
            result=newsDao.update(news);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }
        }else {//新增记录
            result=newsDao.add(news);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }
        }
        return resultInfo;
    }

    @Override
    public ResultInfo delete(Integer news_id) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        result=newsDao.delete(news_id);
        if(result<0){
            resultInfo.setCode(500);
            resultInfo.setMsg("操作失败！");
        }
        return resultInfo;
    }

    @Override
    public boolean findNewsByid(Integer news_id, Model model) {
        News news=newsDao.findNewsByid(news_id);
        if(news==null){
            return false;
        }
        model.addAttribute("news",news);
        return true;
    }

    @Override
    public void querys(News news, Model model) {
        List<News> list=newsDao.querys(news);
        model.addAttribute("list",list);

    }
}

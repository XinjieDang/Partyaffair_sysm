package com.controller;

import com.base.ResultInfo;
import com.pojo.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@RequestMapping("news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @RequestMapping("edit")
    public String edit(Integer news_id, Model model){
        System.out.println("cesssss");
        if(news_id!=null){
            newsService.findNewsByid(news_id,model);
        }
        return "News/news_edit";

    }
    @ResponseBody
    @RequestMapping(value ="fileUp")
    public String getfileUp(MultipartFile picture, HttpServletRequest request){
        System.out.println("测试....");
        String fileName=picture.getOriginalFilename();
        String realpath=request.getServletContext().getRealPath("upImages");
        File targetFile=new File(realpath,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        try{
            picture.transferTo(targetFile);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println(fileName);
        return fileName;
    }
    @ResponseBody
    @RequestMapping(value = "save")
    public ResultInfo save(@RequestBody News news){
        System.out.println(news.toString());
        ResultInfo resultInfo=newsService.add(news);
        return resultInfo;
    }

    @RequestMapping("newslist")
    public String newlist(News news,Model model){
        newsService.querys(news,model);
        return "News/news_list";

    }
    @RequestMapping(value = "delete")
    @ResponseBody
    public ResultInfo delete(Integer news_id){
        ResultInfo resultInfo=newsService.delete(news_id);
        return resultInfo;
    }
}

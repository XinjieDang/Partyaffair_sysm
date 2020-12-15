package com.dao;
import com.pojo.News;
import com.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
@Mapper
public interface NewsDao {

    /**
     * 添加新闻
     * @param news
     * @return
     */
    int  add(News news);

    /**
     *删除新闻
     * @param news_id
     * @return
     */
    int delete(Integer news_id);

    News findNewsByid(Integer news_id);

    /**
     * 修改新闻
     * @param news
     * @return
     */

    int update(News news);

    /**
     * 查询新闻
     * @param news
     * @return
     */
    List<News> querys(News news);
}

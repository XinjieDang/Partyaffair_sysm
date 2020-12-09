package com.dao;

import com.pojo.Organize;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
@Mapper
public interface OrganizeDao {
    /**
     * 查询组织信息
     * @return
     */
    List<Organize> findAll();


    /**
     * 添加组织
     * @param organize
     * @return
     */
    int  add(Organize organize);

    /**
     *删除
     * @param or_id
     * @return
     */
    int delete(Integer or_id);

    /**
     * 查询单个记录
     * @param or_id
     * @return
     */
    Organize findOrganizeByid(Integer or_id);

    /**
     * 更新
     * @param organize
     * @return
     */
    int update(Organize organize);

    /**
     * 多条件查询
     * @param organize
     * @return
     */

    List<Organize> querys(Organize organize);
}

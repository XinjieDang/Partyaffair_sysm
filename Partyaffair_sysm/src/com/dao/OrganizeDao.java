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
     * @param id
     * @return
     */
    int delete(Integer id);
    OrganizeDao findOrganizeByid(Integer id);

    /**
     * 更新
     * @param id
     * @return
     */
    int update(Integer id);

    /**
     * 多条件查询
     * @param organize
     * @return
     */

    List<OrganizeDao> querys(OrganizeDao organize);
}

package com.dao;

import com.pojo.DevResult;
import com.pojo.DevResultDetail;
import com.pojo.Developresult;
import com.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface DevelopresultDao {
    /**
     * 查询发展结果记录
     * @return
     */
    List<Developresult> findAll();


    /**
     * 添加发展记录
     * @param developresult
     * @return
     */
    int  add(Developresult developresult);

    /**
     *删除
     * @param res_id
     * @return
     */
    int delete(Integer res_id);

    /**
     * 查询单个记录
     * @param res_id
     * @return
     */
    Developresult findDevelopresultByid(Integer res_id);

    /**
     * 更新
     * @param developresult
     * @return
     */
    int update(Developresult developresult);

    /**
     * 多条件查询
     * @param developresult
     * @return
     */

    List<Developresult> querys(Developresult developresult);

   List<DevResult> queryResult(DevResult devResult);

    /**
     * 查询发展结果详情
     * @param res_id
     * @return
     */
   DevResultDetail querysDetail(Integer res_id);
}

package com.dao;
import com.pojo.Apprecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface ApprecordDao {
    /**
     * 查询申请记录
     * @return
     */
    List<Apprecord> findAll();


    /**
     * 添加申请记录
     * @param apprecord
     * @return
     */
    int  add(Apprecord apprecord);

    /**
     *删除
     * @param ask_id
     * @return
     */
    int delete(Integer ask_id);

    /**
     * 查询单个记录
     * @param ask_id
     * @return
     */
    Apprecord findApprecordByid(Integer ask_id);

    /**
     * 更新
     * @param apprecord
     * @return
     */
    int update(Apprecord apprecord);

    /**
     * 多条件查询
     * @param apprecord
     * @return
     */

    List<Apprecord> querys(Apprecord apprecord);

    /**
     * 申请状态改为不通过，列表页不显示
     * @param ask_id
     * @return
     */

    int updateStatus(Integer ask_id);

    /**
     * 查看被驳回的申请记录
     * @return
     */
    List<Apprecord> findreject();
    List<Apprecord> getaskNumber();
}

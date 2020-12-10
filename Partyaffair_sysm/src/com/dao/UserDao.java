package com.dao;
import com.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
@Mapper
public interface UserDao {
    /**
     * 查询用户信息
     * @return
     */
    List<User> findAll();

    /**
     * 用户登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 添加用户
     * @param user
     * @return
     */
    int  add(User user);

    /**
     *
     * @param id
     * @return
     */
    int delete(Integer id);
    User findUserByid(Integer id);

    /**
     * 修改用户
     * @param user
     * @return
     */

    int update(User user);

    List<User> querys(User user);
}

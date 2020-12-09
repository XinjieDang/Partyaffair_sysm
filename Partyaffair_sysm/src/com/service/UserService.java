package com.service;

import com.pojo.User;
import org.springframework.ui.Model;

import java.util.List;

public interface UserService {
    List<User> findAll();
    User login (User user);
    int add(User user);
    int delete(Integer id);
    User findUserByid(Integer id);

    int update(User user);
    List<User> querys(User user);
}

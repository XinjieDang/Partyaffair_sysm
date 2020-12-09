package com.service.Impl;

import com.dao.UserDao;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public int add(User user) {
        return userDao.add(user);
    }

    @Override
    public int delete(Integer id) {
        return userDao.delete(id);
    }

    @Override
    public User findUserByid(Integer id) {
        return userDao.findUserByid(id);
    }

    @Override
    public int update(Integer id) {
        return userDao.update(id);
    }

    @Override
    public List<User> querys(User user) {
        return  userDao.querys(user);
    }
}

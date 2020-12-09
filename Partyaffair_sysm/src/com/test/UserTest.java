package com.test;

import com.pojo.User;
import com.service.UserService;
import com.service.Impl.UserServiceImpl;

import java.util.ArrayList;
import java.util.List;

public class UserTest {
    public static void main(String[] args) {
        UserService userService=new UserServiceImpl();
        List<User> list=new ArrayList<>();
        list=userService.findAll();
        for (User user:list){
            System.out.println(user.toString());
        }
    }
}

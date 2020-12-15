package com.controller;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("route")
public class RouteController {
    @Autowired
    private UserService userService;
    @RequestMapping("login")
    public String welcome(){
        return "login";
    }
    @RequestMapping("index")
    public String index(){
        return "main";
    }
    @RequestMapping("edit")
    public String adduser(Integer id, Model model){
        if(id!=null){
            User user=userService.findUserByid(id);
            System.out.println(user.toString());
            model.addAttribute("users",user);
        }
        return "user/user_add";
    }
    @RequestMapping("userList")
    public String userlist(){
        return "user/user_list";
    }


}

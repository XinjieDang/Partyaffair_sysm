package com.controller;

import com.base.ResultInfo;
import com.pojo.User;
import com.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("login")
    public String login(User user, HttpSession session, Model model) {
        User loginUser = null;
        loginUser = userService.login(user);
        if (loginUser != null) {
            session.setAttribute("user", user);
            System.out.println("登录成功！");
            return "redirect:main";
        } else {
            System.out.println("登录失败");
            model.addAttribute("msg, 用户名或密码错误，请重试！");
            return "login";
        }

    }
    @RequestMapping("main")
    public String main(){
        return "index";
    }
    @RequestMapping("userList")
    public String userlist(User user, Model model){
        if(user!=null){
            List<User> userList=userService.querys(user);
            model.addAttribute("userlist",userList);
            System.out.println("查询成功！");
        }
        else {
            List<User> userList=userService.findAll();
            model.addAttribute("userlist",userList);
            System.out.println("查询成功！");
        }
        return "user/user_list";
    }
//    @RequestMapping("query")
//    public String query(User user, Model model){
//        if(user!=null){
//            List<User> userList=userService.querys(user);
//            model.addAttribute("userlist",userList);
//            System.out.println("查询成功！");
//
//        }
//        return "user/user_list";
//    }
    @RequestMapping(value ="/save",method=RequestMethod.POST)
    @ResponseBody
    public ResultInfo add(@RequestBody User user){
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        //id 不为空作修改
        if(user.getId()!=null){
            result=userService.update(user);
            if(result>0){
                System.out.println("修改成功");
                resultInfo.setCode(200);
                resultInfo.setMsg("操作成功");
            }
        }
        else {
            result=userService.add(user);
            if(result>0){
                System.out.println("添加成功");
                resultInfo.setCode(200);
                resultInfo.setMsg("操作成功");
            }

        }
        return resultInfo;
    }
    @RequestMapping( value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo delele(Integer id){
        ResultInfo resultInfo=new ResultInfo();
        if(id!=null){
           int index= userService.delete(id);
           if(index>0){
               System.out.println("删除成功");
               resultInfo.setMsg("删除成功！");
               resultInfo.setCode(200);
           }
           else {
               resultInfo.setCode(500);
               resultInfo.setMsg("删除失败！");
           }
        }
       return resultInfo;
    }
}


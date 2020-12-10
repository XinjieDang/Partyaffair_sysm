package com.controller;

import com.base.ResultInfo;
import com.pojo.Organize;
import com.pojo.Student;
import com.service.OrganizeService;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    OrganizeService organizeService;
    @RequestMapping("studentlist")
    public String studentlist(Student student, Model model){
        try{
            studentService.querys(student,model);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "student/student_list";
    }
    @RequestMapping("edit")
    public String edit(Integer or_id,Model model){
        return "student/student_edit";
    }
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo delete(Integer stu_id){
        ResultInfo resultInfo=studentService.delete(stu_id);
        return  resultInfo;
    }
    @ResponseBody
    @RequestMapping(value = "getOrganize",method =RequestMethod.POST)
    public ResultInfo getOrganize(){
        return organizeService.queryOrganizeName();
    }
    @ResponseBody
    @RequestMapping(value = "save")
    public ResultInfo save(Student student){
        System.out.println("测试");
        ResultInfo  resultInfo=studentService.add(student);
        return resultInfo;
    }
}

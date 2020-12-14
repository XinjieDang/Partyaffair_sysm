package com.controller;

import com.base.ResultInfo;
import com.pojo.Apprecord;
import com.service.ApprecordService;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("apprecord")
public class ApprecordController {
    @Autowired
    private ApprecordService apprecordService;
    @Autowired
    private StudentService studentService;
    @RequestMapping("apprecordlist")
    public String apprecordlist(Apprecord apprecord, Model model){
        apprecordService.querys(apprecord,model);
        return "apprecord/apprecord_list";
    }
    @ResponseBody
    @RequestMapping(value = "updateStatus",method = RequestMethod.POST)
    public ResultInfo updateStatus(Integer ask_id){
        System.out.println("测试");
        ResultInfo resultInfo=apprecordService.updateStatus(ask_id);
        return resultInfo;
    }
    @RequestMapping("reject")
    public String reject(Model model){
        apprecordService.findreject(model);
        return "apprecord/apprecord_list";
    }
    @ResponseBody
    @RequestMapping(value = "getStudent",method =RequestMethod.POST)
    public ResultInfo resultInfo(){
        ResultInfo resultInfo=studentService.queryStudentName();
        return resultInfo;
    }
    @RequestMapping("edit")
    public String edit(Integer ask_id,Model model){
        if(ask_id!=null){
            apprecordService.findApprecordByid(ask_id,model);
        }
        return "apprecord/apprecord_edit";
    }
    @ResponseBody
    @RequestMapping(value = "save")
    public ResultInfo save(Apprecord apprecord){
        System.out.println("添加测试！");
        ResultInfo resultInfo=apprecordService.add(apprecord);
        return resultInfo;

    }

}

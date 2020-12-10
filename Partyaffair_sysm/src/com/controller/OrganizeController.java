package com.controller;

import com.base.ResultInfo;
import com.pojo.Organize;
import com.pojo.User;
import com.service.Impl.OrganizeServiceImpl;
import com.service.OrganizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("organize")
public class OrganizeController {
    @Autowired
    private OrganizeService organizeService;
    @RequestMapping("organizelist")
    public String organizelist(Organize organize,Model model){
        if(organizeService.querys(organize,model)){
            return "organize/organize_list";
        }
        return "organize/organize_list";
    }
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo delete(Integer or_id){
        ResultInfo resultInfo=organizeService.delete(or_id);
        return  resultInfo;
    }
    @RequestMapping("edit")
    public String edit(Integer or_id,Model model){
        if(or_id!=null){
            organizeService.findOrganizeByid(or_id,model);
        }
        return "organize/organize_edit";
    }
    @RequestMapping(value ="save")
    @ResponseBody
    public ResultInfo add(Organize organize, HttpServletRequest request){
        System.out.println("测试");
        ResultInfo resultInfo=organizeService.add(organize);
        return resultInfo;
    }
}

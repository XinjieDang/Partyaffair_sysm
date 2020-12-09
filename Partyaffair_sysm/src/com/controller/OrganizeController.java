package com.controller;

import com.pojo.Organize;
import com.service.Impl.OrganizeServiceImpl;
import com.service.OrganizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("organize")
public class OrganizeController {
    @Autowired
    private OrganizeService organizeService;
    @RequestMapping("organizelist")
    public String organizelist(Model model){
        System.out.println("jjjj");
        organizeService.findAll(model);
       return "organize/organize_list";
    }
}

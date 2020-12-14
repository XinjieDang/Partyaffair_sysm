package com.controller;

import com.dao.DevelopresultDao;
import com.pojo.DevResult;
import com.service.DevelopresultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("developresult")
public class DevelopresultController {
    @Autowired
    private DevelopresultService developresultService;
    @RequestMapping("developresultlist")
    public String developresultlist(DevResult devResult, Model model){
        System.out.println("hhhhhh");
        developresultService.queryResult(devResult,model);
        return "developresult/developresult_list";
    }
    @RequestMapping("details")
    public String details(Integer res_id,Model model){
        developresultService.querysDetail(res_id,model);
        return "developresult/developresult_detail";
    }
}

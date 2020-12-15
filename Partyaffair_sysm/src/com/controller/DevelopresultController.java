package com.controller;

import com.base.ResultInfo;
import com.dao.DevelopresultDao;
import com.pojo.DevResult;
import com.pojo.Developresult;
import com.service.ApprecordService;
import com.service.DevelopresultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("developresult")
public class DevelopresultController {
    @Autowired
    private DevelopresultService developresultService;
    @Autowired
    private ApprecordService apprecordService;

    @RequestMapping("developresultlist")
    public String developresultlist(DevResult devResult, Model model) {
        System.out.println("hhhhhh");
        developresultService.queryResult(devResult, model);
        return "developresult/developresult_list";
    }

    @RequestMapping("details")
    public String details(Integer res_id, Model model) {
        developresultService.querysDetail(res_id, model);
        return "developresult/developresult_detail";
    }

    @RequestMapping("edit")
    public String edit(Integer res_id, Model model) {
        System.out.println("测试编辑");
        System.out.println(res_id);
        if (res_id != null) {
            developresultService.findDevelopresultByid(res_id, model);
        }
        return "developresult/developresult_add";
    }
    @ResponseBody
    @RequestMapping("getask_number")
    public ResultInfo getask_number(){
        ResultInfo resultInfo=apprecordService.getaskNumber();
        return  resultInfo;
    }

    @ResponseBody
    @RequestMapping(value = "save")
    public ResultInfo save(Developresult developresult, HttpServletRequest request){
        ResultInfo resultInfo=developresultService.add(developresult);
        return  resultInfo;
    }

    @ResponseBody
    @RequestMapping(value = "del")
    public ResultInfo del(Integer res_id){
        ResultInfo resultInfo=developresultService.delete(res_id);
        return  resultInfo;
    }
}

package com.service.Impl;

import com.base.ResultInfo;
import com.dao.OrganizeDao;
import com.pojo.Organize;
import com.service.OrganizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class OrganizeServiceImpl implements OrganizeService {
    @Autowired
    private OrganizeDao organizeDao;

    @Override
    public boolean findAll(Model model) {
        List<Organize> list=organizeDao.findAll();
        if(list!=null){
            model.addAttribute("list",list);
        }
        else {
            return false;
        }
        return true;
    }
    @Override
    public ResultInfo add(Organize organize) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        //id 不为空作修改
        if(organize.getOr_id()!=null){
            result=organizeDao.update(organize);
            if(result<0){
                System.out.println("修改失败");
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }
        }
        else {//添加
            result=organizeDao.add(organize);
            if(result<0){
                System.out.println("添加失败！");
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }

        }
        return resultInfo;
    }

    @Override
    public ResultInfo delete(Integer or_id) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        if(or_id!=null){
            result=organizeDao.delete(or_id);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("删除失败！");
            }
        }
        else{
            resultInfo.setCode(500);
            resultInfo.setMsg("删除失败！");
        }
        return resultInfo;
    }

    @Override
    public boolean findOrganizeByid(Integer or_id,Model model) {
        if(or_id!=null){
            Organize organize=organizeDao.findOrganizeByid(or_id);
            System.out.println(organize.toString());
            model.addAttribute("organizers",organize);
            return true;
        }
        else {
            System.out.println("没有这条记录！");
            return false;
        }
    }
    @Override
    public boolean querys(Organize organize,Model model) {
        System.out.println(organize.toString());
        if(organize!=null){
            //条件查询
            List<Organize> list=organizeDao.querys(organize);
            model.addAttribute("list",list);
            System.out.println("查询成功！");
            return true;
        }else if (organize==null){//查询所有
            List<Organize> list=organizeDao.findAll();
            model.addAttribute("list",list);
            System.out.println("查询成功！");
            return true;
        }else{
            System.out.println("查找无记录！");
            return false;
        }
    }

    @Override
    public ResultInfo queryOrganizeName() {
        List<Organize> organize=organizeDao.queryOrganizeName();
        ResultInfo resultInfo=new ResultInfo();
        resultInfo.setResult(organize);
        return resultInfo;
    }
}

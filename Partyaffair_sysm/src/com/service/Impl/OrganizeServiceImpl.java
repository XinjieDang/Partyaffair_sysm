package com.service.Impl;

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
    public String add(Organize organize) {
        return null;
    }

    @Override
    public String delete(Integer id) {
        return null;
    }

    @Override
    public String findOrganizeByid(Integer id) {
        return null;
    }

    @Override
    public String update(Integer id) {
        return null;
    }

    @Override
    public String querys(Organize organize) {
        return null;
    }
}

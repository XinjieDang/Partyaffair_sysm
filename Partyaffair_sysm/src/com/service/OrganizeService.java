package com.service;

import com.base.ResultInfo;
import com.pojo.Organize;
import com.pojo.User;
import org.springframework.ui.Model;

import java.util.List;

public interface OrganizeService {
    boolean findAll(Model model);
    ResultInfo add(Organize organize);
    ResultInfo delete(Integer or_id);
    boolean findOrganizeByid(Integer id,Model model);
    String querys(Organize organize);
}

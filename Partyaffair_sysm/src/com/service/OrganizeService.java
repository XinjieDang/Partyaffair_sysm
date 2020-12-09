package com.service;

import com.pojo.Organize;
import com.pojo.User;
import org.springframework.ui.Model;

import java.util.List;

public interface OrganizeService {
    boolean findAll(Model model);
    String add(Organize organize);
    String delete(Integer id);
    String findOrganizeByid(Integer id);
    String update(Integer id);
    String querys(Organize organize);
}

package com.service;

import com.base.ResultInfo;
import com.pojo.Apprecord;
import org.springframework.ui.Model;

public interface ApprecordService {
    boolean findAll(Model model);
    ResultInfo add(Apprecord apprecord);
    ResultInfo delete(Integer ask_id);
    boolean findApprecordByid(Integer ask_id,Model model);
    void querys(Apprecord apprecord, Model model);
    ResultInfo updateStatus(Integer ask_id);
    void findreject(Model model);
}

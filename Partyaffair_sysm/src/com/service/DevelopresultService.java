package com.service;

import com.base.ResultInfo;
import com.pojo.Apprecord;
import com.pojo.DevResult;
import com.pojo.DevResultDetail;
import com.pojo.Developresult;
import org.springframework.ui.Model;

public interface DevelopresultService {
    ResultInfo add(Developresult developresult);
    ResultInfo delete(Integer res_id);
    boolean findDevelopresultByid(Integer res_id,Model model);
    void querys(DevResult devResult, Model model);
    void queryResult(DevResult devResult,Model model);
    void querysDetail(Integer res_id,Model model);
}

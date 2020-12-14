package com.service.Impl;

import com.base.ResultInfo;
import com.dao.DevelopresultDao;
import com.pojo.DevResult;
import com.pojo.DevResultDetail;
import com.pojo.Developresult;
import com.service.DevelopresultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service

public class DevelopresultServiceImpl implements DevelopresultService {
    @Autowired
    private DevelopresultDao developresultDao;
    @Override
    public ResultInfo add(Developresult developresult) {
        return null;
    }

    @Override
    public ResultInfo delete(Integer res_id) {
        return null;
    }

    /**
     * 通过id 查询发展结果
     * @param res_id
     * @param model
     * @return
     */
    @Override
    public boolean findDevelopresultByid(Integer res_id, Model model) {
        return false;
    }

    @Override
    public void querys(DevResult devResult, Model model) {
    }

    @Override
    public void queryResult(DevResult devResult, Model model) {
        List<DevResult> devResults=developresultDao.queryResult(devResult);
        model.addAttribute("list",devResults);
    }

    /**
     * 查询发展详情
     * @param res_id
     * @param model
     */
    @Override
    public void querysDetail(Integer res_id, Model model) {
        DevResultDetail devResultDetail=developresultDao.querysDetail(res_id);
        model.addAttribute("devResultDetail",devResultDetail);

    }
}

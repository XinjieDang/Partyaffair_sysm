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
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        //修改
        if(developresult.getRes_id()!=null){
            result=developresultDao.update(developresult);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败!");
            }
        }
        else {//添加新记录
            result=developresultDao.add(developresult);
            if (result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败!");
            }
        }
        return resultInfo;
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

       Developresult developresult= developresultDao.findDevelopresultByid(res_id);
       if(developresult==null){
           return false;
       }
       model.addAttribute("developresult",developresult);
        return true;
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

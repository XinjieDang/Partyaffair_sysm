package com.service.Impl;

import com.base.ResultInfo;
import com.dao.ApprecordDao;
import com.dao.StudentDao;
import com.pojo.Apprecord;
import com.pojo.Student;
import com.service.ApprecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import java.util.ArrayList;
import java.util.List;
@Service
public class ApprecordServiceImpl implements ApprecordService {
    @Autowired
    private ApprecordDao apprecordDao;
    @Autowired
    private StudentDao studentDao;
    @Override
    public boolean findAll(Model model) {
        return false;
    }

    @Override
    public ResultInfo add(Apprecord apprecord) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        //apprecord!=null 修改，否则新增记录
        if(apprecord.getAsk_id()!=null){
            result=apprecordDao.update(apprecord);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败");
            }
        }
        else {//新增记录
            result=apprecordDao.add(apprecord);
            if(result<0){
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败");
            }

        }
        return resultInfo;
    }

    @Override
    public ResultInfo delete(Integer ask_id) {
        return null;
    }

    @Override
    public boolean findApprecordByid(Integer ask_id, Model model) {
        return false;
    }

    @Override
    public void querys(Apprecord apprecord, Model model) {
        //查询申请记录，若apprecord！=null则条件查询，否则查询所有
        //两个实体通过stu_id关联
        List<Apprecord> list=apprecordDao.querys(apprecord);
        int size=list.size();
        List<Apprecord> new_list=new ArrayList<>();
        for(int i=0;i<size;i++){
            //获取Apprecord记录的对象
            Apprecord data=list.get(i);
            System.out.println(data.getStu_id());
            //获取记录的Student对象
            Student student=studentDao.findStudentByid(data.getStu_id());
            //将当前在这个stu_id 对应的Student 对象赋值给Apprecord 里的Student属性
            data.setStudent(student);
            new_list.add(i,data);
        }
        model.addAttribute("list",new_list);
    }

    @Override
    public ResultInfo updateStatus(Integer ask_id) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        if(ask_id!=null){
            result=apprecordDao.updateStatus(ask_id);
        }
        if(result<0){
            resultInfo.setCode(500);
            resultInfo.setMsg("驳回失败！");
        }
        return resultInfo;
    }

    @Override
    public void findreject(Model model) {
        List<Apprecord>apprecords=apprecordDao.findreject();
        model.addAttribute("list",apprecords);
    }
}

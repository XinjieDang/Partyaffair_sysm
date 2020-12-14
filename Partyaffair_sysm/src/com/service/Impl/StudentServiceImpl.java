package com.service.Impl;

import com.base.ResultInfo;
import com.dao.OrganizeDao;
import com.dao.StudentDao;
import com.pojo.Apprecord;
import com.pojo.Organize;
import com.pojo.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;
@Service

public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private OrganizeDao organizeDao;
    @Override
    public boolean findAll(Model model) {
        return false;
    }

    @Override
    public ResultInfo add(Student student) {
        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        //id 不为空作修改
        if(student.getStu_id()!=null){
            result=studentDao.update(student);
            if(result<0){
                System.out.println("修改失败");
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }
        }
        else {//添加
            result=studentDao.add(student);
            if(result<0){
                System.out.println("添加失败！");
                resultInfo.setCode(500);
                resultInfo.setMsg("操作失败！");
            }

        }
        return resultInfo;
    }

    @Override
    public ResultInfo delete(Integer stu_id) {

        ResultInfo resultInfo=new ResultInfo();
        int result=0;
        if(stu_id!=null){
            result=studentDao.delete(stu_id);
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
    public boolean findStudentByid(Integer stu_id, Model model) {
        Student student = studentDao.findStudentByid(stu_id);
        if (student == null) {
            return false;
        }

        model.addAttribute("students", student);
        return true;
    }

    @Override
    public void querys(Student student, Model model) {
        //查询学生的信息，student!=null 条件查询，否则查询所有,
        //通过学生对象的or_id 赋值给组织对象的or_id,查到这个组织的名字
        List<Student> list=studentDao.querys(student);
        int size=list.size();
        List<Student> new_list=new ArrayList<>();
        for(int i=0;i<size;i++){
            Student data=list.get(i);
            System.out.println(data.getOr_id());
            Organize organize=organizeDao.findOrganizeByid(data.getOr_id());
            System.out.println(organize.getBranchame());
            data.setOrganize(organize);
            new_list.add(i,data);
        }
        //存到域
        model.addAttribute("list",new_list);
    }

    @Override
    public ResultInfo queryStudentName() {
        ResultInfo resultInfo=new ResultInfo();
        List<Student> list=studentDao.queryStudentName();
        if(list==null){
            resultInfo.setMsg("无记录！");
        }
        resultInfo.setResult(list);
        return resultInfo;
    }
}

package com.service;

import com.base.ResultInfo;
import com.pojo.Organize;
import com.pojo.Student;
import org.springframework.ui.Model;

public interface StudentService {
    boolean findAll(Model model);
    ResultInfo add(Student student);
    ResultInfo delete(Integer or_id);
    boolean findStudentByid(Integer id,Model model);
    void querys(Student Student, Model model);
    ResultInfo queryStudentName();
}

package com.dao;

import com.pojo.Organize;
import com.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface StudentDao {
    /**
     * 查询学生基本信息
     * @return
     */
    List<Student> findAll();


    /**
     * 添加学生
     * @param student
     * @return
     */
    int  add(Student student);

    /**
     *删除
     * @param stu_id
     * @return
     */
    int delete(Integer stu_id);

    /**
     * 查询单个记录
     * @param stu_id
     * @return
     */
    Student findStudentByid(Integer stu_id);

    /**
     * 更新
     * @param student
     * @return
     */
    int update(Student student);

    /**
     * 多条件查询
     * @param student
     * @return
     */

    List<Student> querys(Student student);
}

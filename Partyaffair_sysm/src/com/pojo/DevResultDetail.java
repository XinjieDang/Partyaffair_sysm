package com.pojo;
/*
  查询发展结果的bean 对象
 --查询发展结果详情
 --发展id，res_id 学生学号、stu_number 学生姓名、sname 发展结果、devresult
  审批人、approved 时间  cre_time

 */
public class DevResultDetail {
    private Integer res_id;
    private String stu_number;
    private String sname;

    @Override
    public String toString() {
        return "DevResultDetail{" +
                "res_id=" + res_id +
                ", stu_number='" + stu_number + '\'' +
                ", sname='" + sname + '\'' +
                ", devresult='" + devresult + '\'' +
                ", approved='" + approved + '\'' +
                ", cre_time='" + cre_time + '\'' +
                '}';
    }

    public Integer getRes_id() {
        return res_id;
    }

    public void setRes_id(Integer res_id) {
        this.res_id = res_id;
    }

    public String getStu_number() {
        return stu_number;
    }

    public void setStu_number(String stu_number) {
        this.stu_number = stu_number;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getDevresult() {
        return devresult;
    }

    public void setDevresult(String devresult) {
        this.devresult = devresult;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getCre_time() {
        return cre_time;
    }

    public void setCre_time(String cre_time) {
        this.cre_time = cre_time;
    }

    private String devresult;
    private String approved;
    private String cre_time;
}

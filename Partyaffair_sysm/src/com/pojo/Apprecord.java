package com.pojo;

public class Apprecord {
//    ask_id int (15) PRIMARY KEY NOT NULL auto_increment,
//    ask_number varchar(50) NOT NULL,
//    stu_id int (15) ,
//    current  varchar(50),
//    askdev varchar(50),
//    cre_time  date,
//    Reviewer varchar(50) NOT NULL,
//    askstatus varchar(50) NOT NULL
    private Integer ask_id;

    @Override
    public String toString() {
        return "Apprecord{" +
                "ask_id=" + ask_id +
                ", ask_number='" + ask_number + '\'' +
                ", stu_id=" + stu_id +
                ", student=" + student +
                ", currents='" + currents + '\'' +
                ", askdev='" + askdev + '\'' +
                ", cre_time='" + cre_time + '\'' +
                ", reviewer='" + reviewer + '\'' +
                ", askstatus='" + askstatus + '\'' +
                '}';
    }

    public Integer getAsk_id() {
        return ask_id;
    }

    public void setAsk_id(Integer ask_id) {
        this.ask_id = ask_id;
    }

    public String getAsk_number() {
        return ask_number;
    }

    public void setAsk_number(String ask_number) {
        this.ask_number = ask_number;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCurrents() {
        return currents;
    }

    public void setCurrents(String currents) {
        this.currents = currents;
    }

    public String getAskdev() {
        return askdev;
    }

    public void setAskdev(String askdev) {
        this.askdev = askdev;
    }

    public String getCre_time() {
        return cre_time;
    }

    public void setCre_time(String cre_time) {
        this.cre_time = cre_time;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public String getAskstatus() {
        return askstatus;
    }

    public void setAskstatus(String askstatus) {
        this.askstatus = askstatus;
    }

    private String ask_number;
    private Integer stu_id;
    private Student student;
    private String currents;//当前发展状态
    private String askdev;//申请发展状态
    private String cre_time;
    private String reviewer;//审批人
    private String askstatus;//申请状态


}

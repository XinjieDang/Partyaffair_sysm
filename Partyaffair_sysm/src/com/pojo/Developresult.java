package com.pojo;

public class Developresult {
    private Integer res_id;
    private Integer ask_id;
    private String apprecord;
    private String audit;//审核结果
    private  String devresult;//发展结果
    private String approved;//审批人

    @Override
    public String toString() {
        return "Developresult{" +
                "res_id=" + res_id +
                ", ask_id=" + ask_id +
                ", apprecord='" + apprecord + '\'' +
                ", audit='" + audit + '\'' +
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

    public Integer getAsk_id() {
        return ask_id;
    }

    public void setAsk_id(Integer ask_id) {
        this.ask_id = ask_id;
    }

    public String getApprecord() {
        return apprecord;
    }

    public void setApprecord(String apprecord) {
        this.apprecord = apprecord;
    }

    public String getAudit() {
        return audit;
    }

    public void setAudit(String audit) {
        this.audit = audit;
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

    private String cre_time;

}

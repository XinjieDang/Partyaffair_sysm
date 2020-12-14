package com.pojo;

/**
 * 查询的bean对象
 --发展id 申请编号、审核结果、发展结果、审批人、时间
 */
public class DevResult {
    private Integer res_id;
    private String ask_number;
    private String audit;
    private String devresult;
    private String approved;

    @Override
    public String toString() {
        return "DevResult{" +
                "res_id=" + res_id +
                ", ask_number='" + ask_number + '\'' +
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

    public String getAsk_number() {
        return ask_number;
    }

    public void setAsk_number(String ask_number) {
        this.ask_number = ask_number;
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

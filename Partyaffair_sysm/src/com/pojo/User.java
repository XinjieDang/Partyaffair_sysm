package com.pojo;

public class User {
    private Integer id;
    private String u_name;
    private String u_password;
    private String t_name;

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    private String u_email;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", u_name='" + u_name + '\'' +
                ", u_password='" + u_password + '\'' +
                ", t_name='" + t_name + '\'' +
                ", u_email='" + u_email + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }
}

package com.pojo;

public class Student {
    private Integer stu_id;
    private String stu_number;
    private String sname;

    @Override
    public String toString() {
        return "Student{" +
                "stu_id=" + stu_id +
                ", stu_number='" + stu_number + '\'' +
                ", sname='" + sname + '\'' +
                ", gender='" + gender + '\'' +
                ", nation='" + nation + '\'' +
                ", birthday='" + birthday + '\'' +
                ", idcard='" + idcard + '\'' +
                ", natives='" + natives + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", education='" + education + '\'' +
                ", familyorign='" + familyorign + '\'' +
                ", or_id=" + or_id +
                ", organize=" + organize +
                '}';
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getNatives() {
        return natives;
    }

    public void setNatives(String natives) {
        this.natives = natives;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getFamilyorign() {
        return familyorign;
    }

    public void setFamilyorign(String familyorign) {
        this.familyorign = familyorign;
    }

    public Integer getOr_id() {
        return or_id;
    }

    public void setOr_id(Integer or_id) {
        this.or_id = or_id;
    }

    public Organize getOrganize() {
        return organize;
    }

    public void setOrganize(Organize organize) {
        this.organize = organize;
    }

    private String gender;
    private String nation;
    private String birthday;
    private String idcard;
    private String natives;//籍贯
    private String address;
    private String phone;
    private String education;
    private String familyorign;
    private Integer or_id;
    private Organize organize;

}

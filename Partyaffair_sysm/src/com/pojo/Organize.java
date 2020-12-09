package com.pojo;

public class Organize {
//    or_id int (15) PRIMARY KEY NOT NULL auto_increment,
//    number varchar(50) NOT NULL,
//    branchame varchar(50) NOT NULL,
//    address  varchar(50) NOT NULL,
//    phone varchar(50) NOT NULL,
//    personliable varchar(50) NOT NULL
    private Integer or_id;
    private String number;
    private String branchame;

    @Override
    public String toString() {
        return "Organize{" +
                "or_id=" + or_id +
                ", number='" + number + '\'' +
                ", branchame='" + branchame + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", personliable='" + personliable + '\'' +
                '}';
    }

    public Integer getOr_id() {
        return or_id;
    }

    public void setOr_id(Integer or_id) {
        this.or_id = or_id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getBranchame() {
        return branchame;
    }

    public void setBranchame(String branchame) {
        this.branchame = branchame;
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

    public String getPersonliable() {
        return personliable;
    }

    public void setPersonliable(String personliable) {
        this.personliable = personliable;
    }

    private String address;
    private String phone;
    private String personliable;
}

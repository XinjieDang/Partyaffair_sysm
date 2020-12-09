package com.exception;

public class BussinessException extends RuntimeException{
    private Integer code=400;
    private String msg="业务异常！";

    public BussinessException(String msg) {
        this.msg = msg;
    }

    public BussinessException(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public BussinessException() {
    }
}

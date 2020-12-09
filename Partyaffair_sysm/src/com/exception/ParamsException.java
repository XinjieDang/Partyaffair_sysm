package com.exception;

public class ParamsException extends RuntimeException{
    private Integer code=500;
    private String msg="参数异常！";

    public ParamsException() {
    }

    public ParamsException(String msg) {
        this.msg = msg;
    }

    public ParamsException(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}

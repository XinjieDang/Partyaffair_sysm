<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>党务管理系统</title>
    <jsp:include page="common.jsp"></jsp:include>
</head>
<body style="background:url(${pageContext.request.contextPath}/public/images/login.jpg);">
<div class="login">
    <div class="form-data">
        <span style="color: red;font-size: 12px;text-align: center">${msg}</span>
        <div class="login-title">
            <h2>党务系统</h2>
        </div>
        <form class="all-data-login" action="${pageContext.request.contextPath}/user/login" id="commentForm">
            <div class="block-data">
                <div class="input-data">
                    <label>登录名:</label>
                    <input type="text" minlength="2"  name="u_name" id="u_name" placeholder="请输入账号" data-type="必填" error-pos="32" required>
                </div>
            </div>
            <div class="block-data">
                <div class="input-data">
                    <label>密码:</label>
                    <input class="input-pwd" maxlength="8" id="u_password" type="password" name="u_password" placeholder="请输入密码" data-type="必填" error-pos="32" required>
                </div>
            </div>
            <div class="block-data">
                <div class="input-data">
                    <label>记住我:</label>
                    <input type="checkbox" name="remember" id="remember">
                </div>
            </div>
            <div class="block-data-btn">
                <div class="input-data-btn">
                    <input type="submit" id="save" class="btn btn-info btn-sm" value="登录">
                    <input type="reset" value="重置" class="btn btn-info btn-sm">
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit(); }
    });
    $().ready(function() {
        $("#commentForm").validate();
    });
</script>

<%--避免提示信息乱码--%>
<script type="text/javascript">
    (function (factory) {
        if (typeof define === "function" && define.amd) {
            define(["jquery", "../jquery.validate"], factory);
        } else {
            factory(jQuery);
        }
    }(function ($) {

        $.extend($.validator.messages, {
            required: "这是必填字段",
            remote: "请修正此字段",
            email: "请输入有效的电子邮件地址",
            url: "请输入有效的网址",
            date: "请输入有效的日期",
            dateISO: "请输入有效的日期 (YYYY-MM-DD)",
            number: "请输入有效的数字",
            digits: "只能输入数字",
            creditcard: "请输入有效的信用卡号码",
            equalTo: "你的输入不相同",
            extension: "请输入有效的后缀",
            maxlength: $.validator.format("最多可以输入 {0} 个字符"),
            minlength: $.validator.format("最少要输入 {0} 个字符"),
            rangelength: $.validator.format("请输入长度在 {0} 到 {1} 之间的字符串"),
            range: $.validator.format("请输入范围在 {0} 到 {1} 之间的数值"),
            max: $.validator.format("请输入不大于 {0} 的数值"),
            min: $.validator.format("请输入不小于 {0} 的数值")
        });

    }));
</script>
</body>
</html>
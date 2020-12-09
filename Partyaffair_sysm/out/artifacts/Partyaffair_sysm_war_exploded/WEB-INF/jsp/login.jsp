<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>党务管理系统</title>
    <jsp:include page="common.jsp"></jsp:include>
</head>
<body>
<div class="login">
    <div class="form-data">
        <span style="color: red;font-size: 12px;text-align: center">${msg}</span>
        <div class="login-title">
            <h2>党务系统</h2>
        </div>
        <form class="all-data-login" action="${pageContext.request.contextPath}/user/login">
            <div class="block-data">
                <div class="input-data">
                    <label>登录名:</label>
                    <input type="text" name="u_name" id="u_name" placeholder="请输入账号" data-type="必填" error-pos="32">
                </div>
            </div>
            <div class="block-data">
                <div class="input-data">
                    <label>密码:</label>
                    <input class="input-pwd" id="u_password" type="password" name="u_password" placeholder="请输入密码" data-type="必填" error-pos="32">
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
                    <input type="submit" id="save" class="btn btn-info btn-sm">
                    <input type="reset" value="重置" class="btn btn-info btn-sm">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
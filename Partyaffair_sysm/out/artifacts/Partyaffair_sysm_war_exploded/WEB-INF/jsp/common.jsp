
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="prc" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<!-- 标题栏LOGO -->
<link rel="icon" type="image/x-icon" href="/favicon.ico">

<%--bootsrap样式--%>
<link rel="stylesheet" href="${prc}/public/css/bootstrap.css">

<!--jquery，不可修改版本-->
<script src="${prc}/public/javaex/pc/lib/jquery-1.7.2.min.js"></script>
<%--<script src="${prc}/public/js/jquery-1.12.4.min.js"></script>--%>

<%--默认自定义样式--%>
<link rel="stylesheet" href="${prc}/public/css/style.css">
<script src="${prc}/public/js/jquery.cookie.js"></script>


<link rel="stylesheet" href="${prc}/public/css/bootstrap-fileinput.css">
<script src="${prc}/public/js/bootstrap-fileinput.js"></script>
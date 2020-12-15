<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>党务管理系统</title>
    <jsp:include page="common.jsp"></jsp:include>
    <style type="text/css">
        .center-main{
            margin: 0 auto;
            width: 1100px;
        }
        .new-title{
            text-align: center;
            margin-top: 50px;

        }
        .new-title h4{
            font-size: 22px;
            font-weight: bold;
        }
        .author{
            text-align: right;
            font-size: 12px;
            font-weight: bold;
        }
        .ul-main{
            margin-top: 200px;
            background: #2e6da4;
        }
        .main-image{
            /*margin: 0 auto;*/
            width: 600px;
            height: 400px;
            display: inline-block;
            vertical-align:middle;
        }
        .new-images{
            margin: 0 auto;
            width: 1000px;
        }
        .ul-content{
            width: 800px;
            margin: 0 auto;
        }
        .news-p{
            text-align:justify;
        }
    </style>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>首页</span>
        <span class="divider">/</span>
        <span class="active">新闻中心</span>
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </div>
    <div class="well well-lg" style="margin-left: 30px;width:1300px;height: 30px;"><h3 style="text-align: center;margin-top: -10px;">新闻中心</h3></div>
    <div class="list">
       <div class="center-main">
           <c:forEach items="${list}" var="list">
               <ul class="ul-content">
                   <li>
                       <div class="new-title"><h4>${list.title}</h4></div>
                       <div class="author">
                           <span>作者：${list.author}</span>
                           <span>${list.cre_time}</span>
                       </div>
                       <div class="new-images">
                           <img class="main-image" src="${pageContext.request.contextPath}/upImages/${list.images}" alt="">
                       </div>
                       <div>
                           <p class="news-p">${list.content}</p>
                       </div>
                   </li>
               </ul>
           </c:forEach>
       </div>

    </div>
</div>
</body>
</html>

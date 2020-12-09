<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <jsp:include page="common.jsp"></jsp:include>
    <title>党务管理</title>
    <style>
    </style>
</head>
<!--顶部导航栏-->
<div class="nav">
<%--    左侧--%>
    <div class="nav-title">
        <h2 class="nav-name">党务管理系统</h2>
    </div>

    <!-- 右侧 -->
    <div class="nav-manu">
        <ul class="javaex-nav fr">
            <li class="nav-righ">
                <a href="javascript:;">欢迎您,${user.u_name}</a>
            </li>
            <li class="nav-righ"> <a href="javascript:;">退出当前账号</a></li>
        </ul>
    </div>
</div>
<!-- 主要内容 -->
<div class="main">
    <!--左侧导航-->
    <div class="side-left">
        <div class="side-maun">
            <ul id="side-menus">
                <li>
                    <a href="${pageContext.request.contextPath}/route/index">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/organize/organizelist" id="test2">组织管理</a>
                </li>
                <li>
                    <a href="#" id="test4">学生党员管理</a>
                    <ul  class="side-hide" id="side-bottom1">
                        <li><a href="${pageContext.request.contextPath}/student/studentlist">基本信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/userList">用户管理</a>
                    <ul  class="side-hide" id="side-bottom4">
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>

                    </ul>
                </li>

                <li>
                    <a href="#" id="test3">权限管理</a>
                    <ul  class="side-hide" id="side-bottom2">
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>
                        <li><a>首页二级菜单一</a></li>

                    </ul>
                </li>


            </ul>
        </div>
    </div>
    <!--右侧body 通过js 加载页面内容-->
<%--        <div id="page"></div>--%>
<%--    <jsp:include page="welcome.jsp"></jsp:include>--%>
</div>
<!-- 底部footer -->
<div class="footer">
    <footer>我是有底线的</footer>
</div>
<script>

    <%--// 控制页面载入--%>
    <%--function page(url) {--%>
    <%--    var req='${pageContext.request.contextPath}/';--%>
    <%--    req+=url;--%>
    <%--    $("#page").load(req);--%>
    <%--}--%>

    <%--$(document).ready(function(){--%>
    <%--    // 页面一加载, 读取登录用户信息--%>
    <%--    // get读取参数--%>
    <%--    $.get("/user/currUser", function(data){--%>
    <%--        var code = data.code;--%>
    <%--        var user = data.data;--%>
    <%--        if (code == 200) {--%>
    <%--            // 设置用户昵称--%>
    <%--            $("#nickname").text(user.nickname);--%>
    <%--        }--%>

    <%--        return false;--%>
    <%--    });--%>
        //设置将欢迎页面加载进首页
        <%--var indexreq='${pageContext.request.contextPath}/index/welcome';--%>
        <%--$("#page").load(indexreq);--%>

        //显示二级菜单控制，鼠标移入一级菜单显示二级菜单
        $("#side-menus li").bind("mouseover",function(){
            $(this).children("ul").show();
        });
        //离开隐藏二级菜单
        $("#side-menus li a").bind("mouseleave",function(){
            $("#side-menus li ul").hide();

        });
</script>
</html>
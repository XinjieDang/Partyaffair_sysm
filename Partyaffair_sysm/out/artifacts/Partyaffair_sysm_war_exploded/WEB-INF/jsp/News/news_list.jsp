<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>党务系统</title>
</head>
<body>
<jsp:include page="../index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>新闻管理</span>
        <span class="divider">/</span>
        <span class="active">新闻列表</span>
    </div>
    <div class="model-title">
        <span class="them">新闻列表</span>
    </div>
    <div class="list" style="width: 835px;">
        <div class="list-left">
            <!-- <input type="button" value="添加"> -->
            <div class="addbtn" style="float: left;">
                <a href="${pageContext.request.contextPath}/news/edit" class="btn btn-sm btn-primary" id="adduser">添加</a>
            </div>

            <div class="search" style="float: right;">
                <form action="${pageContext.request.contextPath}/news/newslist" method="post">
                    标题：<input type="text" id="title" name="title" width="500px;">
                    作者:<input type="text" id="author" name="author">
                    <input type="submit" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <table class="table table-hover table-bordered" id="sample_1">
            <thead>
            <tr>
                <th>新闻id</th>
                <th>标题</th>
                <th>作者</th>
                <th>时间</th>
                <th colspan="2" style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.news_id}</th>
                    <th>${list.title}</th>
                    <th>${list.author}</th>
                    <th>${list.cre_time}</th>
                    <th><a href="${pageContext.request.contextPath}/news/edit?news_id=${list.news_id}" class="btn btn-info btn-sm">编辑</a></th>
                    <th><button onclick="del(${list.news_id})" class="btn btn-danger btn-danger  btn-sm">删除</button></th>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script>
    //监听删除按钮事件
    function del(news_id){
        if(confirm("你真的要删除吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/news/delete",
                async:true,
                type:"POST",
                data:{
                    "news_id":news_id
                },
                success:function (data){
                    alert("测试数据发送成功！");
                    console.log(data.result);
                    var code=data.code;
                    var msg=data.msg;
                    if(code==200){
                        alert("操作成功！");
                        window.location.reload();//成功后刷新页面
                    }
                },
                error:function (){
                    alert("操作失败");
                }

            })
        }
    }
</script>
</body>

</html>

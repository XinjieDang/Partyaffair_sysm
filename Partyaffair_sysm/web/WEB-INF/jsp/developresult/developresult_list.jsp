<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>党务管理系统</title>
</head>
<body>
<jsp:include page="../index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>学生党员发展管理</span>
        <span class="divider">/</span>
        <span class="active">发展结果记录</span>
    </div>
    <div class="model-title">
        <span class="them">发展结果记录</span>
    </div>

    <div class="list" style="width: 835px;">
        <div class="list-left">
            <!-- <input type="button" value="添加"> -->
            <div class="addbtn" style="float: left;">
                <a href="${pageContext.request.contextPath}/developresult/edit" class="btn btn-sm btn-primary" id="adduser">添加</a>
            </div>
            <div class="search" style="float: right;">
                <form action="${pageContext.request.contextPath}/developresult/developresultlist" method="post">
                    审核结果：<input type="text" id="audit" name="audit" width="500px;">
                    时间:<input type="date" id="cre_time" name="cre_time">
                    <input type="submit" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <div class="table-condensed">
            <table class="table table-hover table-bordered text-nowrap" id="sample_1">
                <thead>
                <tr>
                    <th>发展id</th>
                    <th>申请编号</th>
                    <th>审核结果</th>
                    <th>发展结果</th>
                    <th>审批人</th>
                    <th>时间</th>
                    <th colspan="3" style="text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
                <c:forEach items="${list}" var="list">
                    <tr>
                        <th>${list.res_id}</th>
                        <th>${list.ask_number}</th>
                        <th>${list.audit}</th>
                        <th>${list.devresult}</th>
                        <th>${list.approved}</th>
                        <th>${list.cre_time}</th>
                        <th><a href="${pageContext.request.contextPath}/developresult/details?res_id=${list.res_id}" class="btn btn-info btn-sm">详情</a></th>
                        <th><a href="${pageContext.request.contextPath}/developresult/edit?res_id=${list.res_id}" class="btn btn-info btn-sm">审核</a></th>
                        <th><button onclick="del(${list.res_id})" class="btn btn-danger btn-danger  btn-sm">删除</button></th>
                    </tr>
                </c:forEach>
            </table>
        </div>
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
    function del(res_id){
        if(confirm("你真的要删除这个记录吗")){
            $.ajax({
                url:"${pageContext.request.contextPath}/developresult/del",
                async:true,
                type:"POST",
                data:{
                    "res_id":res_id
                },
                success:function (data){

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

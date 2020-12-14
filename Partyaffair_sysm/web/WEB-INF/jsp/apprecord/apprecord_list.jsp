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
        <span class="active">申请记录</span>
    </div>
    <div class="model-title">
        <span class="them">申请记录</span>
    </div>
    <div class="addbtn" style="float: left;margin-left:100px;">
        <a href="${pageContext.request.contextPath}/apprecord/reject" class="btn btn-sm btn-warning" id="addusers">查看被驳回记录</a>
    </div>
    <div class="list" style="width: 835px;">
        <div class="list-left">
            <!-- <input type="button" value="添加"> -->
            <div class="addbtn" style="float: left;">
                <a href="${pageContext.request.contextPath}/apprecord/edit" class="btn btn-sm btn-primary" id="adduser">添加</a>
            </div>
            <div class="search" style="float: right;">
                <form action="${pageContext.request.contextPath}/apprecord/apprecordlist" method="post">
                    申请编号：<input type="text" id="ask_number" name="ask_number" width="500px;">
                    当前发展状态:<input type="text" id="currents" name="currents">
                    <input type="submit" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <div class="table-condensed">
            <table class="table table-hover table-bordered text-nowrap" id="sample_1">
            <thead>
            <tr>
                <th>申请id</th>
                <th>申请编号</th>
                <th>学号</th>
                <th>学生姓名</th>
                <th>当前发展状态</th>
                <th>申请发展状态</th>
                <th>时间</th>
                <th>审核人</th>
                <th>申请状态</th>
                <th colspan="2" style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.ask_id}</th>
                    <th>${list.ask_number}</th>
                    <th>${list.student.stu_number}</th>
                    <th>${list.student.sname}</th>
                    <th>${list.currents}</th>
                    <th>${list.askdev}</th>
                    <th>${list.cre_time}</th>
                    <th>${list.reviewer}</th>
                    <th>${list.askstatus}</th>
                    <th><a href="${pageContext.request.contextPath}/apprecord/edit?ask_id=${list.ask_id}" class="btn btn-info btn-sm">编辑</a></th>
                    <th><button onclick="del(${list.ask_id})" class="btn btn-danger btn-danger  btn-sm">申请驳回</button></th>
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
    function del(ask_id){
        if(confirm("你真的要驳回这次申请吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/apprecord/updateStatus",
                async:true,
                type:"POST",
                data:{
                    "ask_id":ask_id
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

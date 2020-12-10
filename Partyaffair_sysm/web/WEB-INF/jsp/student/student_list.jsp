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
        <span>学生管理</span>
        <span class="divider">/</span>
        <span class="active">学生管理</span>
    </div>
    <div class="model-title">
        <span class="them">基本信息</span>
    </div>
    <div class="list" style="width: 835px;">
        <div class="list-left">
            <!-- <input type="button" value="添加"> -->
            <div class="addbtn" style="float: left;">
                <a href="${pageContext.request.contextPath}/student/edit" class="btn btn-sm btn-primary" id="adduser">添加</a>
            </div>

            <div class="search" style="float: right;">
                <form action="${pageContext.request.contextPath}/student/studentlist" method="post">
                    学号：<input type="text" id="stu_number" name="stu_number" width="500px;">
                    姓名:<input type="text" id="sname" name="sname">
                    地址：<input type="text" id="address" name="address">
                    <input type="submit" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <div class="table-condensed">
        <table class="table table-hover table-bordered text-nowrap" id="sample_1">
            <thead>
            <tr>
                <th>id</th>
                <th>学号</th>
                <th>姓名</th>
                <th>所属组织</th>
                <th>性别</th>
                <th>民族</th>
                <th>出生年月</th>
                <th>身份证号</th>
                <th>籍贯</th>
                <th>现居地</th>
                <th>联系电话</th>
                <th>学历</th>
                <th>家庭出身</th>
                <th colspan="2" style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.stu_id}</th>
                    <th>${list.stu_number}</th>
                    <th>${list.sname}</th>
                    <th>${list.organize.branchame}</th>
                    <th>${list.gender}</th>
                    <th>${list.nation}</th>
                    <th>${list.birthday}</th>
                    <th>${list.idcard}</th>
                    <th>${list.natives}</th>
                    <th>${list.address}</th>
                    <th>${list.phone}</th>
                    <th>${list.education}</th>
                    <th>${list.familyorign}</th>
                    <th><a href="${pageContext.request.contextPath}/student/edit?stu_id=${list.stu_id}" class="btn btn-info btn-sm">编辑</a></th>
                    <th><button onclick="del(${list.stu_id})" class="btn btn-danger btn-danger  btn-sm">删除</button></th>
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
    function del(stu_id){
        if(confirm("你真的要删除吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/student/delete",
                async:true,
                type:"POST",
                data:{
                    "stu_id":stu_id
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

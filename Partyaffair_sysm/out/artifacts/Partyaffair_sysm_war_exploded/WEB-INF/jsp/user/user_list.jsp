<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加管理员</title>
</head>
<body>
<jsp:include page="../index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>用户管理</span>
        <span class="divider">/</span>
        <span class="active">用户列表</span>
    </div>
    <div class="model-title">
        <span class="them">管理员列表</span>
    </div>
    <div class="list">
        <div class="list-left">
            <!-- <input type="button" value="添加"> -->
            <div class="addbtn" style="float: left;">
                <a href="${pageContext.request.contextPath}/route/edit" class="btn btn-sm btn-primary" id="adduser">添加</a>
            </div>

            <div class="search" style="float: right;">
                <form action="${pageContext.request.contextPath}/user/userList" method="post">
                    id：<input type="text" id="uid" name="id" width="500px;">
                    姓名：<input type="text" id="tname" name="t_name">
                    <input type="submit" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <table class="table table-hover table-bordered" id="sample_1">
            <thead>
            <tr>
                <th>id</th>
                <th>登录名</th>
                <th>真实姓名</th>
                <th>邮箱</th>
                <th colspan="2" style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
            <c:forEach items="${userlist}" var="list">
                <tr>
                    <th>${list.id}</th>
                    <th>${list.u_name}</th>
                    <th>${list.t_name}</th>
                    <th>${list.u_email}</th>
                    <th style="text-align: center;"><a href="${pageContext.request.contextPath}/route/edit?id=${list.id}" class="btn btn-info btn-sm">编辑</a></th>
                    <th style="text-align: center;"><button onclick="del(${list.id})" class="btn btn-danger btn-danger  btn-sm">删除</button></th>
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
    function del(id){
    if(confirm("你真的要删除吗？")){
      $.ajax({
          url:"${pageContext.request.contextPath}/user/delete",
          async:true,
          type:"POST",
          data:{
              "id":id
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

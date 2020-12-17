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
                <form action="">
                    id：<input type="text" id="uid" name="value1" width="500px;">
                    姓名：<input type="text" id="tname" name="value1">
                    <input type="button" id="search" value="搜索" class="btn btn-sm btn-primary">
                </form>
            </div>

        </div>
        <table class="table table-hover" id="sample_1">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all"/>
                </th>
                <th>id</th>
                <th>登录名</th>
                <th>真实姓名</th>
                <th>邮箱</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
            <%--            <c:forEach items="${userlist}" var="list">--%>
            <%--                <tr>--%>
            <%--                    <td>${list.id}</td>--%>
            <%--                    <td>${list.u_name}</td>--%>
            <%--                    <td>${list.t_name}</td>--%>
            <%--                    <td>${list.u_email}</td>--%>
            <%--                    <td><a href="${pageContext.request.contextPath}/route/edit?id=${list.id}" class="btn btn-info btn-sm">编辑</a></td>--%>
            <%--                    <td><button onclick="del(${list.id})" class="btn btn-danger btn-danger  btn-sm">删除</button></td>--%>
            <%--                </tr>--%>
            <%--            </c:forEach>--%>
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
    //页面加载 请求服务器返回数据，渲染到表格数据
    $(function(){
        // 获取搜索框输入内容
        var uid=$("#uid").val();
        var t_name=$("#tname").val();
        var json = {"id":uid,"t_name":t_name};
        alert("hhh")
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "${pageContext.request.contextPath}/user/querys",
            //数据，json字符串
            data : JSON.stringify(json),
            //请求成功
            success : function(data) {
                console.log(data);
                // 获取集合属性
                var code = data.code;
                var datas=data.result;
                //构造表格
                build_emps_table(datas);

                //拼接表格内容
                // var tableHtml="";
                // //
                // // var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                // //     .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                // // //为编辑按钮添加一个自定义的属性，来表示当前员工id
                // // editBtn.attr("edit-id",datas[i].id);
                // // var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                // //     .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                // // //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                // // delBtn.attr("del-id",datas[i].id);
                // // var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //
                // for(var i in datas){
                //
                //     var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                //         .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //     //为编辑按钮添加一个自定义的属性，来表示当前员工id
                //     editBtn.attr("edit-id",datas[i].id);
                //     var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                //         .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //     //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                //     delBtn.attr("del-id",datas[i].id);
                //     var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //     delBtn.attr("del-id",datas[i].id);
                //
                //
                //     tableHtml+="<tr>";
                //     tableHtml+=   "<td>"+datas[i].id+"</td>";
                //     tableHtml+=   "<td>"+datas[i].u_name+"</td>";
                //     tableHtml+=   "<td>"+datas[i].t_name+"</td>";
                //     tableHtml+=   "<td>"+datas[i].u_email+"</td>";
                //     tableHtml+=   "<td>"+editBtn+"</td>";
                //     tableHtml+=   "<td>"+delBtn+"</td>";
                //
                // }
                // //渲染表格
                // $("#aj_data").html(tableHtml);
                if (code == 200) {
                    // alert(data.result);
                }
                else {
                    var msg=data.msg;
                    alert(msg);
                }
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    })


    //动态创建一个表格
    function build_emps_table(data){
        //清空table表格
        $("#sample_1 tbody").empty();
        //分页
        // var emps = result.extend.pageInfo.list;
        var emps=data.result;
        $.each(emps,function(index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var uid = $("<td></td>").append(item.id);
            var uname = $("<td></td>").append(item.u_name);
            var tname = $("<td></td>").append(item.t_name);
            var email = $("<td></td>").append(item.u_email);
            //按钮
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",item.empId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(uid)
                .append(uname)
                .append(tname)
                .append(email)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }



    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }



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
                        alert("msg");
                        // window.location.reload();//成功后刷新页面
                    }
                },
                error:function (){
                    alert("操作失败");
                }

            })
        }
    }
    //监听搜索按钮事件
    <%--  $("#search").click(function() {--%>
    <%--      // 获取输入内容--%>
    <%--      var uid=$("#uid").val();--%>
    <%--      var t_name=$("#tname").val();--%>
    <%--      var json = {"id":uid,"t_name":t_name};--%>
    <%--      // 提交--%>
    <%--      $.ajax({--%>
    <%--          //请求方式--%>
    <%--          type : "POST",--%>
    <%--          //请求的媒体类型--%>
    <%--          contentType: "application/json;charset=UTF-8",--%>
    <%--          //请求地址--%>
    <%--          url : "${pageContext.request.contextPath}/user/querys",--%>
    <%--          //数据，json字符串--%>
    <%--          data : JSON.stringify(json),--%>
    <%--          //请求成功--%>
    <%--          success : function(data) {--%>
    <%--              console.log(data);--%>
    <%--              // 获取集合属性--%>
    <%--              var code = data.code;--%>
    <%--              var datas=data.result;--%>
    <%--              //拼接表格内容--%>
    <%--              var tableHtml="";--%>
    <%--              for(var i in datas){--%>
    <%--                  tableHtml+="<tr>";--%>
    <%--                  tableHtml+=   "<td>"+datas[i].id+"</td>";--%>
    <%--                  tableHtml+=   "<td>"+datas[i].u_name+"</td>";--%>
    <%--                  tableHtml+=   "<td>"+datas[i].t_name+"</td>";--%>
    <%--                  tableHtml+=   "<td>"+datas[i].u_email+"</td>";--%>
    <%--              }--%>
    <%--              //渲染表格--%>
    <%--              $("#aj_data").html(tableHtml);--%>
    <%--              if (code == 200) {--%>
    <%--                  alert(data);--%>
    <%--                  window.location.reload();//成功后刷新页面--%>

    <%--              }--%>
    <%--              else {--%>
    <%--                  var msg=data.msg;--%>
    <%--                  alert("msg");--%>
    <%--              }--%>

    <%--          },--%>
    <%--          //请求失败，包含具体的错误信息--%>
    <%--          error : function(e){--%>
    <%--              console.log(e.status);--%>
    <%--              console.log(e.responseText);--%>
    <%--          }--%>
    <%--      });--%>

    <%--  });--%>

</script>

</body>

</html>

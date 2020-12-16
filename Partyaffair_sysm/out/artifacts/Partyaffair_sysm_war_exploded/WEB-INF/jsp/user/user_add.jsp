
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>党务管理系统</title>
    <jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>用户管理</span>
        <span class="divider">/</span>
        <span class="active">添加/编辑管理员</span>
    </div>

    <div class="model-title">
        <span class="them">添加/编辑管理员</span>
    </div>
    <div class="list">
        <div class="list-left">
            <div class="data-form">
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="uid" name="id" value="${users.id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>登录名：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${users.u_name}" id="uname" class="form-control" id="inputEmail3" placeholder="登录名" name="u_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>登录密码</label>
                        <div class="col-sm-10">
                            <input type="password" value="${users.u_password}" id="upwd" class="form-control" id="test1" placeholder="登录密码" name="u_password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>确认登录密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="test2" placeholder="确认登录密码" name="u_password2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>真实姓名</label>
                        <div class="col-sm-10">
                            <input type="text" value="${users.t_name}" id="tname" class="form-control" id="tname" placeholder="真实姓名" name="t_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" value="${users.u_email}" id="uemail" class="form-control" placeholder="邮箱" name="u_email">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" id="save" class="btn btn btn-info">确定</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    $().ready(function() {
        $("#form1").validate({
            rules:{
                u_name:{
                    required:true,
                    maxlength:12,
                    minlength:6,
                },
                u_password:{
                    required:true,
                    maxlength:12,
                    minlength:5,
                },
                u_password2:{
                    required:true,
                    minlength:5,
                    maxlength:12,
                    equalTo: "#upwd"
                },
                t_name:{
                    required:true,
                },
                u_email:{
                    required:true,
                    email:true,
                }
            },
        });
    });

   //表单校验
    $.validator.setDefaults({
        submitHandler: function(form) {

            // 监听点击保存按钮事件
            $("#save").click(function() {
                // 获取输入内容
                var uid=$("#uid").val();
                var uname = $("#uname").val();
                var upwd=$('#upwd').val();
                var tname = $("#tname").val();
                var email = $("#uemail").val();

                // 表单数据
                var json = {"id":uid,"u_name":uname,"u_password":upwd,"t_name":tname,"u_email":email};

                // 提交
                // ajax 示例
                $.ajax({
                    //请求方式
                    type : "POST",
                    //请求的媒体类型
                    contentType: "application/json;charset=UTF-8",
                    //请求地址
                    url : "${pageContext.request.contextPath}/user/save",
                    //数据，json字符串
                    data : JSON.stringify(json),
                    //请求成功
                    success : function(data) {
                        console.log(data);
                        // 获取集合属性
                        var code = data.code;
                        if (code == 200) {
                            alert("操作成功！1秒后跳转列表页...")
                            // 跳转至列表
                            window.location.href="${pageContext.request.contextPath}/user/userList";

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

            });



        }
    });
</script>
</body>
<%--避免提示信息乱码--%>
<script type="text/javascript">
    (function (factory) {
        if (typeof define === "function" && define.amd) {
            define(["jquery", "../jquery.validate"], factory);
        } else {
            factory(jQuery);
        }
    }
    (function ($) {

        $.extend($.validator.messages, {
            required: "这是必填字段",
            remote: "请修正此字段",
            email: "请输入有效的电子邮件地址",
            url: "请输入有效的网址",
            date: "请输入有效的日期",
            dateISO: "请输入有效的日期 (YYYY-MM-DD)",
            number: "请输入有效的数字",
            digits: "只能输入数字",
            creditcard: "请输入有效的信用卡号码",
            equalTo: "你的输入不相同",
            extension: "请输入有效的后缀",
            maxlength: $.validator.format("最多可以输入 {0} 个字符"),
            minlength: $.validator.format("最少要输入 {0} 个字符"),
            rangelength: $.validator.format("请输入长度在 {0} 到 {1} 之间的字符串"),
            range: $.validator.format("请输入范围在 {0} 到 {1} 之间的数值"),
            max: $.validator.format("请输入不大于 {0} 的数值"),
            min: $.validator.format("请输入不小于 {0} 的数值")
        });

    }));
</script>
</html>

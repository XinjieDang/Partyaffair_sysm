
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>党务系统</title>
    <jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../index.jsp"></jsp:include>
<div class="side-right">
    <div style="margin-top: 10px;margin-left: 30px;font-size: 15px;font-weight: bold;">
        <span>组织管理</span>
        <span class="divider">/</span>
        <span class="active">添加/编辑组织</span>
    </div>
    <div class="model-title">
        <span class="them">添加/编辑组织</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal">
                    <input type="hidden" id="or_id" name="or_id" value="${organizers.or_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>组织编号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.number}" id="number" maxlength="12" class="form-control" id="number" placeholder="组织编号" name="number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>支部名称：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.branchame}" id="branchame" class="form-control" id="inputEmail3" placeholder="支部名称" name="branchame">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.address}" id="address" class="form-control" id="address" placeholder="联系地址" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>联系电话</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.phone}" maxlength="11" class="form-control" id="phone" placeholder="联系电话" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>负责人</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.personliable}" id="personliable" class="form-control"placeholder="负责人" name="personliable">
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
        //验证表单数据
        $("#form1").validate({
            rules:{
                number:{
                    required:true,
                    maxlength:12,
                    digits:true,
                    minlength:6,
                },
                branchame:{
                    required:true,
                },
                address:{
                    required:true,
                },
                phone:{
                    required:true,
                    isMobile:true,
                },
                personliable:{
                    required:true,
                }
            },
        });

         //手机号码验证
        jQuery.validator.addMethod("isMobile", function(value, element) {
            var length = value.length;
            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写手机号码");

    });
    $.validator.setDefaults({
        submitHandler: function(form) {
            // 监听点击保存按钮事件
            $("#save").click(function() {
                // 获取输入内容
                var form_data=$('#form1').serialize();
                // ajax 示例
                $.ajax({
                    //请求方式
                    type : "POST",
                    //请求的媒体类型
                    dataType:"json",
                    //请求地址
                    url : "${pageContext.request.contextPath}/organize/save",
                    //数据，json字符串
                    data : form_data,
                    //请求成功
                    success : function(data) {
                        // alert("测试数据提交！")
                        console.log(data);
                        // 获取集合属性
                        var code = data.code;
                        if (code == 200) {
                            alert("操作成功！1秒后跳转列表页...")
                            // 跳转至列表
                            setTimeout(function(){window.location.href="${pageContext.request.contextPath}/organize/organizelist";},1500)

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

<%--避免提示信息乱码--%>
<script type="text/javascript">
    (function (factory) {
        if (typeof define === "function" && define.amd) {
            define(["jquery", "../jquery.validate"], factory);
        } else {
            factory(jQuery);
        }
    }(function ($) {

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
</body>
</html>

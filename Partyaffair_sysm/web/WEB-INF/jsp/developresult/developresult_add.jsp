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
        <span>党员发展管理</span>
        <span class="divider">/</span>
        <span class="active">添加/编辑发展结果记录</span>
    </div>
    <div class="model-title">
        <span class="them">添加/编辑发展结果记录</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal">
                    <input type="hidden" id="res_id" name="res_id" value="${developresult.res_id}">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>申请编号：</label>
                        <div class="col-sm-10">
                            <select id="select-student" name="ask_id" id="ask_id" class="form-control">
                                <option value="1">--选择申请编号--</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>审核结果：</label>

                        <div class="col-sm-10">
                            <select name="audit" id="audit" class="form-control">
                                <option value="">选择审核结果</option>
                                <option value="同意" ${developresult.audit eq "同意"?"selected":"" }>同意</option>
                                <option value="不同意" ${developresult.audit eq "不同意"?"selected":"" }>不同意</option>

                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>发展结果：</label>

                        <div class="col-sm-10">
                            <select name="devresult" id="devresult" class="form-control">
                                <option value="">选择发展结果</option>
                                <option value="积极分子" ${developresult.devresult eq "积极分子"?"selected":"" }>积极分子</option>
                                <option value="发展对象" ${developresult.devresult eq "发展对象"?"selected":"" }>发展对象</option>
                                <option value="预备党员" ${developresult.devresult eq "预备党员"?"selected":"" }>预备党员</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>审批人：</label>

                        <div class="col-sm-10">
                            <select name="approved" id="approved" class="form-control">
                                <option value="">--选择审批人--</option>
                                <option value="吴老师" ${developresult.approved eq "吴老师"?"selected":"" }>吴老师</option>
                                <option value="张老师" ${developresult.approved eq "张老师"?"selected":"" }>张老师</option>
                                <option value="朱老师" ${developresult.approved eq "朱老师"?"selected":"" }>朱老师</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                            <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>审核日期：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${developresult.cre_time}" id="cre_time" class="form-control"
                                   placeholder="审核日期" name="cre_time">
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

    //页面一加载，获取申请编号，绑定到下拉框
    $(function () {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/developresult/getask_number",
            success: function (data) {
                // alert("测试发送数据成功！")
                console.log(data.result);
                var data = data.result;
                $.each(data, function (index, item) {
                    $("#select-student").append(
                        "<option value=" + item.ask_id + ">" + item.ask_number + "</option>"
                    );
                });
            },

        });
        //表单验证
        $("#form1").validate({
            rules:{
                ask_id:{
                    required:true,
                },
                audit:{
                    required:true,
                },
                devresult:{
                    required:true,
                },
                approved:{
                    required:true,

                },
                cre_time:{
                    required:true,
                }
            },
        });

    });

    $.validator.setDefaults({
        submitHandler: function(form)
        {
            // 监听点击保存按钮事件
            $("#save").click(function () {
                // 获取输入内容
                var form_data = $('#form1').serialize();
                // ajax 示例
                $.ajax({
                    //请求方式
                    type: "POST",
                    //请求的媒体类型
                    dataType: "json",
                    //请求地址
                    url: "${pageContext.request.contextPath}/developresult/save",
                    //数据，json字符串
                    data: form_data,
                    //请求成功
                    success: function (data) {
                        // alert("发送数据成功")
                        console.log(data);
                        // 获取集合属性
                        var code = data.code;
                        if (code == 200) {
                            alert("操作成功！")
                            // 跳转至列表
                            window.location.href = "${pageContext.request.contextPath}/developresult/developresultlist";
                        } else {
                            var msg = data.msg;
                            alert(msg);
                        }

                    },
                    //请求失败，包含具体的错误信息
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                    }
                });

            });

        }
    })
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

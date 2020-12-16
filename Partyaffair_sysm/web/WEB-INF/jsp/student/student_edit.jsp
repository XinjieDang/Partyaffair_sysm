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
        <span>学生党员管理</span>
        <span class="divider">/</span>
        <span class="active">添加/编辑学生基本信息</span>
    </div>
    <div class="model-title">
        <span class="them">添加/编辑学生基本</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="stu_id" name="stu_id" value="${students.stu_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>学生学号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.stu_number}" id="stu_number" class="form-control"
                                   id="stu_number" placeholder="学生学号" name="stu_number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>学生姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.sname}" id="sname" class="form-control"
                                   id="inputEmail3" placeholder="学生姓名" name="sname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>性别：</label>
                        <div class="col-sm-10">
                            <input type="radio" name="gender" id="gender" value="男" ${students.gender eq"男"? select:""}
                                   checked="checked">男
                            <input type="radio" name="gender" id="gender2" value="女" ${students.gender eq"女"? select:""}
                                   checked="checked">女
                        </div>
                    </div>

                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>民族：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.nation}" class="form-control" id="nation"
                                   placeholder="民族" name="nation">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>生日：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${students.birthday}" id="birthday" class="form-control"
                                   placeholder="生日" name="birthday">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>身份证号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.idcard}" id="idcard" class="form-control"
                                   placeholder="身份证号" name="idcard">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>现居地：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.natives}" id="natives" class="form-control"
                                   placeholder="现居地" name="natives">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>籍贯：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.address}" id="address" class="form-control"
                                   placeholder="籍贯" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>联系电话：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.phone}" id="phone" class="form-control"
                                   placeholder="联系电话" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font color="red">*</font>学历：</label>

                        <div class="col-sm-10">
                            <select name="education" id="education" class="form-control">
                                <option value="">选择学历</option>
                                <option value="博士" ${students.education eq "博士"?"selected":"" }>博士</option>
                                <option value="硕士" ${students.education eq "硕士"?"selected":"" }>硕士</option>
                                <option value="本科" ${students.education eq "本科"?"selected":"" }>本科</option>
                                <option value="专科" ${students.education eq "专科"?"selected":"" }>专科</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>家庭出身：</label>

                        <div class="col-sm-10">
                            <select name="familyorign" id="familyorign" class="form-control">
                                <option value="">选择家庭出身</option>
                                <option value="工员" ${students.familyorign eq "工员"?"selected":"" }>工员</option>
                                <option value="干部" ${students.familyorign eq "干部"?"selected":"" }>干部</option>
                                <option value="职员" ${students.familyorign eq "职员"?"selected":"" }>职员</option>
                                <option value="自由职业" ${students.familyorign eq "自由职业"?"selected":"" }>自由职业</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>所属组织：</label>
                        <div class="col-sm-10">
                            <select id="select-organize" name="or_id" id="or_id" class="form-control">
                                <option value="1">--选择所属组织--</option>
                            </select>
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
    //页面一加载，获取所属组织数据，绑定到下拉框
    $(function () {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/student/getOrganize",
            success: function (data) {
                // alert("测试发送数据成功！")
                console.log(data.result);
                var data = data.result;
                $.each(data, function (index, item) {
                    $("#select-organize").append(
                        "<option value=" + item.or_id + ">" + item.branchame + "</option>"
                    );
                });
            },

        });

        //验证表单数据
        $("#form1").validate({
            rules: {
                stu_number: {
                    required: true,
                    maxlength: 12,
                    digits: true,
                    minlength: 6,
                },
                sname: {
                    required: true,
                    maxlength: 12,
                },
                gender: {
                    required: true,
                },
                nation: {
                    required: true,

                },
                birthday: {
                    required: true,
                },
                idcard: {
                    required: true,
                    minlength: 18,
                },
                natives: {
                    required: true,
                },
                address: {
                    required: true,
                },
                phone: {
                    required: true,
                    isMobile: true,
                },
                education: {
                    required: true,
                },
                familyorign: {
                    required: true,
                },
                or_id: {
                    required: true,
                }

            },
        });
        //手机号码验证
        jQuery.validator.addMethod("isMobile", function (value, element) {
            var length = value.length;
            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写手机号码");


    });

    $.validator.setDefaults({
        submitHandler: function (form) {
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
                    url: "${pageContext.request.contextPath}/student/save",
                    //数据，json字符串
                    data: form_data,
                    //请求成功
                    success: function (data) {
                        console.log(data);
                        // 获取集合属性
                        var code = data.code;
                        if (code == 200) {
                            alert("操作成功！")
                            // 跳转至列表
                            window.location.href = "${pageContext.request.contextPath}/student/studentlist";
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

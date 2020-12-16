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
        <span>新闻管理</span>
        <span class="divider">/</span>
        <span class="active">添加/编辑新闻记录</span>
    </div>
    <div class="model-title">
        <span class="them">添加/编辑新闻记录</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal">
                    <input type="hidden" id="news_id" name="news_id" value="${news.news_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>新闻标题：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${news.title}" id="title" class="form-control"
                                   id="title" placeholder="新闻标题" name="title" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>新闻作者：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${news.author}" id="author" class="form-control"
                                   id="author" placeholder="新闻作者" name="author" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label"><font
                                color="red">*</font>编辑时间：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${news.cre_time}" id="cre_time" class="form-control"
                                   placeholder="编辑时间" name="cre_time" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>编辑内容：</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="content" name="content" rows="3"
                                      required>${news.content}</textarea>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label class="control-label col-md-3">新闻图片</label>
                        <div class="col-md-9">
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="fileinput-preview thumbnail" data-trigger="fileinput"
                                     style="width:600px; height:300px;"><img id="pictureShow"
                                                                             src="${pageContext.request.contextPath}/upImages/${news.images}">
                                </div>
                                <div>
                                    <span class="btn red btn-outline btn-file">
                                       <span class="fileinput-new"> 选择图片 </span>
                                       <span class="fileinput-exists"> 更换 </span>

                                       <input type="file" id="picture" name="picture">
                                    </span>
                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">
                                        取消 </a>
                                </div>
                            </div>

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


    $().ready(function () {
        $("#form1").validate();
    });


    //获取文件名字
    function get_file() {
        var picture = $('#picture').prop('files');
        var pictureForm = new FormData();
        pictureForm.append('picture', picture[0]);
        var fileName = "";
        console.log(picture[0])
        console.log(pictureForm)
        $.ajax({
            //请求方式
            type: "POST",
            async: false,
            //请求地址
            url: "${pageContext.request.contextPath}/news/fileUp",
            //数据，json字符串
            dataType: "text",
            contentType: false,
            processData: false,
            data: pictureForm,
            //请求成功
            success: function (data) {
                console.log(data)
                fileName = data;

            },
        });
        return fileName;
    }


    $.validator.setDefaults({
        submitHandler: function (form) {
            // 监听点击保存按钮事件
            $("#save").click(function () {
                // 获取输入内容
                //获取字段值
                var news_id = $("#news_id").val();
                var title = $("#title").val();
                var author = $("#author").val();
                var cre_time = $("#cre_time").val();
                var content = $("#content").val();
                var picture = get_file();
                console.log(picture);
                // alert(picture);
                // 表单数据
                var json = {
                    "news_id": news_id,
                    "title": title,
                    "author": author,
                    "cre_time": cre_time,
                    "content": content,
                    "images": picture
                };
                // 提交
                // ajax 示例
                $.ajax({
                    //请求方式
                    type: "POST",
                    async: false,
                    //请求的媒体类型
                    contentType: "application/json;charset=UTF-8",
                    //请求地址
                    url: "${pageContext.request.contextPath}/news/save",
                    //数据，json字符串
                    data: JSON.stringify(json),
                    //请求成功
                    success: function (data) {
                        console.log(data);
                        // 获取集合属性
                        var code = data.code;
                        if (code == 200) {
                            alert("操作成功")
                            // 跳转至列表
                            window.location.href = "${pageContext.request.contextPath}/news/newslist";

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

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
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="news_id" name="news_id" value="${news.news_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>新闻标题：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${news.title}" id="title" class="form-control"
                                   id="title" placeholder="新闻标题" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>新闻作者：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${news.author}" id="author" class="form-control"
                                   id="author" placeholder="新闻作者" name="author">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>编辑时间：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${news.cre_time}" id="cre_time" class="form-control"
                                   id="cre_time" placeholder="编辑时间" name="cre_time">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><font color="red">*</font>编辑内容：</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" value="${news.content}" id="content" name="content" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label class="control-label col-md-3">新闻图片</label>
                        <div class="col-md-9">
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="fileinput-preview thumbnail" data-trigger="fileinput"
                                     style="width:600px; height:300px;"><img id="pictureShow" src="upImages/001.jpg"></div>
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
                            <button type="button" id="save" class="btn btn btn-info">确定</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    //获取文件名字
    function get_file(){
        var picture=$('#picture').prop('files');
        var pictureForm=new FormData();
        pictureForm.append('picture',picture[0]);
        var fileName="";
        console.log(picture[0])
        console.log(pictureForm)

        $.ajax({
            //请求方式
            type : "POST",
            async:false,
            //请求地址
            url : "${pageContext.request.contextPath}/news/fileUp",
            //数据，json字符串
            dataType:"text",
            contentType: false,
            processData:false,
            data:pictureForm,
            //请求成功
            success : function(data) {
                console.log(data)
                alert("测试23424！")
                fileName=data;

            },
        });
        return fileName;
    }
    // 监听点击保存按钮事件
    $("#save").click(function() {
        // 获取输入内容
        //获取字段值
        var news_id=$("#news_id").val();
        var title=$("#title").val();
        var author=$("#author").val();
        var cre_time=$("#cre_time").val();
        var content=$("#content").val();
        var  picture=get_file();
        console.log(picture);
        alert(picture);
        // 表单数据
        var json = {"news_id":news_id,"title":title,"author":author,"cre_time":cre_time,"content":content,"picture":picture};
        // 提交
        // ajax 示例
        <%--$.ajax({--%>
        <%--    //请求方式--%>
        <%--    type : "POST",--%>
        <%--    //请求的媒体类型--%>
        <%--    contentType: "application/json;charset=UTF-8",--%>
        <%--    //请求地址--%>
        <%--    url : "${pageContext.request.contextPath}/user/save",--%>
        <%--    //数据，json字符串--%>
        <%--    data : JSON.stringify(json),--%>
        <%--    //请求成功--%>
        <%--    success : function(data) {--%>
        <%--        console.log(data);--%>
        <%--        // 获取集合属性--%>
        <%--        var code = data.code;--%>
        <%--        if (code == 200) {--%>
        <%--            alert("操作成功！1秒后跳转列表页...")--%>
        <%--            // 跳转至列表--%>
        <%--            setTimeout(function(){window.location.href="${pageContext.request.contextPath}/user/userList";},1500)--%>

        <%--        }--%>
        <%--        else {--%>
        <%--            var msg=data.msg;--%>
        <%--            alert(msg);--%>
        <%--        }--%>

        <%--    },--%>
        <%--    //请求失败，包含具体的错误信息--%>
        <%--    error : function(e){--%>
        <%--        console.log(e.status);--%>
        <%--        console.log(e.responseText);--%>
        <%--    }--%>
        <%--});--%>

    });
</script>
</body>
</html>

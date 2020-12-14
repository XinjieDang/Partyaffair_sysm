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
        <span class="active">添加/编辑申请记录</span>
    </div>
    <div class="model-title">
        <span class="them">添加/编辑申请记录</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="ask_id" name="stu_id" value="${apprecord.ask_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">申请编号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${apprecord.ask_number}" id="stu_number" class="form-control"
                                   id="ask_number" placeholder="申请编号" name="ask_number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">学生姓名：</label>
                        <div class="col-sm-10">
                            <select id="select-student" name="stu_id" id="stu_id" class="form-control">
                                <option value="1">--选择学生--</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">当前发展状态：</label>

                        <div class="col-sm-10">
                            <select name="currents" id="currents" class="form-control">
                                <option value="">选择发展状态</option>
                                <option value="积极分子" ${apprecord.currents eq "积极分子"?"selected":"" }>积极分子</option>
                                <option value="发展对象" ${apprecord.currents eq "发展对象"?"selected":"" }>发展对象</option>
                                <option value="预备党员" ${apprecord.currents eq "预备党员"?"selected":"" }>预备党员</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">申请发展状态：</label>

                        <div class="col-sm-10">
                            <select name="askdev" id="askdev" class="form-control">
                                <option value="">选择发展状态</option>
                                <option value="积极分子" ${apprecord.askdev eq "积极分子"?"selected":"" }>积极分子</option>
                                <option value="发展对象" ${apprecord.askdev eq "发展对象"?"selected":"" }>发展对象</option>
                                <option value="预备党员" ${apprecord.askdev eq "预备党员"?"selected":"" }>预备党员</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">申请日期：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${apprecord.cre_time}" id="cre_time" class="form-control"
                                   placeholder="申请日期" name="cre_time">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">审核人：</label>

                        <div class="col-sm-10">
                            <select name="reviewer" id="reviewer" class="form-control">
                                <option value="">--选择审核人--</option>
                                <option value="王老师" ${apprecord.askdev eq "王老师"?"selected":"" }>王老师</option>
                                <option value="李老师" ${apprecord.askdev eq "李老师"?"selected":"" }>李老师</option>
                                <option value="梁老师" ${apprecord.askdev eq "梁老师"?"selected":"" }>梁老师</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label">申请状态：</label>
                        <div class="col-sm-10">
                            <select name="askstatus" id="askstatus" class="form-control">
                                <option value="">--选择申请状态--</option>
                                <option value="审核中" ${apprecord.askstatus eq "审核中"?"selected":"" }>审核中</option>
                                <option value="已通过" ${apprecord.askstatus eq "已通过"?"selected":"" }>已通过</option>
                                <option value="不通过" ${apprecord.askstatus eq "不通过"?"selected":"" }>不通过</option>
                            </select>
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

    //页面一加载，获取所属组织数据，绑定到下拉框
    $(function () {


        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/apprecord/getStudent",
            success: function (data) {
                // alert("测试发送数据成功！")
                console.log(data.result);
                var data = data.result;
                $.each(data, function (index, item) {
                    $("#select-student").append(
                        "<option value=" + item.stu_id + ">" + item.sname + "</option>"
                    );
                });
            },

        });

        $('#select-student').val("3")

    });


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
            url: "${pageContext.request.contextPath}/apprecord/save",
            //数据，json字符串
            data: form_data,
            //请求成功
            success: function (data) {
                alert("发送数据成功qq")
                console.log(data);
                // 获取集合属性
                var code = data.code;
                if (code == 200) {
                    alert("操作成功！")
                    // 跳转至列表
                    window.location.href = "${pageContext.request.contextPath}/apprecord/apprecordlist";
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
</script>
</body>
</html>

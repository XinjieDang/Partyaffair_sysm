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
                        <label for="inputEmail3" class="col-sm-2 control-label">学生学号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.stu_number}" id="stu_number" class="form-control"
                                   id="stu_number" placeholder="学生学号" name="stu_number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">学生姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.sname}" id="sname" class="form-control"
                                   id="inputEmail3" placeholder="学生姓名" name="sname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">
                            <input type="radio" name="gender" id="gender" value="男" ${students.gender eq"男"? select:""}
                                   checked="checked">男
                            <input type="radio" name="gender" id="gender2" value="女" ${students.gender eq"女"? select:""}
                                   checked="checked">女
                        </div>
                    </div>

                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label">民族：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.nation}" class="form-control" id="nation"
                                   placeholder="民族" name="nation">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">生日：</label>
                        <div class="col-sm-10">
                            <input type="date" value="${students.birthday}" id="birthday" class="form-control"
                                   placeholder="生日" name="birthday">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">身份证号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.idcard}" id="idcard" class="form-control"
                                   placeholder="身份证号" name="idcard">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">现居地：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.natives}" id="natives" class="form-control"
                                   placeholder="现居地" name="natives">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">籍贯：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.address}" id="address" class="form-control"
                                   placeholder="籍贯" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">联系电话：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${students.phone}" id="phone" class="form-control"
                                   placeholder="联系电话" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">学历：</label>

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
                        <label for="inputPassword3" class="col-sm-2 control-label">家庭出身：</label>

                        <div class="col-sm-10">
                            <select name="familyorign" id="familyorign" class="form-control">
                                <option value="">选择家庭出身</option>
                                <option value="工员" ${stas.education eq "工员"?"selected":"" }>工员</option>
                                <option value="干部" ${stas.education eq "干部"?"selected":"" }>干部</option>
                                <option value="职员" ${stas.education eq "职员"?"selected":"" }>职员</option>
                                <option value="自由职业" ${stas.education eq "自由职业"?"selected":"" }>自由职业</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">所属组织：</label>
                        <div class="col-sm-10">
                            <select id="select-organize" name="or_id" id="or_id" class="form-control">
                                <option value="1">--选择所属组织--</option>
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
    $(function (){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/student/getOrganize",
            success:function(data){
                // alert("测试发送数据成功！")
                console.log(data.result);
                var data=data.result;
                $.each(data,function (index,item){
                    $("#select-organize").append(
                        "<option value="+item.or_id+">"+item.branchame+"</option>"
                    );
                });
            },

        });
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
</script>
</body>
</html>

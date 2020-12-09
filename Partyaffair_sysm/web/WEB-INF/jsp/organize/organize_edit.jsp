
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
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="or_id" name="or_id" value="${organizers.or_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">组织编号：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.number}" id="number" class="form-control" id="number" placeholder="组织编号" name="number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">支部名称：</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.branchame}" id="branchame" class="form-control" id="inputEmail3" placeholder="支部名称" name="branchame">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.address}" id="address" class="form-control" id="address" placeholder="联系地址" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="inputpassword3"--%>
                        <label for="inputPassword3" class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.phone}" class="form-control" id="phone" placeholder="联系电话" name="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-10">
                            <input type="text" value="${organizers.personliable}" id="personliable" class="form-control"placeholder="负责人" name="personliable">
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
                alert("测试数据提交！")
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
</script>
</body>
</html>

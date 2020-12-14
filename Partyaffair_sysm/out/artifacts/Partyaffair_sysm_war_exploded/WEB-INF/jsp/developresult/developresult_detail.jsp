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
        <span class="active">发展结果记录</span>
    </div>
    <div class="model-title">
        <span class="them">发展结果记录详情</span>
    </div>
    <div class="list">
        <div class="list-left" style="width: 835px;">
            <div class="data-form">
                <form id="form1" class="form-horizontal" method="post">
                    <input type="hidden" id="ask_id" readonly="readonly" name="stu_id" value="${apprecord.ask_id}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">发展id：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly="readonly" value="${devResultDetail.res_id}" id="res_id" class="form-control"
                                   id="res_id" placeholder="发展id" name="res_id">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">学生学号：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly="readonly" value="${devResultDetail.stu_number}" id="stu_number" class="form-control"
                                   id="stu_number" placeholder="学生学号" name="stu_number">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">学生姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly="readonly" value="${devResultDetail.sname}" id="sname" class="form-control"
                                   id="sname" placeholder="学生姓名" name="sname">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">发展结果：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly="readonly" value="${devResultDetail.devresult}" id="devresult" class="form-control"
                                   id="devresult" placeholder="发展结果" name="devresult">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">审批人：</label>
                        <div class="col-sm-10">
                            <input type="text" readonly="readonly" value="${devResultDetail.approved}" id="approved" class="form-control"
                                   id="approved" placeholder="审批人" name="approved">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">日期：</label>
                        <div class="col-sm-10">
                            <input type="date" readonly="readonly" value="${devResultDetail.cre_time}" id="cre_time" class="form-control"
                                   placeholder="申请日期" name="cre_time">
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
</body>
</html>

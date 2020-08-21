<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <![endif]-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
</head>
<body>
<div class="check-div">
    <div class="col-xs-4">
        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addChar">添加权限</button>
    </div>
</div>
<div style="overflow-y:auto;width:100%;height: 560px;border-top: 1px solid blue">
    <table class="table table-striped">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>类别</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        <c:forEach var="t" items="${tag}">
            <tr>
                <td>${t.id}</td>
                <td>${t.name}</td>
                <td>${t.category}</td>
                <td>${t.descn}</td>
                <td>
                    <button class="btn btn-success btn-xs upda" data-toggle="modal"
                            id="${t.category}" name="${t.name}"  value="${t.id}" content="${t.descn} "
                            data-target="#changeChar">修改</button>
                    <button class="btn btn-danger btn-xs del" data-toggle="modal" name="${t.id}" data-target="#deleteChar">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="modal fade" id="addChar" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加标签</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal">
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal">
                                    <div class="form-group ">
                                        <label for="name" class="col-xs-3 control-label">id：</label>
                                        <div class="col-xs-6 ">
                                            <input type="text" class="form-control input-sm duiqi" id="id" placeholder="请输入标签名">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="form-group ">
                                <label for="name" class="col-xs-3 control-label">标签名：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="name" placeholder="请输入标签名">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="name" class="col-xs-3 control-label">类别：</label>
                                <div class="col-xs-6 ">
                                    <%--                                    <input type="text" class="form-control input-sm duiqi" id="cat" placeholder="请输入标签名">--%>
                                    <select id="select" name="select">
                                        <c:forEach var="t" items="${categoryTable}">
                                            <option value="${t.id}" id="option" >${t.id}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal">
                        <div class="form-group ">
                            <label for="name" class="col-xs-3 control-label">描述：</label>
                            <div class="col-xs-6 ">
                                <input type="text" class="form-control input-sm duiqi" id="descn" placeholder="请输入标签名">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
            <button type="button" id="add" class="btn btn-xs btn-green">添 加</button>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

<div class="modal fade" id="changeChar" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"  >添加标签</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal">
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form class="form-horizontal">
                                    <div class="form-group ">
                                        <label for="name" class="col-xs-3 control-label">id：</label>
                                        <div class="col-xs-6 ">
                                            <input type="text" class="form-control input-sm duiqi" id="id1" disabled>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="form-group ">
                                <label for="name" class="col-xs-3 control-label">标签名：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="name1" >
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="name" class="col-xs-3 control-label">类别：</label>
                                <div class="col-xs-6 ">
                                    <%--                                    <input type="text" class="form-control input-sm duiqi" id="cat" placeholder="请输入标签名">--%>
                                    <select id="select1" name="select1">
                                        <c:forEach var="c" items="${categoryTable}">
                                            <option value="${c.id}" id="option1" >${c.id}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal">
                        <div class="form-group ">
                            <label for="name" class="col-xs-3 control-label">描述：</label>
                            <div class="col-xs-6 ">
                                <input type="text" class="form-control input-sm duiqi" id="descn1" placeholder="请输入标签名">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
            <button type="button" id="change" class="btn btn-xs btn-green">修 改</button>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>

<script>

    $("#add").click(function () {
        // var ab = $("#select").val();
        // console.log(ab);
        $.ajax({
            type:"post",
            url:"/tag/add",
            dataType: 'json'
            ,data:{id:$("#id").val(),name:$("#name").val(),category:$("#select").val(),descn:$("#descn").val()}
            , success: function (data) {
                console.log(data);
                console.log(data.code);
                if(data.code==200){
                    alert("添加成功");
                    window.location.reload();
                }else {
                    alert("添加失败");
                }
            }
        })
    })

    $(".upda").click(function () {
        var abc = $(this).attr("value");
        $("#id1").val(abc);
        $("#name1").val($(this).attr("name"));
        $("#select1").val($(this).attr("id"));
        $("#descn1").val($(this).attr("content"));
    })

    $("#change").click(function () {
        $.ajax({
            type:"post",
            url:"/tag/change",
            dataType:'json'
            ,data:{id:$("#id1").val(),name:$("#name1").val(),category:$("#select1").val(),descn:$("#descn1").val()}
            ,success:function (data) {
                if(data.code==200){
                    alert("修改成功");
                    window.location.reload();
                }else{
                    alert("修改失败");
                }
            }
        })

    })

    $(".del").click(function () {
        if(confirm("是否删除?")){
            $.ajax({
                type:"get",
                url:"/tag/del",
                dataType: 'json'
                ,data:{id:$(this).attr("name")}
                , success: function (data) {
                    if(data.code==200){
                        alert("删除成功");
                        window.location.reload();
                    }else {
                        alert("删除失败");
                    }
                }
            })
        }

    })
</script>
</body>
</html>

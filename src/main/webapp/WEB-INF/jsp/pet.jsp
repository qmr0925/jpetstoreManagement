<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title><script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(function() {
            $(".meun-item").click(function() {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function() {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function() {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function() {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function() {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function() {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.min.js"></script>
    <script src="../js/respond.min.js"></script>
    <![endif]-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/slide.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
</head>
<body>
<div class="check-div form-inline">
    <div class="check-div">
        <div class="col-xs-4">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addChar">添加权限</button>
        </div>
    </div>

    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
        <form action="/pet/CHAXUN" method="get">
            <select id="select" name="select">
                <option value="P" id="P">上架中</option>
                <option value="T" id="T">未上架</option>
            </select>
            <button class="btn btn-white btn-xs " type="submit" id="CHAXUN">查 询 </button>
        </form>
    </div>
</div>

<div  style="overflow-y:auto;width:100%;height: 560px;border-top: 1px solid blue;">
    <table class="table table-striped">
        <tr>
            <th>id</th>
            <th>productid</th>
            <th>listprice</th>
            <th>unitcost</th>
            <th>status</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        <c:forEach var="p" items="${pet}" >
            <tr>
                <td>${p.id}</td>
                <td>${p.productid}</td>
                    <%--                <td><img src="${p.photourls}" width="70px" height="70px"/></td>--%>
                <td>${p.listprice}</td>
                <td>${p.unitcost}</td>
                <td>${p.status}</td>
                <td>${p.attr1}</td>
                <td> <button class="btn btn-success btn-xs upda" data-toggle="modal"
                             id ="${p.id}" value="${p.productid}" name="${p.listprice}"  content="${p.status}"
                             data-target="#changeChar">修改</button>
                    <button class="btn btn-danger btn-xs del" data-toggle="modal" data-target="#deleteChar" id ="${p.id}">删除</button></td>
            </tr>
        </c:forEach>
    </table>

    <div class="modal fade" id="changeChar" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"  >修改宠物</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">id：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" id="id" disabled>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">商品名：</label>
                                    <div class="col-xs-6 ">
                                        <select id="select1" name="select1">
                                            <c:forEach var="c" items="${tag}">
                                                <option value="${c.id}" id="option1" >${c.id}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal">
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">价位：</label>
                                    <div class="col-xs-6 ">
                                        <input type="text" class="form-control input-sm duiqi" id="listprice" >

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
                                <label  class="col-xs-3 control-label">花销：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="unicost" >
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">状态：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="status" >
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal">
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">属性：</label>
                                    <div class="col-xs-6 ">
                                        <input type="text" class="form-control input-sm duiqi" id="attr1" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" id="change" class="btn btn-xs btn-green">修 改</button>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addChar" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"  >添加宠物</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">id：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" id="id2" >
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">商品名：</label>
                                    <div class="col-xs-6 ">
                                        <select id="select2" name="select2">
                                            <c:forEach var="c" items="${tag}">
                                                <option value="${c.id}" id="option1" >${c.id}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal">
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">价位：</label>
                                    <div class="col-xs-6 ">
                                        <input type="text" class="form-control input-sm duiqi" id="listprice2" >

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
                                <label  class="col-xs-3 control-label">花销：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="unicost2" >
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">状态：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="status2" >
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <form class="form-horizontal">
                                <div class="form-group ">
                                    <label  class="col-xs-3 control-label">属性：</label>
                                    <div class="col-xs-6 ">
                                        <input type="text" class="form-control input-sm duiqi" id="attr12" >
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" id="add" class="btn btn-xs btn-green">添加</button>
            </div>
        </div>
    </div>
</div>
<script>

    $("#add").click(function () {
        $.ajax({
            type:"post",
            url:"/pet/add",
            dataType:'json'
            ,data:{id:$("#id2").val(),productid:$("#select2").val(),listprice:$("#listprice2").val(),
                unicost:$("#unicost2").val(),status:$("#status2").val(),attr1:$("#attr12").val()}
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

    $(".upda").click(function () {
        var abc = $(this).attr("id");
        console.log(abc+"1");
        $("#id").val(abc);
        $("#select1").val($(this).attr("value"));
        $("#status").val($(this).attr("content"));
        $("#listprice").val($(this).attr("name"));
    })

    $("#change").click(function () {
        $.ajax({
            type:"post",
            url:"/pet/change",
            dataType:'json'
            ,data:{id:$("#id").val(),productid:$("#select1").val(),listprice:$("#listprice").val(),
                unicost:$("#unicost").val(),status:$("#status").val(),attr1:$("#attr1").val()}
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
                url:"/pet/del",
                dataType: 'json'
                ,data:{id:$(this).attr("id")}
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

    // $("#CHAXUN").click(function () {
    //     console.log($("#select").val());
    //     $.ajax({
    //         type:"get",
    //         url:"/pet/CHAXUN",
    //         dataType:'json'
    //         ,data:{status:$("#select").val()}
    //         ,success:function (data) {
    //             window.location.reload();
    //         }
    //     })
    // })

</script>
</body>

</html>

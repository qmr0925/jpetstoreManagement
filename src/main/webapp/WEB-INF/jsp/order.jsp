<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 0:53
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
    <script src="../js/html5shiv.min.js"></script>
    <script src="../js/respond.min.js"></script>
    <script language="JavaScript">
    function fahuo() {
       String fahuo=document.getElementById('fahuo');

    }
    </script>
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
    <div class="col-xs-4">
        <form action="/user" method="get" >
            <input type="text" class="form-control input-sm" name="username" placeholder="输入username搜索">
            <button class="btn btn-white btn-xs " type="submit" >查 询 </button>
        </form>
    </div>
    <div class="col-xs-4">
        <form>
            <input type="text" class="form-control input-sm" name="firstName" placeholder="输入firstName搜索">
            <button class="btn btn-white btn-xs " type="submit">查 询 </button>
        </form>
    </div>
    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
        <form>
            <select>
                <option value="正常">正常</option>
                <option value="冻结">冻结</option>
            </select>
            <button class="btn btn-white btn-xs " type="submit">查 询 </button>
        </form>
    </div>
</div>

<div style="width:100%;height: 570px;border-top: 1px solid blue">
    <table class="table table-striped">
        <tr>
            <th>id</th>
            <th>totalPrice</th>
            <th>shipdate</th>
            <th>name</th>
            <th>petName</th>
            <th>status</th>
<%--            <th>complete</th>--%>
        </tr>
<%--        <lable>${order.get(1).id}这是id </lable--%>
<%--        <lable>${order.get(1).quantity}这是数量</lable>--%>
        <c:forEach var="o" items="${order}" >
            <tr>
                <td>${o.orderId}</td>
                <td>${o.totalPrice}</td>
                <td>${o.orderDate}</td>
                <td>${o.userid}</td>
                <td>${o.petname}</td>
                <td>${o.status}</td>
                <td><button id="fahuo">发货</button></td>
                <td><button class="btn btn-danger btn-xs del" data-toggle="modal" name="${o.orderId}" data-target="#deleteChar">删除</button></td>
<%--                <td>${o.complete}</td>--%>
            </tr>
        </c:forEach>
    </table>
</div>
<script>

    $(".del").click(function () {
        if(confirm("是否删除?")){
            $.ajax({
                type:"get",
                url:"/order/del",
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

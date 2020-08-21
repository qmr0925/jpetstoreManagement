
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <script src="../js/html5shiv.min.js"></script>
    <script src="../js/respond.min.js"></script>

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
                       <form  action="/user/getFirstName" method="get">
                       <input type="text" class="form-control input-sm"  name="firstName" placeholder="输入firstName搜索" >
                       <button class="btn btn-white btn-xs " id="selectFirst" type="submit" data-toggle="modal" data-target="#searchChar">查 询 </button>
                       </form>
                   </div>
                   <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
                       <form action="/user/getByStatus" method="get">
                        <select name="userStatus">
                            <option value="正常">正常</option>
                            <option value="冻结">冻结</option>
                        </select>
                       <button class="btn btn-white btn-xs " type="submit">查 询 </button>
                       </form>
                   </div>
               </div>

    <div style="width:100%;height: 570px;border-top: 1px solid blue;">
        <table class="table table-striped">
            <tr>
                <th>username</th>
                <th>firstname</th>
                <th>lastname</th>
                <th>email</th>
                <th>password</th>
                <th>phone</th>
                <th>userstatus</th>
                <th>操作</th>
            </tr>
        <c:forEach var="u" items="${user}" >
            <tr>
                <td><input  type="text" class="username" value="${u.username}"></input></td>
                <td><input type="text" value="${u.firstname}" class="firstname" ></input></td>
                <td><input type="text" value="${u.lastname}" class="lastname" ></td>
                <td><input type="text" value="${u.email}" class="email" ></td>
                <td><input type="text" value="${u.password}" class="password" ></td>
                <td><input type="text" value="${u.phone}" class="phone" ></td>
                <td><input type="text" value="${u.userstatus}" class="userstatus" ></td>
                <td> <button class="btn btn-success btn-xs edit" name="${u.username}"  data-toggle="modal" data-target="#changeChar">修改</button>
              <button class="btn btn-danger btn-xs del" data-toggle="modal" name="${u.username}" data-target="#deleteChar">删除</button></td>
            </tr>
        </c:forEach>
        </table>
    </div>
</body>
<script>
    $(".del").click(function () {
        if(confirm("是否删除?")){
            $.ajax({
                type:"DELETE",
                url:"/user/"+$(this).attr("name"),
                dataType: 'json'
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

    $(".edit").click(function () {
        if(confirm("是否修改?")){
            $.ajax({
                type:"get",
                url:"/user/edit",
                dataType: 'json'
                 ,data:{username:$(this).attr("name"),firstname:$(".firstname").val(),lastname:$(".lastname").val(),email:$(".email").val(),password:$(".password").val(),phone:$(".phone").val(),userstatus:$(".userstatus").val()}

                , success: function (data) {
                    if(data.code==200){
                        alert("修改成功");
                        window.location.reload();
                    }
                    else
                    {
                        alert("修改失败");
                    }
                }
            })
        }
    })

    // $("#selectFirst").click(function () {
    //     if(confirm("是否发货?")){
    //         $.ajax({
    //             type:"get",
    //             url:"/user/selectFirst",
    //             dataType: 'json'
    //             ,data:{firstname:$(".firstname").attr(name)}
    //             , success: function (data) {
    //                 if(data.code==200){
    //                     alert("成功发货");
    //                     window.location.reload();
    //                 }else if (data.code==201)
    //                 {
    //                     alert("不可以重复发货哦");
    //                     //window.location.reload();
    //                 }
    //                 else
    //                 {
    //                     alert("发货失败");
    //                 }
    //             }
    //         })
    //     }
    // })
</script>
</html>

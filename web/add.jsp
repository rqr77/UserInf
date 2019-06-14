<%--
  Created by IntelliJ IDEA.
  User: rqr
  Date: 2019/6/11
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <style type="text/css">
        td,th,h3{
            text-align: center;
        }
         body {
             padding-top: 40px;
             padding-bottom: 40px;
             background-color: #eee;
         }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: -1px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>

    <title>Title</title>
</head>
<body>
<div style="text-align: center">
    <h1>添加对象页面</h1>
</div>
<div>
    <form class="form-signin"  method="post" id="add_form" action="${pageContext.request.contextPath}/AddUserServlet">
        <strong>用户名:</strong>
        <label for="inputname" class="sr-only">用户名</label>
        <input type="text" id="inputname" class="form-control" placeholder="请输入用户名" name="name" required autofocus>

        <strong>性别:</strong>
        <div class="checkbox">
            <label>
                <input type="radio" name="gender" value="男" >男
                <input type="radio" name="gender" value="女">女
            </label>
        </div>

        <strong>年龄:</strong>
        <label for="inputage" class="sr-only">年龄</label>
        <input type="text" id="inputage" class="form-control" placeholder="请输入年龄" name="age" required>

        <strong>籍贯:</strong>
        <label for="inputBirthplace" class="sr-only">籍贯</label>
        <input type="text" id="inputBirthplace" class="form-control" placeholder="请输入籍贯" name="birthplace" required>

        <strong>QQ:</strong>
        <label for="inputQQ" class="sr-only">QQ</label>
        <input type="text" id="inputQQ" class="form-control" placeholder="请输入QQ" name="qq" required>

        <strong>Email:</strong>
        <label for="inputEmail" class="sr-only">QQ</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="请输入Email" name="email" required>

        <div style="text-align: center">
            <button class="btn btn-lg btn-primary " type="submit">提交</button>
            <button id="rollback" class="btn btn-lg" type="reset">重置</button>
            <button class="btn btn-lg" type="button" href="list.jsp">返回</button>
        </div>

    </form>
    <script>
/*
        $(function () {
            $("#rollback").onclick(function () {
                $("#add_form")[0].reset();
            })
        });
*/

        $(document).ready(function(){
            $(function(){
                $(".checkbox").find(":checkbox").each(function(){
                    $(this).onclick(function(){
                        if($(this).is(':checked')){
                            $(this).attr('checked',true).siblings().attr('checked',false);
                        }else{
                            $(this).attr('checked',false).siblings().attr('checked',false);
                        }
                    });
                });
            });
        });

    </script>
</div>

</body>
</html>

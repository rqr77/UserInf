<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" charset="utf-8"/>
    <%--<link rel="stylesheet" href="signin.css" type="text/css" charset="utf-8">--%>
    <%--？外联样式表出现link出现问题浏览器解析为text/plain无法加载样式--%>
    <%-- 配置文件的问题--%>
    <style>
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
    <script src="jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>


<%--    <script type="javascript">
        function refreshCode() {
            var verCode = document.getElementById("vercodeimg");
            verCode.src="${pageContext.request.contextPath}/checkcode.AuthImage?date="+ new Date().getTime();
        }
    </script>--%>

    <script type="text/javascript">
        function refreshCode(){
            var img = document.getElementById("verCode");
            img.src = "${pageContext.request.contextPath}/checkcode.AuthImage?date=" + new Date();
        }
    </script>
    <script type="javascript">

        function checkcode(){
            var inputcode = document.getElementById("vcode");
            var code = "${sessionScope.verCode}";
            document.write(code)



        }



    </script>


</head>
<body>
<div style="text-align: center">
    <h1>Welcome!</h1>
</div>

<div class="container">

    <form class="form-signin" action="${pageContext.request.contextPath}/loginServlet" method="post">
        <h2 class="form-signin-heading">请登陆</h2>
        <label for="inputUsername" class="sr-only">用户名</label>
        <input type="text" id="inputUsername" class="form-control" placeholder="请输入用户名" name="username" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" name="password" required>
        <label for="vcode" class="sr-only" >验证码</label>
        <input  type="text" id="vcode" name="vercode"  class="form-control" placeholder="请输入验证码" required>


        <div align="center" style="margin: 5px">
            验证码：
            <a href="javascript:refreshCode()">
                <img id="verCode" src="${pageContext.request.contextPath}/checkcode.AuthImage" title="刷新">
            </a>
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
    </form>

    <div class="alert alert-warning alert-dismissable" role="alert" style="text-align: center">
        <strong>登陆信息</strong>
        <div>
            <%
                String msg_login =(String) request.getAttribute("msg_login");
                if (msg_login != null){
                    out.write(msg_login);
                }
            %>
        </div>
        <div>
            <%
                String msg_check =(String) request.getAttribute("msg_check");
                if (msg_check != null){
                    out.write(msg_check);
                }
            %>


        </div>


    </div>



</div>
</body>
</html>
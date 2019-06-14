<%@ page import="domain.User" %>
<%--
  Created by IntelliJ IDEA.
  User: rqr
  Date: 2019/6/11
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
<div style="text-align: center" >
    <h1>欢迎您！${user.username}</h1>
    <hr>
    <h2>将于<span id="span1">5</span>s后自动跳转......<a href="index.jsp">点击跳转</a></h2>

    <script>
        var int;
        function countDown(){
            var span1=$("#span1");
            var time=parseInt(span1.text());
            if( time>0){
                span1.text(time-1);
            }else{
                window.clearInterval(int);
                window.location.href="index.jsp";
            }
        }
        $(function () {
            int=self.setInterval(countDown,1000)
        });
    </script>

</div>




</body>
</html>

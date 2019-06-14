<%--
  Created by IntelliJ IDEA.
  User: rqr
  Date: 2019/6/9
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/npm.js"></script>
</head>
<body>
<div align="center" class="btn"></div>
<a href="${pageContext.request.contextPath}/UserListServlet"> <h1 align="center">查看用户信息</h1></a>
<hr>

  <form action="${pageContext.request.contextPath}/FindUserByPageServlet" method="post">
    <input type="text" id="rows" name="rows" placeholder="默认为2">设置每页显示记录数
    <input type="text" id="currentPage"  name="currentPage" placeholder="默认为1">显示为第几页
    <input type="submit" value="查看用户信息(分页)">
  </form>
<script>
</script>
<a href="${pageContext.request.contextPath}/FindUserByPageServlet" >查看用户信息(分页) <h1 align="center"></h1></a>
</body>
</html>

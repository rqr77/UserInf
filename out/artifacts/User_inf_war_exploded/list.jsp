<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <style type="text/css">
        td,th,h3{
            text-align: center;
        }
    </style>

    <script>

        function del(id) {
            if (confirm("确定删除？"))
            location.href="${pageContext.request.contextPath}/DelUserServlet?id="+id;
        }

        function delselector() {
            if (confirm("确定删除？")){
                var list = document.getElementsByName("box");
                var flag =false;
                for (var i=0 ; i< list.length; i++){
                    if (list[i].checked){
                        flag = true;
                        break;

                    }
                }
                if (flag) {
                    $(function () {
                    $("#delselector").click(function () {
                        $("#delform").submit();
                    })
                })
                }

            }

            }


        $(function () {
            $("#first_id").click(function () {
                var list = document.getElementsByName("box");
                for (var i=0 ; i< list.length; i++){
                    list[i].checked=this.checked;
                }
            });
        })


    </script>

</head>

<body>
<div class="container">
    <h3 >用户信息列表</h3>


    <form class="form-inline" style="float: left" action="${pageContext.request.contextPath}/FindUserByPageServlet" method="post" name="find">
        <div class="form-group">
            <label for="from1">姓名</label>
            <input type="text" class="form-control" id="from1" name="name" value="${map.name[0]}" >
        </div>
        <div class="form-group">
            <label for="from2">籍贯</label>
            <input type="text" class="form-control" id="from2" name="address"  value="${map.address[0]}">
        </div>
        <div class="form-group">
            <label for="from3">邮箱</label>
            <input type="text" class="form-control" id="from3" name="email" value="${map.email[0]}" >
        </div>
        <button type="submit" class="btn btn-default">查询</button>
    </form>


    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="add.jsp">添加对象</a>
        <a class="btn btn-primary" href="javascript:delselector()" id="delselector">删除选中</a>
    </div>


    <form action="${pageContext.request.contextPath}/DelSelectedServlet" method="post" id="delform">
    <table class="table table-striped table-bordered table-hover" border="1">
        <tr class="success">
            <!--表头-->
            <th ><input type="checkbox" id="first_id"> </th>
            <th >编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>邮箱</th>
            <th>用户名</th>
            <th>密码</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pagebean.list}" var="user" varStatus="s">
            <tr>
                <!--从数据库中读取信息-->
                <td><input type="checkbox" value="${user.id}" name="box"></td>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.qq}</td>
                <td>${user.email}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/FindUserServlet?id=${user.id}">修改</a>&nbsp;
                    <a class="btn btn-default btn-sm"  href= "javascript:del(${user.id});" name="del">删除</a></td>
            </tr>
        </c:forEach>
        <%--    <tr>
            <!--从数据库中读取信息-->
            <td>1</td>
            <td>rqr</td>
            <td>男</td>
            <td>20</td>
            <td>四川</td>
            <td>565656231</td>
            <td>233@qq.com</td>
            <td ><a class="btn btn-default btn-sm" href="update.html">修改</a>&nbsp;
                <a class="btn btn-default btn-sm" href="">删除</a>
            </td>
            </tr>--%>
    </table>
    </form>
</div>

<%--分页栏--%>
<div>
    <nav aria-label="Page navigation">
        <ul class="pagination">


                <c:if test="${pagebean.currentPage == 1}">
                    <li class="disabled">
                    <a href="#" aria-label="Previous" >
                </c:if>
                <c:if test="${pagebean.currentPage != 1}">
                    <li>
                    <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pagebean.currentPage-1}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.email[0]}" aria-label="Previous" >
                </c:if>
                    <span aria-hidden="true">&laquo;</span>
                    </a>
            </li>
            <c:forEach begin="1" end="${pagebean.totalPage}" var="i">
                <c:if test="${pagebean.currentPage== i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.email[0]}">${i}</a></li>
                </c:if>
                <c:if test="${pagebean.currentPage!= i}">
                    <li ><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.email[0]}">${i}</a></li>
                </c:if>
            </c:forEach>

                <c:if test="${pagebean.currentPage< pagebean.totalPage}">
                    <li>
                    <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pagebean.currentPage +1 }&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.email[0]}" aria-label="Next">
                </c:if>
                <c:if test="${pagebean.currentPage>= pagebean.totalPage}">
                    <li class="disabled">
                    <a href="#" aria-label="Next">
                </c:if>
                    <span aria-hidden="true">&raquo;</span>
                    </a>
            </li>
            <span style="font-size: 25px;margin-left: 5px">
                总共${pagebean.totalCount}条记录，共有${pagebean.totalPage}页
            </span>
        </ul>
    </nav>


</div>

</body>
</html>
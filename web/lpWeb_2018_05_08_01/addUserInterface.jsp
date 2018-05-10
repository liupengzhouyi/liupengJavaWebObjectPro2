<%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-08
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新用户信息录入</title>
    <link rel="stylesheet" type="text/css" href="cssForUserAdd.css">
</head>
<body>
<center>
    <h1>
        新用户信息录入界面
    </h1>
    <form name="informationInput" action="addUser.jsp">
        用户名: <input type="text" name="username" maxlength="45">
        <br>
        密&nbsp;&nbsp;码: <input name="password" type="password" maxlength="45">
        <br>
        <input type="submit" value="提交">
    </form>
</center>
</body>
</html>

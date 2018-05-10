<%@ page import="java.sql.Connection" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-09
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户显示</title>
    <link rel="stylesheet" type="text/css" href="cssForUserAdd.css">
</head>
<body>
    <h1>
        用户显示
    </h1>

    <%
        Connection lpConnection = new linkDatabase().getLpConnection();
        if (lpConnection == null)
        {
            out.println("数据库连接成功！");
        } else {
            Statement statement = lpConnection.createStatement();
            String sql = "SELECT username FROM usertable;";
            ResultSet lpResultSet = statement.executeQuery(sql);
            while(lpResultSet.next()) {
                out.println(lpResultSet.getString("username"));
            }
        }
    %>
</body>
</html>

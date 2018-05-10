<%@ page import="java.sql.Connection" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-09
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="cssForUserAdd.css">
</head>
<body>
    <h1>
        用户信息
    </h1>

    <%
        Connection lpConnectionForShowUser = new linkDatabase().getLpConnection();
        if (lpConnectionForShowUser == null) {
            out.print("连接数据库失败！");
        } else {
            Statement lpState = lpConnectionForShowUser.createStatement();
            if (lpState == null) {
                out.println("没有获取Statement对象！");
            } else {
                String sql = "SELECT * FROM usertable;";
                ResultSet lpResultSet = null;
                lpResultSet = lpState.executeQuery(sql);
    %>
    <table width="600" border="1" align="center" >
        <caption>用户信息</caption>
        <tr>
            <td align="center" valign="middle">id</td>
            <td align="center" valign="middle">username</td>
            <td align="center" valign="middle">password</td>
        </tr>
    <%
                while(lpResultSet.next()) {
    %>
        <tr>
            <td align="center" valign="middle"><%=lpResultSet.getString("userid")%></td>
            <td align="center" valign="middle"><%=lpResultSet.getString("username")%></td>
            <td align="center" valign="middle"><%=lpResultSet.getString("password")%></td>

        </tr>
    <%
                }
            }
        }
    %>
    </table>
</body>
</html>

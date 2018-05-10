<%@ page import="java.sql.Connection" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-09
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据表详情</title>
    <link rel="stylesheet" type="text/css" href="cssForUserAdd.css">
</head>
<body>
    <h1>
        数据表·详情
    </h1>

    <%
        Connection lpConnForShowTables = new linkDatabase().getLpConnection();
        if (lpConnForShowTables == null) {
            out.println("数据库连接出错！");
        } else {
            Statement lpState = lpConnForShowTables.createStatement();
            if (lpState == null) {
                out.println("Statement 对象为空！ ");
            } else {
                String sql = "SHOW TABLES;";
                ResultSet lpReSet = lpState.executeQuery(sql);
                while(lpReSet.next()) {
                    out.print(lpReSet.getString("Tables_in_web_database"));
                    out.print('\n');
                }
            }
        }
    %>
</body>
</html>

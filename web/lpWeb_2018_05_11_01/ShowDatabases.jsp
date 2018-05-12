<%@ page import="java.sql.Connection" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-11
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库查看</title>
    <link rel="stylesheet" type="text/css" href="lpweb_2018_05_10_01/csstable01.css">


</head>
<body>
    <h1>
        数据库查看
    </h1>
<hr>


<%
    Connection lpConnection = new linkDatabase().getLpConnection();
    if (lpConnection != null) {
        Statement lpState = lpConnection.createStatement();
        if (lpState != null) {
            String str = "SHOW DATABASES;";
            ResultSet lpResltSet = lpState.executeQuery(str);
            if (lpResltSet != null) {
                int i=0;
%>
    <table width="600" border="1" align="center" >
        <caption>数据表</caption>
        <tr>
            <td align="center" valign="middle">number</td>
            <td align="center" valign="middle">databaseName</td>
            <td align="center" valign="middle">Information</td>
        </tr>
        <%
                while(lpResltSet.next()) {
                    String databaseName = null;
                    try {
                        databaseName = lpResltSet.getString("Database");
                        i++;
        %>
        <from action="showTable.jsp" method="post">
            <tr>
                <td  align="center" valign="middle"><%=i%></td>
                <td  name="tablename" align="center" valign="middle"><%=databaseName%></td>
                <td  align="center" valign="middle"><input type="submit" value="详情"></td>
            </tr>
        </from>
        <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                        //读取数据库名 异常
                    }
                }
            } else {
                //数据库为空
                ;
            }
        } else {
            //没有获取Statement对象
            ;
        }
    } else {
        //没有获得数据库连接
        ;
    }
%>

    </table>

</body>
</html>

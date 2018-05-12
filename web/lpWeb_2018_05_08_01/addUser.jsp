<%@ page import="java.sql.*" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-08
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<%
    String username = request.getParameter("username") ;
    String password = request.getParameter("password") ;

    if (username == null) {
        %>
        //用户名没有填写
        <%
    } else if (password == null) {
        %>
        //密码没有填写
        <%
    }

    Connection lpConnectionForAddUser = new linkDatabase().getLpConnection();

    Statement lpStatementForAddUser = lpConnectionForAddUser.createStatement();

    String sql = "INSERT INTO usertable (username,password) " +
            "VALUES ('" + username + "','" + password + "');" ;

   /*String sql = "CREATE TABLE userqqnumber01(id INT(11) PRIMARY KEY AUTO_INCREMENT,username VARCHAR(45) NOT NULL,qqnumber VARCHAR(20) NOT NULL);";
*/
    int key = 0;
    try {
        key = lpStatementForAddUser.executeUpdate(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if (key == 1) {
        out.println("数据修改成功！");
    } else {
        out.println("数据修改失败！");
    }
    %>
</body>
</html>

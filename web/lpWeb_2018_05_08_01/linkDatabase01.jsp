<%@ page import="java.sql.*" %>
<%@ page import="lp_2018_05_08_01.linkDatabase" %>
<%--
  Created by IntelliJ IDEA.
  User: liupe
  Date: 2018-05-08
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>连接数据库</title>
</head>
<body>
    <%
       /* try {
            Class.forName("com.mysql.jdbc.Driver");
            out.println("数据库驱动加载成功！");
        } catch (ClassNotFoundException e) {
            out.println("数据库驱动加载失败！");
            e.printStackTrace();
        }*/

        try {
            /*Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/web_database",
                    "root",
                    "lp184126"
            );*/
            Connection conn = new linkDatabase().getLpConnection();
            if (conn != null) {
                out.println("数据库连接成功！");
                Statement lpStatement = conn.createStatement();
                String sql = "CREATE TABLE usertable01 " +
                        "(" +
                        "id INT(10) PRIMARY KEY AUTO_INCREMENT," +
                        "username VARCHAR(45) NOT NULL, " +
                        "password VARCHAR(45) NOT NULL" +
                        ");";
               /* String sql = "SHOW TABLES;";*/
                if (lpStatement == null) {
                    out.println("没有获取 statement 对象！");
                } else {
                    ResultSet p = lpStatement.executeQuery(sql);
                    /*while(p.next()) {
                        out.println(p.getString("Tables_in_web_database"));
                    }*/
                }
            } else{
                out.println("数据库加载失败1！");
            }
        } catch (SQLException e) {
            out.println("数据库加载失败！");
            e.printStackTrace();
        }

    %>


</body>
</html>

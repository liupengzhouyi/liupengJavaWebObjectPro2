package lp_2018_05_08_01;

import java.sql.*;

public class adduser {
    public boolean addLpUser(String username, String password) throws SQLException {
        Connection conn;
        linkDatabase lpLinkage = new linkDatabase();
        conn = lpLinkage.getLpConnection();
        String sql = "INSERT INTO usertable (username,password) VALUES ('"
                + username + "','" + password + "');";
        System.out.println(sql);
        if (conn == null) {
            System.out.println("NULL");
            return false;
        } else {
            Statement lpStatement = conn.createStatement();
            if (lpStatement == null) {
                System.out.println("没有获取 statement 对象！");
                return false;
            } else {
                int keyIfInsertSuccess = lpStatement.executeUpdate(sql) ;
                if (keyIfInsertSuccess == 1) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    }
    public static void main(String [] artgs) {
        try {
            boolean a = new adduser().addLpUser("liupeng", "123");
            System.out.println(a);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package lp_2018_05_08_01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class linkDatabase {

    public linkDatabase() {
    }

    public Connection getLpConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                Connection lpConnection  = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/web_database",
                        "root",
                        "lp184126"
                );
                return lpConnection;
            } catch (SQLException e) {
                return null;
            }
        } catch (ClassNotFoundException e) {
            return null;
        }
    }
}

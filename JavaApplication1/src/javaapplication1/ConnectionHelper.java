package javaapplication1;

import java.sql.*;

public class ConnectionHelper {
    static String connectionUrl
                = "jdbc:sqlserver://Duy:1433;"
                + "database=Csharp;"
                + "user=sa;"
                + "password=123456;"
                + "encrypt=false;"
                + "trustServerCertificate=false;"
                + "loginTimeout=30;";
    
    public static Connection getDBConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(ConnectionHelper.connectionUrl);
        conn.setAutoCommit(false);
        return conn;
    }
}

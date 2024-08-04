package com.QLKQHT.dao;

import java.sql.*;
import javax.swing.JOptionPane;

public class ConnectDB {
    protected Connection conn = null;

    public ConnectDB(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=QLKQHocTap;encrypt=true;trustServerCertificate=true;";
            String user = "sa";
            String password = "123";
            conn = DriverManager.getConnection(url, user, password);
        }
        catch (ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null,e);
        }
    }
}

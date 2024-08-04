package com.QLKQHT.dao;

import java.sql.*;

public class TaiKhoanDao extends ConnectDB{
    public String login(String tk, String mk) {
        String MaTK = null;
        String sql_login = "select * from TaiKhoan where TenTaiKhoan = ? and MatKhau = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sql_login);
            pst.setString(1, tk);
            pst.setString(2, mk);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                MaTK = rs.getString("TenTaiKhoan");
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return MaTK;
    }
}

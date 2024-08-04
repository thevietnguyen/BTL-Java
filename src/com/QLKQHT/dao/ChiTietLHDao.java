package com.QLKQHT.dao;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ChiTietLHDao extends ConnectDB {
    public ArrayList<String> listIdStudent(String maLH) {
        ArrayList<String> dsIdSV = new ArrayList<>();
        String sqlID = "select distinct MaSinhVien from ChiTietLopHoc where MaLopHoc = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sqlID);
            pst.setString(1, maLH);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                dsIdSV.add(rs.getString(1));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return dsIdSV;
    }
}

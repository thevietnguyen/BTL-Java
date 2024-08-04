package com.QLKQHT.dao;

import com.QLKQHT.modal.SinhVien;
import java.sql.*;

public class SinhVienDao extends ConnectDB {
    public SinhVien inforStudent(String MaSV) {
        SinhVien sv = new SinhVien();
        String sqlSV = "select * from SinhVien where MaSinhVien = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sqlSV);
            pst.setString(1, MaSV);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()) {
                sv.setMaSV(rs.getString(1));
                sv.setTenSV(rs.getString(2));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return sv;
    }
    
    
}

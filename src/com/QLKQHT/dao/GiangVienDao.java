package com.QLKQHT.dao;

import com.QLKQHT.modal.GiangVien;
import java.sql.*;

public class GiangVienDao extends ConnectDB {
    public GiangVien inforTeacher(String MaGV) {
        GiangVien gv = new GiangVien();
        String sqlGV = "select * from GiangVien where MaGiangVien = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sqlGV);
            pst.setString(1, MaGV);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                gv.setMaGV(rs.getString(1));
                gv.setTenGV(rs.getString(3));
                gv.setSDT(rs.getString(4));
                gv.setKhoa(rs.getString(5));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return gv;
    }
}

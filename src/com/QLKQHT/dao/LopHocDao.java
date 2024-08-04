package com.QLKQHT.dao;

import com.QLKQHT.modal.LopHoc;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class LopHocDao extends ConnectDB {
    public ArrayList<LopHoc> listClassRoom(String maGV, String maMH) {
        ArrayList<LopHoc> dslh = new ArrayList<>();
        String sqlLH = "select * from LopHoc where MaGiangVien = ? and MaMonHoc = ?";
        try {
            PreparedStatement pst = conn.prepareStatement(sqlLH);
            pst.setString(1, maGV);
            pst.setString(2, maMH);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                LopHoc lopHoc = new LopHoc(
                        rs.getString(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6)
                );
                dslh.add(lopHoc);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return dslh;
    }
}

package com.QLKQHT.dao;

import com.QLKQHT.modal.BangDiem;
import com.QLKQHT.modal.MonHoc;
import java.sql.*;

public class BangDiemDao extends ConnectDB {
    private String MaSV;
    private BangDiem bangDiem;
    private MonHoc monHoc;
    
    public void setMonHoc(MonHoc mh) {
        this.monHoc = mh;
    }
    
    public BangDiem transcript(String maSV) {
        this.MaSV = maSV;
   
        String sqlGV = "select * from BangDiem where MaMonHoc = ? and MaSinhVien = ?";
        
        try {
            PreparedStatement pst = conn.prepareStatement(sqlGV);
            pst.setString(1, monHoc.getMaMH());
            pst.setString(2, MaSV);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                bangDiem = new BangDiem(
                    rs.getString(1).trim(),
                    rs.getString(2).trim(),
                    rs.getString(3) == null ? "" : rs.getString(3).trim(),
                    rs.getString(4) == null ? "" : rs.getString(4).trim(),
                    rs.getString(5) == null ? "" : rs.getString(5).trim(),
                    rs.getString(6) == null ? "" : rs.getString(6).trim(),
                    rs.getString(7) == null ? "" : rs.getString(7).trim(),
                    rs.getString(8) == null ? "" : rs.getString(8).trim(),
                    rs.getString(9) == null ? "" : rs.getString(9).trim(),
                    rs.getString(10) == null ? "" : rs.getString(10).trim()
                );
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return bangDiem;
    }
    
    
    public void score(BangDiem bd) {
        float diem4 = 0;
        String xepLoai = null;
        String diemChu = null;

        float hsgk = monHoc.getHSGK();
        String dgk = bd.getDGK();
        if(hsgk == 0.0) {
            hsgk = 1;
            dgk = "1";
        }
        
        if(!bd.getDTX1().equals("") && !bd.getDTX2().equals("") && !dgk.equals("") && !bd.getDCK().equals("")) {
            float diemTX1 = Float.parseFloat(bd.getDTX1());
            float diemTX2 = Float.parseFloat(bd.getDTX2());
            float diemGK = bd.getDGK().equals("") ? 1 : Float.parseFloat(bd.getDGK());
            float diemCK = Float.parseFloat(bd.getDCK());
            
            float hsTX1 = monHoc.getHSTX1();
            float hsTX2 = monHoc.getHSTX2();
            float hsck = monHoc.getHSCK();
            
            double tongDiem = diemTX1*(hsTX1/100) + diemTX2*(hsTX2/100) + diemGK*(hsgk/100) + diemCK*(hsck/100);
            double diem10 = Math.round(tongDiem * 10) / 10.0;

            if(diem10 >= 8.5 && diem10 <= 10.0) {
                diem4 = (float) 4;
                diemChu = "A";
                xepLoai = "Giỏi";
            }
            else if(diem10 >= 8.0 && diem10 <= 8.4) {
                diem4 = (float) 3.5;
                diemChu = "B+";
                xepLoai = "Khá giỏi";
            }
            else if(diem10 >= 7.0 && diem10 <= 7.9) {
                diem4 = (float) 3;
                diemChu = "B";
                xepLoai = "Khá";
            }
            else if(diem10 >= 6.5 && diem10 <= 6.9) {
                diem4 = (float) 2.5;
                diemChu = "C+";
                xepLoai = "TB khá";
            }
            else if(diem10 >= 5.5 && diem10 <= 6.4) {
                diem4 = (float) 2;
                diemChu = "C";
                xepLoai = "Trung bình";
            }
            else if(diem10 >= 5.0 && diem10 <= 5.4) {
                diem4 = (float) 1.5;
                diemChu = "D+";
                xepLoai = "TB yếu";
            }
            else if(diem10 >= 4.0 && diem10 <= 4.9) {
                diem4 = (float) 1;
                diemChu = "D";
                xepLoai = "Yếu";
            }
            else if(diem10 < 4.0) {
                diem4 = (float) 0;
                diemChu = "F";
                xepLoai = "Kém";
            }

            bd.setDiem10(String.valueOf(diem10));
            bd.setDiem4(String.valueOf(diem4));
            bd.setDiemChu(diemChu);
            bd.setXepLoai(xepLoai);   
        }
    }
    
    public void saveDB(BangDiem bd, String msv) {
        String diemTx1 = "".equals(bd.getDTX1()) ? null : bd.getDTX1();
        String diemTx2 = "".equals(bd.getDTX2()) ? null : bd.getDTX2();
        String diemGK = "".equals(bd.getDGK()) ? null : bd.getDGK();
        String diemCK = "".equals(bd.getDCK()) ? null : bd.getDCK();
        String diem10 = "".equals(bd.getDiem10()) ? null : bd.getDiem10();
        String diem4 = "".equals(bd.getDiem4()) ? null : bd.getDiem4();
        String diemChu = "".equals(bd.getDiemChu()) ? null : bd.getDiemChu();
        String xepLoai = "".equals(bd.getXepLoai()) ? null : bd.getXepLoai();
        
        String updateBD = "update BangDiem set DiemTX1 = ?, DiemTX2 = ?, DiemGiuaKy = ?, DiemCuoiKy = ?,"
                          + "Diem10 = ?, Diem4 = ?, DiemChu = ?, XepLoai = ? "
                          + "where MaMonHoc = ? and MaSinhVien = ?";
        try {
            PreparedStatement pstUD = conn.prepareStatement(updateBD);
                
            pstUD.setString(1, diemTx1);
            pstUD.setString(2, diemTx2);
            pstUD.setString(3, diemGK);
            pstUD.setString(4, diemCK);
            pstUD.setString(5, diem10);
            pstUD.setString(6, diem4);
            pstUD.setString(7, diemChu);
            pstUD.setString(8, xepLoai);
            pstUD.setString(9, monHoc.getMaMH());
            pstUD.setString(10, msv);
                    
            pstUD.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }  
   }
}

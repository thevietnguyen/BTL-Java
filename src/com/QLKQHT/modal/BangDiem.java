package com.QLKQHT.modal;

public class BangDiem {
    private String MaMH;
    private String MaSV;
    private String DTX1;
    private String DTX2;
    private String DGK;
    private String DCK;
    private String Diem10;
    private String Diem4;
    private String DiemChu;
    private String XepLoai;
    
    public BangDiem(){};
    public BangDiem(String maMH, String maSV, String dtx1, String dtx2, String dgk, String dck, String diem10, String diem4, String diemChu, String xepLoai) {
        this.MaMH = maMH;
        this.MaSV = maSV;
        this.DTX1 = dtx1;
        this.DTX2 = dtx2;
        this.DGK = dgk;
        this.DCK = dck;
        this.Diem10 = diem10;
        this.Diem4 = diem4;
        this.DiemChu = diemChu;
        this.XepLoai = xepLoai;
    }
    
    public String getMaMH() {
        return MaMH;
    }
    public void setMaMH(String maMH) {
        this.MaMH = maMH;
    }
    
    public String getMaSV() {
        return MaSV;
    }
    public void setMaSV(String maSV) {
        this.MaSV = maSV;
    }
    
    public String getDTX1() {
        return DTX1;
    }
    public void setDTX1(String dtx1) {
        this.DTX1 = dtx1;
    }
    
    public String getDTX2() {
        return DTX2;
    }
    public void setDTX2(String dtx2) {
        this.DTX2 = dtx2;
    }
    
    public String getDGK() {
        return DGK;
    }
    public void setDGK(String dgk) {
        this.DGK = dgk;
    }
    
    public String getDCK() {
        return DCK;
    }
    public void setDCK(String dck) {
        this.DCK = dck;
    }
    
    public String getDiem10() {
        return Diem10;
    }
    public void setDiem10(String diem10) {
        this.Diem10 = diem10;
    }
    
    public String getDiem4() {
        return Diem4;
    }
    public void setDiem4(String diem4) {
        this.Diem4 = diem4;
    }
    
    public String getDiemChu() {
        return DiemChu;
    }
    public void setDiemChu(String diemChu) {
        this.DiemChu = diemChu;
    }
    
    public String getXepLoai() {
        return XepLoai;
    }
    public void setXepLoai(String xepLoai) {
        this.XepLoai = xepLoai;
    }
    

}

package com.QLKQHT.modal;

public class ChiTietLopHoc {
    private String MaLH;
    private String MaSV;
    
    public ChiTietLopHoc(){};
    public ChiTietLopHoc(String maLH, String maSV) {
        this.MaLH = maLH;
        this.MaSV = maSV;
    }
    
    public String getMaLH() {
        return MaLH;
    }
    public void setMaLH(String maLH) {
        this.MaLH = maLH;
    }
    
    public String getMaSV() {
        return MaSV;
    }
    public void setMaSV(String maSV) {
        this.MaSV = maSV;
    }
    

}

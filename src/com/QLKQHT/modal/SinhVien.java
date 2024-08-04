package com.QLKQHT.modal;

public class SinhVien {
    private String MaSV;
    private String TenSV;
    
    public SinhVien(){};
    public SinhVien(String maSV, String tenSV) {
        this.MaSV = maSV;
        this.TenSV = tenSV;
    }
    
    public String getMaSV() {
        return MaSV;
    }
    public void setMaSV(String maSV) {
        this.MaSV = maSV;
    }
    
    public String getTenSV() {
        return TenSV;
    }
    public void setTenSV(String tenSV) {
        this.TenSV = tenSV;
    }
   
}

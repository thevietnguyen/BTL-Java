package com.QLKQHT.modal;

public class MonHoc {
    private String MaMH;
    private String TenMH;
    private int SoTin;
    private String Khoa;
    private float HSTX1;
    private float HSTX2;
    private float HSGK;
    private float HSCK;
    
    public MonHoc(){};
    public MonHoc(String maMH, String tenMH, int soTin, String khoa, float hstx1, float hstx2, float hsgk, float hsck) {
        this.MaMH = maMH;
        this.TenMH = tenMH;
        this.SoTin = soTin;
        this.Khoa = khoa;
        this.HSTX1 = hstx1;
        this.HSTX2 = hstx2;
        this.HSGK = hsgk;
        this.HSCK = hsck;
    }
    
    public String getMaMH() {
        return MaMH;
    }
    public void setMaMH(String maMH) {
        this.MaMH = maMH;
    }
    
    public String getTenMH() {
        return TenMH;
    }
    public void setTenMH(String tenMH) {
        this.TenMH = tenMH;
    }
    
    public int getSoTin() {
        return SoTin;
    }
    public void setSoTin(int soTin) {
        this.SoTin = soTin;
    }
    
    public String getKhoa() {
        return Khoa;
    }
    public void setKhoa(String khoa) {
        this.Khoa = khoa;
    }
    
    public float getHSTX1() {
        return HSTX1;
    }
    public void setHSTX1(float hstx1) {
        this.HSTX1 = hstx1;
    }
    
    public float getHSTX2() {
        return HSTX2;
    }
    public void setHSTX2(float hstx2) {
        this.HSTX2 = hstx2;
    }
    
    public float getHSGK() {
        return HSGK;
    }
    public void setHSGK(float hsgk) {
        this.HSGK = hsgk;
    }
    
    public float getHSCK() {
        return HSCK;
    }
    public void setHSCK(float hsck) {
        this.HSCK = hsck;
    }
    

}

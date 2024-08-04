package com.QLKQHT.modal;

import java.util.Date;

public class LopHoc {
    private String MaLH;
    private int SiSo;
    private Date NgayBD;
    private Date NgayKT;
    private String MaMH;
    private String MaGV;
    
    public LopHoc(){};
    public LopHoc(String maLH, int siSo, Date ngayBD, Date ngayKT, String maGV, String maMH) {
        this.MaLH = maLH;
        this.SiSo = siSo;
        this.NgayBD = ngayBD;
        this.NgayKT = ngayKT;
        this.MaGV = maGV;
        this.MaMH = maMH;
    }
    
    public String getMaLH() {
        return MaLH;
    }
    public void setMaLH(String maLH) {
        this.MaLH = maLH;
    }
    
     public int getSiSo() {
        return SiSo;
    }
    public void setSiSo(int siSo) {
        this.SiSo = siSo;
    }
    
    public Date getNgayBD() {
        return NgayBD;
    }
    public void setNgayBD(Date ngayBD) {
        this.NgayBD = ngayBD;
    }
    
    public Date getNgayKT() {
        return NgayKT;
    }
    public void setNgayKT(Date ngayKT) {
        this.NgayKT = ngayKT;
    }
    
    public String getMaMH() {
        return MaMH;
    }
    public void setMaMH(String maMH) {
        this.MaMH = maMH;
    }
    
    public String getMaGV() {
        return MaGV;
    }
    public void setMaGV(String maGV) {
        this.MaGV = maGV;
    }
    

}

package com.QLKQHT.modal;

public class BangDiemLopHoc {
    private int STT;
    private SinhVien SV;
    private BangDiem BD;
    private boolean CKB;
    
    public BangDiemLopHoc(){};
    public BangDiemLopHoc(int stt, SinhVien sv, BangDiem bd) {
        this.STT = stt;
        this.SV = sv;
        this.BD = bd;
    }
    
    public int getSTT() {
        return STT;
    }
    
    public void setSTT(int stt) {
        this.STT = stt;
    }
    
    public SinhVien getSV() {
        return SV;
    }
    public void setSV(SinhVien sv) {
        this.SV = sv;
    }
    
    public BangDiem getBD() {
        return BD;
    }
    public void setBD(BangDiem bd) {
        this.BD = bd;
    }
    
    public boolean getCKB() {
        return CKB;
    }
    public void setCKB(boolean ckb) {
        this.CKB = ckb;
    }
    

}

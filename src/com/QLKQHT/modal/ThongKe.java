package com.QLKQHT.modal;

public class ThongKe {
    private LopHoc LH;
    private MonHoc MH;
    private int SoSVCD;
    private int SoSVCCD;
    private int SoSVLG;
    private int SoSVLKG;
    private int SoSVLK;
    private int SoSVLTBK;
    private int SoSVLTB;
    private int SoSVLTBY;
    private int SoSVLY;
    private int SoSVLKEM;
    
    public ThongKe(){};
    public ThongKe(LopHoc lh, MonHoc mh) {
        this.LH = lh;
        this.MH = mh;
    }
    
    public LopHoc getLH() {
       return LH; 
    }
    
    public MonHoc getMH() {
       return MH; 
    }
    
    public int getSoSVCD() {
        return SoSVCD;
    }
    public void setSoSVCD(int ssvcd) {
        this.SoSVCD = ssvcd;
    }
    
    public int getSoSVCCD() {
        return SoSVCCD;
    }
    public void setSoSVCCD(int ssvccd) {
        this.SoSVCCD = ssvccd;
    }
    
    public int getSoSVLG() {
        return SoSVLG;
    }
    public void setSoSVLG(int ssvlg) {
        this.SoSVLG = ssvlg;
    }
    
    public int getSoSVLKG() {
        return SoSVLKG;
    }
    public void setSoSVLKG(int ssvlkg) {
        this.SoSVLKG = ssvlkg;
    }
    
    public int getSoSVLK() {
        return SoSVLK;
    }
    public void setSoSVLK(int ssvlk) {
        this.SoSVLK = ssvlk;
    }
    
    public int getSoSVLTBK() {
        return SoSVLTBK;
    }
    public void setSoSVLTBK(int ssvltbk) {
        this.SoSVLTBK = ssvltbk;
    }
    
    public int getSoSVLTB() {
        return SoSVLTB;
    }
    public void setSoSVLTB(int ssvltb) {
        this.SoSVLTB = ssvltb;
    }
    
    public int getSoSVLTBY() {
        return SoSVLTBY;
    }
    public void setSoSVLTBY(int ssvltby) {
        this.SoSVLTBY = ssvltby;
    }
    
    public int getSoSVLY() {
        return SoSVLY;
    }
    public void setSoSVLY(int ssvly) {
        this.SoSVLY = ssvly;
    }
    
    public int getSoSVLKEM() {
        return SoSVLKEM;
    }
    public void setSoSVLKEM(int ssvlkem) {
        this.SoSVLKEM = ssvlkem;
    }
    

}

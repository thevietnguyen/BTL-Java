package com.QLKQHT.dao;

import com.QLKQHT.modal.BangDiem;
import com.QLKQHT.modal.BangDiemLopHoc;
import com.QLKQHT.modal.MonHoc;
import com.QLKQHT.modal.SinhVien;
import java.util.ArrayList;

public class BangDiemLopHocDao {
    private ArrayList<String> dsIdSV = new ArrayList<>();
    private final ArrayList<BangDiemLopHoc> dsbd = new ArrayList<>();
    private SinhVien sinhVien;
    private BangDiem bangDiem;
    private MonHoc monHoc;
    
    ChiTietLHDao ctlhd = new ChiTietLHDao();
    SinhVienDao svd = new SinhVienDao();
    BangDiemDao bdd = new BangDiemDao();
    
    public ArrayList<BangDiemLopHoc> listTranscriptClass(String maLH) {
        dsIdSV.clear();
        dsIdSV = ctlhd.listIdStudent(maLH);
        bdd.setMonHoc(monHoc);
        
        for (String maSV : dsIdSV) {
            sinhVien = svd.inforStudent(maSV);
            bangDiem = bdd.transcript(maSV);
            BangDiemLopHoc bdlh = new BangDiemLopHoc(dsbd.size()+1, sinhVien, bangDiem);
            dsbd.add(bdlh);
        }
        return dsbd;
    }
    
    public void setMonHoc(MonHoc mh) {
        this.monHoc = mh;
    }
    
}

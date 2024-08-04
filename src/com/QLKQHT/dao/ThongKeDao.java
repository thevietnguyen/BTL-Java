package com.QLKQHT.dao;

import com.QLKQHT.modal.BangDiemLopHoc;
import com.QLKQHT.modal.ThongKe;
import java.util.ArrayList;

public class ThongKeDao {
    private final ArrayList<BangDiemLopHoc> BDLH;
    
    public ThongKeDao(ArrayList<BangDiemLopHoc> bdlh) {
        this.BDLH = bdlh;
    }
    
    public ThongKe TKCT() {
        int svcd = 0;
        int svccd = 0;
        int demGioi = 0;
        int demKG = 0;
        int demKha = 0;
        int demTBK = 0;
        int demTB = 0;
        int demTBY = 0;
        int demYeu = 0;
        int demKem = 0;
        ThongKe thongKe = new ThongKe();
        
        for(BangDiemLopHoc i : BDLH) {
            if("".equals(i.getBD().getDiem10())) {
                svccd++;
            }
            else {
                svcd++;
            }
            
            switch (i.getBD().getXepLoai()) {
                case "Giỏi" -> demGioi++;
                case "Khá giỏi" -> demKG++;
                case "Khá" -> demKha++;
                case "TB khá" -> demTBK++;
                case "Trung bình" -> demTB++;
                case "TB yếu" -> demTBY++;
                case "Yếu" -> demYeu++;
                case "Kém" -> demKem++;
                default -> {
                    break;
                }
            }
        }
        
        thongKe.setSoSVCD(svcd);
        thongKe.setSoSVCCD(svccd);
        thongKe.setSoSVLG(demGioi);
        thongKe.setSoSVLKG(demKG);
        thongKe.setSoSVLK(demKha);
        thongKe.setSoSVLTBK(demTBK);
        thongKe.setSoSVLTB(demTB);
        thongKe.setSoSVLTBY(demTBY);
        thongKe.setSoSVLY(demYeu);
        thongKe.setSoSVLKEM(demKem);
        
        return thongKe;
    }
}

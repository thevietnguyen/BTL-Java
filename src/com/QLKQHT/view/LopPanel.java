package com.QLKQHT.view;

import com.QLKQHT.dao.BangDiemLopHocDao;
import com.QLKQHT.modal.BangDiemLopHoc;
import com.QLKQHT.modal.LopHoc;
import com.QLKQHT.modal.MonHoc;
import java.awt.event.*;
import java.util.ArrayList;
import javax.swing.*;

public class LopPanel extends NewPanel {
    private LopHoc lopHoc;
    private MonHoc monHoc;
    private final ResultPanel resultPanel;
    private ArrayList<BangDiemLopHoc> dsbd = new ArrayList<>();
    private StudentTable studentTable;
    private final int CheckPanel;
    private boolean checkTTL = false;
    BangDiemLopHocDao bdlhd = new BangDiemLopHocDao();
    
    public LopPanel(ResultPanel rp, String str, int checkPanel) {
        super(str);
        this.resultPanel = rp;
        this.CheckPanel = checkPanel;
        setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(170, 170, 170), 2, true));
        
        addMouseListener(new MouseAdapter(){
            @Override
            public void mouseClicked(MouseEvent evt) {
                lopMouseClicked(evt);
            }
        });
    }
    
    private void lopMouseClicked(MouseEvent evt) {
        dsbd.clear();
        bdlhd.setMonHoc(monHoc);
        dsbd = bdlhd.listTranscriptClass(lopHoc.getMaLH());
        if(CheckPanel == 0) {
            try { 
                if (dsbd.isEmpty()) {
                    throw new Exception("Danh sách lớp trống!");
                }

                studentTable = new StudentTable(dsbd, monHoc, checkTTL);
                ResultPanel.currentStudentTable = studentTable;

                resultPanel.setInforPanel(1, lopHoc);
                resultPanel.setControlPanel(1, 0);
                resultPanel.getListPanel().setViewportView(studentTable);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(resultPanel,e.getMessage());
            }
        }
        else if(CheckPanel == 1) {
            try { 
                if (dsbd.isEmpty()) {
                    throw new Exception("Danh sách lớp trống!");
                }
                
                AnalyticsPanel AP = new AnalyticsPanel(lopHoc, monHoc, dsbd);
                resultPanel.setControlPanel(1, 1);
                resultPanel.getListPanel().setViewportView(AP);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(resultPanel,e.getMessage());
            }
        }
    }

    public void setLopHoc(LopHoc lh) {
        this.lopHoc = lh;
    }
    
    public void setMonHoc(MonHoc mh) {
        this.monHoc = mh;
    }
    
    public void setTTL(boolean checkttl) {
        this.checkTTL = checkttl;
    }
}

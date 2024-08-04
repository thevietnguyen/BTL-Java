package com.QLKQHT.view;

import com.QLKQHT.dao.BangDiemDao;
import com.QLKQHT.dao.StudentTableDao;
import com.QLKQHT.modal.BangDiemLopHoc;
import com.QLKQHT.modal.MonHoc;
import static com.QLKQHT.view.ResultPanel.hasChangeDB;
import java.awt.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import javax.swing.*;
import javax.swing.table.TableColumnModel;

public final class StudentTable extends JPanel {
    private JPanel titleJPanel;
    private JTable diemTable;
    private GroupLayout danhSachDiemLayout;
    private int locType = 0, sapXep1 = 0, sapXep2 = 0;
    private String timKiemStr = "";
    private boolean checkGK = false;
    private boolean checkTTL = false;
    private ArrayList<BangDiemLopHoc> list = new ArrayList<>();
    private MonHoc monHoc;
    
    public StudentTable(ArrayList<BangDiemLopHoc> list, MonHoc mh, boolean checkttl) {
        this.list = list;
        this.monHoc = mh;
        this.checkTTL = checkttl;
        
        if(mh.getHSGK() != 0.0) {
            checkGK = true;
        }
        
        setBackground(Color.white);
        titleJPanel = new JPanel();
        initTitileJPanel();
        
        diemTable = new JTable();
        diemTable.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 1, 1, Color.black));
        
        danhSachDiemLayout = new GroupLayout(this);
        setLayout(danhSachDiemLayout);
        
        danhSachDiemLayout.setHorizontalGroup(
            danhSachDiemLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(danhSachDiemLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(danhSachDiemLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(titleJPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE)
                        .addComponent(diemTable, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE))
                    .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        danhSachDiemLayout.setVerticalGroup(
            danhSachDiemLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(danhSachDiemLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(titleJPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(diemTable, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE))
        );
        
        loadTable();
    }

    public void initTitileJPanel() {
        titleJPanel.removeAll();
        titleJPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(1, 0, 1, 1, Color.black));
        titleJPanel.setBackground(Color.white);
        
        FlowLayout layout = new FlowLayout(FlowLayout.LEFT, 0, 0);
        titleJPanel.setLayout(layout);
        
        JLabel ckbPanel = new JLabel("");
        ckbPanel.setPreferredSize(new java.awt.Dimension(44, 40));
        ckbPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        ckbPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel sttPanel = new JLabel("STT");
        sttPanel.setPreferredSize(new java.awt.Dimension(43, 40));
        sttPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        sttPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel msvPanel = new JLabel("Mã sinh viên");
        msvPanel.setPreferredSize(new java.awt.Dimension(104, 40));
        msvPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        msvPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel htenPanel = new JLabel("Họ và tên");
        htenPanel.setPreferredSize(new java.awt.Dimension(184, 40));
        htenPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        htenPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel tx1Panel = new JLabel("Điểm TX1");
        tx1Panel.setPreferredSize(new java.awt.Dimension(84, 40));
        tx1Panel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        tx1Panel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel tx2Panel = new JLabel("Điểm TX2");
        tx2Panel.setPreferredSize(new java.awt.Dimension(84, 40));
        tx2Panel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        tx2Panel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel gkPanel = new JLabel("Điểm giữa kỳ");
        gkPanel.setPreferredSize(new java.awt.Dimension(84, 40));
        gkPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        gkPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel ckPanel = new JLabel("Điểm cuối kỳ");
        ckPanel.setPreferredSize(new java.awt.Dimension(84, 40));
        ckPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        ckPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel he10Panel = new JLabel("Điểm hệ 10");
        he10Panel.setPreferredSize(new java.awt.Dimension(84, 40));
        he10Panel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        he10Panel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel he4Panel = new JLabel("Điểm hệ 4");
        he4Panel.setPreferredSize(new java.awt.Dimension(84, 40));
        he4Panel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        he4Panel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel dcPanel = new JLabel("Điểm chữ");
        dcPanel.setPreferredSize(new java.awt.Dimension(84, 40));
        dcPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        dcPanel.setHorizontalAlignment(JTextField.CENTER);
        
        JLabel xlPanel = new JLabel("Xếp loại");
        xlPanel.setPreferredSize(new java.awt.Dimension(84, 40));
        xlPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 1, 0, 0, Color.black));
        xlPanel.setHorizontalAlignment(JTextField.CENTER);
        
        titleJPanel.add(ckbPanel);
        titleJPanel.add(sttPanel);
        titleJPanel.add(msvPanel);
        titleJPanel.add(htenPanel);
        titleJPanel.add(tx1Panel);
        titleJPanel.add(tx2Panel);
        if(checkGK) {
            titleJPanel.add(gkPanel);
        }
        titleJPanel.add(ckPanel);
        titleJPanel.add(he10Panel);
        titleJPanel.add(he4Panel);
        titleJPanel.add(dcPanel);
        titleJPanel.add(xlPanel);

    }

    public void loadTable() {
        ArrayList<BangDiemLopHoc> bdlh = new ArrayList<>();
        
        switch (locType) {
            case 0 -> {
                for (BangDiemLopHoc tmp : list) {
                    if (TimKiemCheck(tmp)) {
                        bdlh.add(tmp);
                    }
                }
            }
            case 1 -> {
                for (BangDiemLopHoc tmp : list) {
                    if (TimKiemCheck(tmp) && !"".equals(tmp.getBD().getDTX1()) || TimKiemCheck(tmp) && !"".equals(tmp.getBD().getDTX2()) 
                            || TimKiemCheck(tmp) && !"".equals(tmp.getBD().getDCK()) || TimKiemCheck(tmp) && !"".equals(tmp.getBD().getDGK())) {
                        bdlh.add(tmp);
                    }
                }
            }
            case 2 -> {
                for (BangDiemLopHoc tmp : list) {
                    if ((TimKiemCheck(tmp) && tmp.getBD().getDTX1().equals("") && tmp.getBD().getDTX2().equals("") && tmp.getBD().getDCK().equals(""))
                            || (TimKiemCheck(tmp) && tmp.getBD().getDTX1().equals("") && tmp.getBD().getDTX2().equals("") && tmp.getBD().getDCK().equals("") && tmp.getBD().getDGK().equals(""))) {
                        bdlh.add(tmp);
                    }
                }
            }
        }
        
        switch (sapXep1) {
            case 0 -> {
                if(sapXep2 == 0) {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        return bd.getSV().getMaSV();
                    }));
                }
                else {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        return bd.getSV().getMaSV();
                    }).reversed());
                }
            }
            case 1 -> {
                if(sapXep2 == 0) {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        return bd.getSV().getTenSV();
                    }));
                }
                else {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        return bd.getSV().getTenSV();
                    }).reversed());
                }
            }
            case 2 -> {
                if(sapXep2 == 0) {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        String diem10 = bd.getBD().getDiem10();
                        return diem10.isEmpty() ? -1.0 : Float.valueOf(diem10);
                    }));
                }
                else {
                    Collections.sort(bdlh, Comparator.comparing((BangDiemLopHoc bd) -> {
                        String diem10 = bd.getBD().getDiem10();
                        return diem10.isEmpty() ? -1.0 : Float.valueOf(diem10);    
                    }).reversed());
                }
            }
        }
        
        StudentTableDao model = new StudentTableDao(bdlh, checkGK, checkTTL);
        diemTable.setModel(model);

        TableColumnModel columnModel = diemTable.getColumnModel();
        
        columnModel.getColumn(0).setPreferredWidth(40);
        columnModel.getColumn(1).setPreferredWidth(40);
        columnModel.getColumn(2).setPreferredWidth(100);
        columnModel.getColumn(3).setPreferredWidth(180);
        columnModel.getColumn(4).setPreferredWidth(80);
        columnModel.getColumn(5).setPreferredWidth(80); 
        columnModel.getColumn(6).setPreferredWidth(80);
        columnModel.getColumn(7).setPreferredWidth(80);
        columnModel.getColumn(8).setPreferredWidth(80);
        columnModel.getColumn(9).setPreferredWidth(80);
        columnModel.getColumn(10).setPreferredWidth(80);
        if(checkGK) {
            columnModel.getColumn(11).setPreferredWidth(80);
        }
        
        diemTable.setRowHeight(35);
        diemTable.setSelectionBackground(new java.awt.Color(204, 255, 255));
        diemTable.setSelectionForeground(Color.black); 
    }
    
    private Boolean TimKiemCheck(BangDiemLopHoc tmp) {
        return tmp.getSV().getMaSV().toLowerCase().contains(timKiemStr) || tmp.getSV().getTenSV().toLowerCase().contains(timKiemStr);
    }

    public void setLocType(int locType) {
        this.locType = locType;
    }
    
    public void setSapXepType(int sx1, int sx2) {
        this.sapXep1 = sx1;
        this.sapXep2 = sx2;
    }
    
    public void setTimKiemStr(String timKiemStr) {
        this.timKiemStr = timKiemStr;
    }
    
    public void saveDataToDatabase() {        
        if(ResultPanel.hasChangeDB){
            BangDiemDao bdd = new BangDiemDao();
            bdd.setMonHoc(monHoc);
            
            for(BangDiemLopHoc bdlh : list) {
                bdd.score(bdlh.getBD());
                bdd.saveDB(bdlh.getBD(), bdlh.getSV().getMaSV());
            }
            
            hasChangeDB = false;
            loadTable();
            JOptionPane.showMessageDialog(null, "Bảng điểm đã được lưu lại.");
        }
        else {
            JOptionPane.showMessageDialog(null, "Bảng điểm này chưa chỉnh sửa!");
        }
    }
    
    public void deleteDataToDatabase() {
        BangDiemDao bdd = new BangDiemDao();
        bdd.setMonHoc(monHoc);
        
        boolean checkBool = false;
        for(BangDiemLopHoc bdlh : list) {
            if(bdlh.getCKB()) {
                checkBool = true;
                break;
            }
        }
        
        if(checkBool) {
            int option = JOptionPane.showConfirmDialog(null, "Bạn có chắc chắn muốn xóa kết quả của sinh viên không?", "Xác nhận xóa", JOptionPane.YES_NO_OPTION);
            if(option == JOptionPane.YES_OPTION) {
                for(BangDiemLopHoc bdlh : list) {
                    if(bdlh.getCKB()) {
                        bdlh.getBD().setDTX1("");
                        bdlh.getBD().setDTX2("");
                        bdlh.getBD().setDGK("");
                        bdlh.getBD().setDCK("");
                        bdlh.getBD().setDiem10("");
                        bdlh.getBD().setDiem4("");
                        bdlh.getBD().setDiemChu("");
                        bdlh.getBD().setXepLoai("");

                        bdd.saveDB(bdlh.getBD(), bdlh.getSV().getMaSV());
                        bdlh.setCKB(false);
                    }
                }

                loadTable();
                JOptionPane.showMessageDialog(null, "Đã xóa kết quả học tập của sinh viên.");
            }
        }
        else {
            JOptionPane.showMessageDialog(null, "Hãy chọn kết quả của sinh viên cần xóa trước!");
        }
    }
    
    public StudentTable() {};
    
    public void setDSMSV(ArrayList<String> dsmsv) {
    }
}

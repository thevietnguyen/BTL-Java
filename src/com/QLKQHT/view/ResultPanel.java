package com.QLKQHT.view;

import com.QLKQHT.dao.LopHocDao;
import com.QLKQHT.dao.MonHocDao;
import com.QLKQHT.modal.LopHoc;
import com.QLKQHT.modal.MonHoc;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
import javax.swing.event.*;

public class ResultPanel extends javax.swing.JPanel {
    private String MaGV;
    private int CheckPanel;
    private boolean checkTTLop = false; 
    
    MonHocDao mhd = new MonHocDao();
    LopHocDao lhd = new LopHocDao();
    ArrayList<MonHoc> dsmh = new ArrayList<>();
    ArrayList<LopHoc> dslh = new ArrayList<>();
    
    MonPanel monPanel;
    LopPanel tmpPanel;
    /**
     * Creates new form ResultPanel
     */
    public ResultPanel() {
        initComponents();
    }
    
    public ResultPanel(String MaGV, int checkPanel) {
        this.MaGV = MaGV;
        this.CheckPanel = checkPanel;
        dsmh = mhd.listSubject(MaGV);
        
        initComponents();
        initCustomComponents();
        initInforMon();
       
    }
    
    private void initInforMon() {
        DSMonPanel.removeAll();
        DSMonPanel.revalidate();
        DSMonPanel.repaint();
                   
        //Môn học
        ArrayList<JPanel> listMonContainerPanel = new ArrayList<>();
        for(MonHoc i : dsmh) {
            String inforMon = "Môn:  " + i.getMaMH() + " -  " + i.getTenMH();
            monPanel = new MonPanel(inforMon);

            ArrayList<JPanel> listLopPanel = new ArrayList<>();

            Boolean monCheck = i.getMaMH().toLowerCase().contains(timKiemStr) || i.getTenMH().toLowerCase().contains(timKiemStr);
            dslh = lhd.listClassRoom(MaGV, i.getMaMH());
            for(LopHoc j : dslh) {
                tmpPanel = new LopPanel(this, "Lớp: " + j.getMaLH(), CheckPanel);
                Boolean lopCheck = j.getMaLH().toLowerCase().contains(timKiemStr);
     
                tmpPanel.setLopHoc(j);
                tmpPanel.setMonHoc(i);
                if(j.getNgayKT().after(new Date())) {
                    tmpPanel.setTTL(true);
                }
                else {
                    tmpPanel.setTTL(false);
                }
                
                if (lopCheck || monCheck) {
                    listLopPanel.add(tmpPanel);
                }
            }

            //Lớp học
            if (!listLopPanel.isEmpty() || monCheck)  {
                LopContainerPanel lopContainerPanel = new LopContainerPanel(listLopPanel);
                monPanel.setLopContainerPanel(lopContainerPanel);

                ArrayList<JPanel> list = new ArrayList<>();
                list.add(monPanel);
                list.add(lopContainerPanel);

                MonContainerPanel monContainerPanel = new MonContainerPanel(list);

                listMonContainerPanel.add(monContainerPanel);
            }
        }

        if (!listMonContainerPanel.isEmpty()) {
            Iterator<JPanel> iter = listMonContainerPanel.iterator();
            GroupLayout.ParallelGroup PGroup = DanhSachMonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING);
            GroupLayout.SequentialGroup SGroup = DanhSachMonLayout.createSequentialGroup();
            while (iter.hasNext()) {
                JPanel tmp = iter.next();
                PGroup.addComponent(tmp, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE);
                SGroup.addComponent(tmp, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                   .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED);
            }

            DanhSachMonLayout.setHorizontalGroup(
                PGroup
            );
            DanhSachMonLayout.setVerticalGroup(
                DanhSachMonLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(SGroup)
            );

            listPanel.setViewportView(DSMonPanel);
            listPanel.getVerticalScrollBar().setUnitIncrement(8);
            listPanel.getHorizontalScrollBar().setUnitIncrement(8);
            
            if(CheckPanel == 1) {
                inforPanel.setPreferredSize(new Dimension(inforPanel.getPreferredSize().width, 0));
            }
            
            javax.swing.GroupLayout ResultPanelLayout = new javax.swing.GroupLayout(this);
            this.setLayout(ResultPanelLayout);
            ResultPanelLayout.setHorizontalGroup(
                ResultPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(ResultPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(ResultPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(inforPanel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(controlPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(listPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 788, Short.MAX_VALUE))
                    .addContainerGap())
            );
            ResultPanelLayout.setVerticalGroup(
                ResultPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(ResultPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(inforPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addComponent(controlPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                    .addComponent(listPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE)
                    .addContainerGap())
            );
        }
    }
    
    private void initCustomComponents() {
        Loc = new LocPanel();
        Loc.getComboBox().addActionListener((ActionEvent e) -> {
            locChanged();
        });
        
        SapXep = new SapXepPanel();
        SapXep.getComboBox1().addActionListener((ActionEvent e) -> {
            sapXepChanged();
        });
 
        SapXep.getComboBox2().addActionListener((ActionEvent e) -> {
            sapXepChanged();
        });
        
        TimKiem = new TimKiemPanel();
        TimKiem.getTextField().getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                
                timKiemChanged();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                timKiemChanged();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                timKiemChanged();
            }
        });

        QuayLai = new JLabel();
        QuayLai.setCursor(new Cursor(Cursor.HAND_CURSOR));
        QuayLai.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/images/back.png")).getImage().getScaledInstance(22, 22, Image.SCALE_SMOOTH)));                       
        QuayLai.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                QuayLaiMouseClicked(e);
            }
        });
        
        Luu = new JButton();
        Luu.setRolloverEnabled(false);
        Luu.setCursor(new Cursor(Cursor.HAND_CURSOR));
        Luu.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/images/save.png")).getImage().getScaledInstance(18, 18, Image.SCALE_SMOOTH)));                       
        Luu.addActionListener((java.awt.event.ActionEvent evt) -> {
            if(checkTTLop) {
                currentStudentTable.saveDataToDatabase();
            } 
            else {
                JOptionPane.showMessageDialog(null, "Lớp đã kết thúc không thể chỉnh sửa!");
            }
        });
        
        Xoa = new JButton();
        Xoa.setRolloverEnabled(false);
        Xoa.setCursor(new Cursor(Cursor.HAND_CURSOR));
        Xoa.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/images/delete.png")).getImage().getScaledInstance(18, 18, Image.SCALE_SMOOTH)));                       
        Xoa.addActionListener((java.awt.event.ActionEvent evt) -> {
            if(checkTTLop) {
                currentStudentTable.deleteDataToDatabase();
            }
            else {
                JOptionPane.showMessageDialog(null, "Lớp đã kết thúc không thể chỉnh sửa!");
            }
        });
        
        DSMonPanel = new JPanel();
        DSMonPanel.setBackground(new java.awt.Color(255, 255, 255));
        DanhSachMonLayout = new javax.swing.GroupLayout(DSMonPanel);
        DSMonPanel.setLayout(DanhSachMonLayout);
        
        setControlPanel(0, 0);
    }
    
    public void setInforPanel(int layoutIndex, LopHoc lh) {
        this.layoutIndex = layoutIndex;
        if(layoutIndex == 0) {
            titleML.setText("");
            mlLabel.setText("");
            titleSS.setText("");
            ssLabel.setText("");
            titleTT.setText("");   
            ttLabel.setText("");
        }
        else if(layoutIndex == 1) {
            titleML.setText("Mã lớp học:");
            mlLabel.setText(lh.getMaLH().trim());
            titleSS.setText("Sĩ số:");
            ssLabel.setText(String.valueOf(lh.getSiSo()));
            titleTT.setText("Trạng thái:");
            if(lh.getNgayKT().after(new Date())) {
                ttLabel.setText("Đang diễn ra");
                checkTTLop = true;
            }
            else {
                ttLabel.setText("Đã kết thúc");
                checkTTLop = false;
            }         
        }
    }
    
    public void setControlPanel(int layoutIndex, int panelIndex) {
        this.layoutIndex = layoutIndex;
        this.panelIndex = panelIndex;
        TimKiem.getTextField().setText("");
        timKiemChanged();
        
        if (layoutIndex == 0) {
            controlPanel.removeAll();
            controlLayout = new javax.swing.GroupLayout(controlPanel);
            controlPanel.setLayout(controlLayout);
        }
        
        GroupLayout.SequentialGroup SGroup = controlLayout.createSequentialGroup();
        GroupLayout.ParallelGroup PGroup = controlLayout.createParallelGroup(GroupLayout.Alignment.LEADING);
        
        if (layoutIndex == 1) {
            SGroup.addContainerGap()
                    .addComponent(QuayLai, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE);
            PGroup.addComponent(QuayLai, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        }
      
        if (layoutIndex == 1 && CheckPanel == 0) {
            setSapXepModel();
            SGroup.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(SapXep, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(6, 20, 20);
            PGroup.addComponent(SapXep, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        }
        else {
            SGroup.addContainerGap();
        }
        
        if (layoutIndex == 1 && CheckPanel == 0) {
            setLocModel();
            SGroup.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Loc, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(6, 20, 20);
            PGroup.addComponent(Loc, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        }
        else {
            SGroup.addContainerGap();
        }
        
        SGroup.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(TimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE);
        PGroup.addComponent(TimKiem, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        
        if (layoutIndex == 1 && CheckPanel == 1) {
            TimKiem.setPreferredSize(new Dimension(0, 0));
        }
        else if (layoutIndex == 0 && CheckPanel == 1) {
            TimKiem.setPreferredSize(new Dimension(260, 40));
        }
        
        if (layoutIndex == 1 && CheckPanel == 0) {
            SGroup.addGap(6, 10, 150)
                    .addComponent(Xoa, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap();
            PGroup.addComponent(Xoa, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        }
        else {
            SGroup.addContainerGap();
        }
        
        if (layoutIndex == 1 && CheckPanel == 0) {
            SGroup.addGap(6, 10, 10)
                    .addComponent(Luu, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap();
            PGroup.addComponent(Luu, javax.swing.GroupLayout.DEFAULT_SIZE, 40, Short.MAX_VALUE);
        }
        else {
            SGroup.addContainerGap();
        }
        
        controlLayout.setHorizontalGroup(
            controlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SGroup)
        );
        
        controlLayout.setVerticalGroup(
            controlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, controlLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(PGroup)
                .addContainerGap())
        );
    }
    
    private void QuayLaiMouseClicked(MouseEvent e) {
        if (hasChangeDB) {
            int option = JOptionPane.showConfirmDialog(null, "Bảng điểm chưa được lưu!\nBạn có chắc chắn thoát không?", "Xác nhận thoát", JOptionPane.OK_CANCEL_OPTION);
            if(option == JOptionPane.OK_OPTION) {
                setInforPanel(0, new LopHoc());
                setControlPanel(0, 0);
                listPanel.setViewportView(DSMonPanel);
                hasChangeDB = false;
            }
        }
        else {
            setInforPanel(0, new LopHoc());
            setControlPanel(0, 0);
            listPanel.setViewportView(DSMonPanel);
        }
    }
    
    private void timKiemChanged() {
        if(panelIndex == 0 || (panelIndex == 1 && layoutIndex == 0)) {
            timKiemStr = TimKiem.getTextField().getText();
            timKiemStr = timKiemStr.toLowerCase();
        
            switch (layoutIndex) {
                case 0 -> initInforMon();
                case 1 -> {
                    currentStudentTable.setTimKiemStr(timKiemStr);
                    currentStudentTable.loadTable();
                }
                default -> {
                    break;
                }   
            }
        }
    }
    
    private void setLocModel() {
        ArrayList<String> labelList = new ArrayList();
        
        labelList.add("Tất cả");
        labelList.add("Đã có điểm");
        labelList.add("Chưa có điểm");
 
        Loc.setComboBoxModel(labelList);
    }
    
    private void locChanged() {
        int locType = (int) Loc.getComboBox().getSelectedIndex();

        currentStudentTable.setLocType(locType);
        currentStudentTable.loadTable();
    }
    
    private void setSapXepModel() {
        ArrayList<String> labelList1 = new ArrayList();
        ArrayList<String> labelList2 = new ArrayList();
                
        labelList1.add("Mã sinh viên");
        labelList1.add("Họ tên");
        labelList1.add("Điểm hệ 10");
        
        labelList2.add("Tăng dần");
        labelList2.add("Giảm dần");
        
        SapXep.setComboBox1Model(labelList1);
        SapXep.setComboBox2Model(labelList2);
    }
    
    private void sapXepChanged() {
        int sapXep1 = (int) SapXep.getComboBox1().getSelectedIndex();
        int sapXep2 = (int) SapXep.getComboBox2().getSelectedIndex();
        
        currentStudentTable.setSapXepType(sapXep1, sapXep2);
        currentStudentTable.loadTable();
    }    
    
    public JScrollPane getListPanel() {
        return listPanel;
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        inforPanel = new javax.swing.JPanel();
        titleML = new javax.swing.JLabel();
        mlLabel = new javax.swing.JLabel();
        titleSS = new javax.swing.JLabel();
        ssLabel = new javax.swing.JLabel();
        titleTT = new javax.swing.JLabel();
        ttLabel = new javax.swing.JLabel();
        controlPanel = new javax.swing.JPanel();
        listPanel = new javax.swing.JScrollPane();

        setBackground(new java.awt.Color(255, 255, 255));
        setPreferredSize(new java.awt.Dimension(808, 580));

        inforPanel.setBackground(new java.awt.Color(255, 255, 255));
        inforPanel.setForeground(new java.awt.Color(255, 255, 255));
        inforPanel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        titleML.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N

        mlLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        titleSS.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N

        ssLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        titleTT.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N

        ttLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        javax.swing.GroupLayout inforPanelLayout = new javax.swing.GroupLayout(inforPanel);
        inforPanel.setLayout(inforPanelLayout);
        inforPanelLayout.setHorizontalGroup(
            inforPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(inforPanelLayout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(titleML, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(mlLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(110, 110, 110)
                .addComponent(titleSS, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ssLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(70, 70, 70)
                .addComponent(titleTT, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ttLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        inforPanelLayout.setVerticalGroup(
            inforPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(inforPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(inforPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(titleML, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(mlLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(titleTT, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(ttLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 32, Short.MAX_VALUE)
                    .addComponent(titleSS, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(ssLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        controlPanel.setBackground(new java.awt.Color(255, 255, 255));

        javax.swing.GroupLayout controlPanelLayout = new javax.swing.GroupLayout(controlPanel);
        controlPanel.setLayout(controlPanelLayout);
        controlPanelLayout.setHorizontalGroup(
            controlPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 808, Short.MAX_VALUE)
        );
        controlPanelLayout.setVerticalGroup(
            controlPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 42, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(inforPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(controlPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(listPanel)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(inforPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(controlPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(listPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel controlPanel;
    private javax.swing.JPanel inforPanel;
    private javax.swing.JScrollPane listPanel;
    private javax.swing.JLabel mlLabel;
    private javax.swing.JLabel ssLabel;
    private javax.swing.JLabel titleML;
    private javax.swing.JLabel titleSS;
    private javax.swing.JLabel titleTT;
    private javax.swing.JLabel ttLabel;
    // End of variables declaration//GEN-END:variables
    private JButton Luu, Xoa;
    private JLabel QuayLai;
    private TimKiemPanel TimKiem;
    private LocPanel Loc = new LocPanel();
    private SapXepPanel SapXep = new SapXepPanel();
    private int layoutIndex, panelIndex;
    private String timKiemStr = "";
    private GroupLayout controlLayout;
    private GroupLayout DanhSachMonLayout;
    public static JPanel DSMonPanel;
    public static StudentTable currentStudentTable;
    public static Boolean hasChangeDB = false;
}

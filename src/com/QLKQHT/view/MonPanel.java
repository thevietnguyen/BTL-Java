package com.QLKQHT.view;

import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class MonPanel extends NewPanel {
    private LopContainerPanel lopContainerPanel;
    private Boolean hienThiLop;
    private final Color borderColor = new java.awt.Color(110, 110, 110);
    
    public MonPanel(String tenMon) {
        super(tenMon);
        setBorder(javax.swing.BorderFactory.createLineBorder(borderColor, 2, true));
        hienThiLop = false;
        
        addMouseListener(new MouseAdapter(){
            @Override
            public void mouseClicked(MouseEvent evt) {
                monMouseClicked(evt);
            }
        });
    }

    public void setLopContainerPanel(LopContainerPanel lopContainerPanel) {
        this.lopContainerPanel = lopContainerPanel;
        lopContainerPanel.setVisible(hienThiLop);
    }
    
    private void monMouseClicked(MouseEvent evt) {
        hienThiLop = true;
        lopContainerPanel.setVisible(hienThiLop);
    }
}

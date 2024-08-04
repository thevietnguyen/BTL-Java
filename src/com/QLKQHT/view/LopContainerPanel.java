package com.QLKQHT.view;

import java.util.ArrayList;
import javax.swing.*;

public class LopContainerPanel extends JPanel{
    public LopContainerPanel(ArrayList<JPanel> listLopPanel) {
        setBackground(new java.awt.Color(255, 255, 255));
        javax.swing.GroupLayout lopContainerPanelLayout = new javax.swing.GroupLayout(this);
        setLayout(lopContainerPanelLayout);
                
        GroupLayout.ParallelGroup tmpPGroup = lopContainerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false);
        for (int i = 0; i < listLopPanel.size(); i++) {
            if (i != listLopPanel.size() - 1) {
                tmpPGroup.addComponent(listLopPanel.get(i), javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE);
            }
            else tmpPGroup.addComponent(listLopPanel.get(i), javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE);
        }
        lopContainerPanelLayout.setHorizontalGroup(
            lopContainerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(lopContainerPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(tmpPGroup)
                    .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
                
        GroupLayout.SequentialGroup tmpSGroup = lopContainerPanelLayout.createSequentialGroup();
        tmpSGroup.addComponent(listLopPanel.get(0), javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE);
        for (int i = 1; i < listLopPanel.size(); i++) {
            tmpSGroup.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
            .addComponent(listLopPanel.get(i), javax.swing.GroupLayout.DEFAULT_SIZE, 45, Short.MAX_VALUE);
        }
        lopContainerPanelLayout.setVerticalGroup(
            lopContainerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tmpSGroup)
        );
    }
}

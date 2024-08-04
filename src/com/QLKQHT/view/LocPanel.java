package com.QLKQHT.view;

import java.awt.*;
import java.util.ArrayList;
import javax.swing.*;

public class LocPanel extends JPanel{
    private final JLabel label;
    private final JComboBox comboBox;
    public LocPanel() {
        label = new JLabel();
        label.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/images/filter.png")).getImage().getScaledInstance(18, 18, Image.SCALE_SMOOTH)));        
        label.setPreferredSize(new Dimension(40, 18));
        label.setHorizontalAlignment(JLabel.CENTER);
        label.setVerticalAlignment(JLabel.CENTER);  
        
        comboBox = new JComboBox();
        comboBox.setCursor(new Cursor(Cursor.HAND_CURSOR));
        setBackground(Color.white);
        comboBox.setSize(130, 15);
        
        GroupLayout layout = new GroupLayout(this);
        setLayout(layout);
        
        layout.setHorizontalGroup(
           layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(label, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addGap(5, 10, 10)
                    .addComponent(comboBox, GroupLayout.PREFERRED_SIZE, 130, Short.MAX_VALUE)
                    .addContainerGap()
        );
        
        layout.setVerticalGroup(
            layout.createSequentialGroup()
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addComponent(label, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, Short.MAX_VALUE)
                        .addComponent(comboBox, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    )
        );
    }
    
    public void setComboBoxModel(ArrayList<String> modelList) {
        DefaultComboBoxModel model = (DefaultComboBoxModel) comboBox.getModel();
        model.removeAllElements();
        model.addAll(modelList);
        comboBox.setFont(new java.awt.Font("Segoe UI", 0, 14));
        comboBox.setSelectedIndex(0);
    }
    
    public JComboBox getComboBox() {
        return comboBox;
    }
}

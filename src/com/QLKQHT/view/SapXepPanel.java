package com.QLKQHT.view;

import java.awt.*;
import java.util.ArrayList;
import javax.swing.*;

public class SapXepPanel extends JPanel{
    private final JLabel label;
    private final JComboBox comboBox1;
    private final JComboBox comboBox2;

    public SapXepPanel() {
        label = new JLabel();
        label.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/images/arrange.png")).getImage().getScaledInstance(18, 18, Image.SCALE_SMOOTH)));                       
        label.setPreferredSize(new Dimension(40, 18));
        label.setHorizontalAlignment(JLabel.CENTER);
        label.setVerticalAlignment(JLabel.CENTER);
        
        comboBox1 = new JComboBox();
        comboBox1.setCursor(new Cursor(Cursor.HAND_CURSOR));
        setBackground(Color.white);
        comboBox1.setSize(130, 15);
        
        comboBox2 = new JComboBox();
        comboBox2.setCursor(new Cursor(Cursor.HAND_CURSOR));
        setBackground(Color.white);
        comboBox2.setSize(100, 15);
        
        GroupLayout layout = new GroupLayout(this);
        setLayout(layout);
        
        layout.setHorizontalGroup(
           layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(label, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                    .addGap(5, 10, 10)
                    .addComponent(comboBox1, GroupLayout.PREFERRED_SIZE, 130, Short.MAX_VALUE)
                    .addGap(0, 0, 0)
                    .addComponent(comboBox2, GroupLayout.PREFERRED_SIZE, 100, Short.MAX_VALUE)
                    .addContainerGap()
        );
        
        layout.setVerticalGroup(
            layout.createSequentialGroup()
                    .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addComponent(label, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, Short.MAX_VALUE)
                        .addComponent(comboBox1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(comboBox2, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    )
        );
    }
    
    public void setComboBox1Model(ArrayList<String> modelList1) {
        DefaultComboBoxModel model = (DefaultComboBoxModel) comboBox1.getModel();
        model.removeAllElements();
        model.addAll(modelList1);
        comboBox1.setFont(new java.awt.Font("Segoe UI", 0, 14));
        comboBox1.setSelectedIndex(0);
    }
    
    public void setComboBox2Model(ArrayList<String> modelList2) {
        DefaultComboBoxModel model = (DefaultComboBoxModel) comboBox2.getModel();
        model.removeAllElements();
        model.addAll(modelList2);
        comboBox2.setFont(new java.awt.Font("Segoe UI", 0, 14));
        comboBox2.setSelectedIndex(0);
    }
    
    public JComboBox getComboBox1() {
        return comboBox1;
    }
    
    public JComboBox getComboBox2() {
        return comboBox2;
    }
}

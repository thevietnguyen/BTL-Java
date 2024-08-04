package com.QLKQHT.dao;

import com.QLKQHT.modal.BangDiemLopHoc;
import com.QLKQHT.view.ResultPanel;
import java.awt.HeadlessException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.AbstractTableModel;

public class StudentTableDao extends AbstractTableModel{
    private final Class[] mClass = {Boolean.class, Integer.class, String.class, String.class, String.class, String.class, String.class, String.class, String.class, String.class, String.class, String.class};
    private final String[] columnNames1 = {"", "STT", "Mã sinh viên", "Họ và tên", "Điểm TX1", "Điểm TX2", "Diểm giữa kỳ", "Điểm cuối kỳ", "Điểm hệ 10", "Điểm hệ 4", "Điểm chữ", "Xếp loại"};
    private final String[] columnNames2 = {"", "STT", "Mã sinh viên", "Họ và tên", "Điểm TX1", "Điểm TX2", "Điểm cuối kỳ", "Điểm hệ 10", "Điểm hệ 4", "Điểm chữ", "Xếp loại"};
    private boolean checkGK = false;
    private boolean checkTTL = false;
    private boolean isDiem = false;
    private ArrayList<BangDiemLopHoc> list = new ArrayList();
    
    public StudentTableDao(ArrayList<BangDiemLopHoc> listt, boolean checkgk, boolean checkttl) {
        this.list = listt;
        this.checkGK = checkgk;
        this.checkTTL = checkttl;
    }
    
    @Override
    public int getRowCount() {
        return list.size();
    }

    @Override
    public int getColumnCount() {
        if(checkGK) {
            return columnNames1.length;
        }
        else {
            return columnNames2.length;
        }
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        BangDiemLopHoc row = list.get(rowIndex);
        if(checkGK) {
            switch(columnIndex) {
                case 0 -> {
                   return row.getCKB();
                }
                case 1 -> {
                    return row.getSTT();
                }
                case 2 -> {
                    return row.getSV().getMaSV();
                }
                case 3 -> {
                    return row.getSV().getTenSV();
                }
                case 4 -> {
                    return row.getBD().getDTX1();
                }
                case 5 -> {
                    return row.getBD().getDTX2();
                }
                case 6 -> {
                    return row.getBD().getDGK();
                }
                case 7 -> {
                    return row.getBD().getDCK();
                }
                case 8 -> {
                    return row.getBD().getDiem10();
                }
                case 9 -> {
                    return row.getBD().getDiem4();
                }
                case 10 -> {
                    return row.getBD().getDiemChu();
                }
                case 11 -> {
                    return row.getBD().getXepLoai();
                }
                default -> {
                    return null;
                }
            }
        }
        else {
            
            switch(columnIndex) {
                case 0 -> {
                   return row.getCKB();
                }
                case 1 -> {
                    return row.getSTT();
                }
                case 2 -> {
                    return row.getSV().getMaSV();
                }
                case 3 -> {
                    return row.getSV().getTenSV();
                }
                case 4 -> {
                    return row.getBD().getDTX1();
                }
                case 5 -> {
                    return row.getBD().getDTX2();
                }
                case 6 -> {
                    return row.getBD().getDCK();
                }
                case 7 -> {
                    return row.getBD().getDiem10();
                }
                case 8 -> {
                    return row.getBD().getDiem4();
                }
                case 9 -> {
                    return row.getBD().getDiemChu();
                }
                case 10 -> {
                    return row.getBD().getXepLoai();
                } 
                default -> {
                    return null;
                }
            }
        }    
    }

    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        BangDiemLopHoc rowBD = list.get(rowIndex);
        isDiem = false;

        try {
            if(checkGK) {
                switch(columnIndex) {
                    case 0 -> {
                        rowBD.setCKB((Boolean) aValue);
                        break;
                    }
                    case 1 -> {
                        rowBD.setSTT((Integer) aValue);
                        break;
                    }
                    case 2 -> {
                        rowBD.getSV().setMaSV((String) aValue);
                        break;
                    }
                    case 3 -> {
                        rowBD.getSV().setTenSV((String) aValue);
                        break;
                    }
                    case 4 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue%0.5f != 0 || fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDTX1((String) aValue);
                        }
                        break;
                    }
                    case 5 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue%0.5f != 0 || fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDTX2((String) aValue);
                        }
                        break;
                    }
                    case 6 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue%0.5f != 0 || fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDGK((String) aValue);
                        }
                        break;
                    }
                    case 7 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDCK((String) aValue);
                        }
                        break;
                    }
                    case 8 -> {
                        rowBD.getBD().setDiem10((String) aValue);
                        break;
                    }
                    case 9 -> {
                        rowBD.getBD().setDiem4((String) aValue);
                        break;
                    }
                    case 10 -> {
                        rowBD.getBD().setDiemChu((String) aValue);
                        break;
                    }
                    case 11 -> {
                        rowBD.getBD().setXepLoai((String) aValue);
                        break;
                    }
                }
            }
            else {

                switch(columnIndex) {
                    case 0 -> {
                        rowBD.setCKB((Boolean) aValue);
                        break;
                    }
                    case 1 -> {
                        rowBD.setSTT((Integer) aValue);
                        break;
                    }
                    case 2 -> {
                        rowBD.getSV().setMaSV((String) aValue);
                        break;
                    }
                    case 3 -> {
                        rowBD.getSV().setTenSV((String) aValue);
                        break;
                    }
                    case 4 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue%0.5f != 0 || fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDTX1((String) aValue);
                        }
                        break;
                    }
                    case 5 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue%0.5f != 0 || fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDTX2((String) aValue);
                        }
                        break;
                    }
                    case 6 -> {
                        float fValue = Float.parseFloat((String) aValue);
                        if(fValue < 0 || fValue > 10) {
                            isDiem = true;
                        } else {
                            rowBD.getBD().setDCK((String) aValue);
                        }
                        break;
                    }
                    case 7 -> {
                        rowBD.getBD().setDiem10((String) aValue);
                        break;
                    }
                    case 8 -> {
                        rowBD.getBD().setDiem4((String) aValue);
                        break;
                    }
                    case 9 -> {
                        rowBD.getBD().setDiemChu((String) aValue);
                        break;
                    }
                    case 10 -> {
                        rowBD.getBD().setXepLoai((String) aValue);
                        break;
                    }
                }
            }

            if(isDiem) {
                JOptionPane.showMessageDialog(null,"Điểm không hợp lệ!\nĐiểm thường xuyên hoặc giữa kỳ hợp lệ là: [0, 0.5, 1, 1.5,..., 10]\nĐiểm cuối kỳ hợp lệ là: [0,..., 10]");
            } else {
                if(columnIndex != 0) {
                    ResultPanel.hasChangeDB = true;
                }
            }
        } catch(HeadlessException | NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Dữ liệu không hợp lệ!");
        }
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        if(checkTTL) {
            if(checkGK) {
                if(columnIndex == 0 || columnIndex == 4 || columnIndex == 5 || columnIndex == 6 || columnIndex == 7) {
                    return true;
                }
            }
            else {
                if(columnIndex == 0 || columnIndex == 4 || columnIndex == 5 || columnIndex == 6) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return mClass[columnIndex];
    }

    @Override
    public String getColumnName(int column) {
        if(checkGK) {
            return columnNames1[column];
        }
        else {
            return columnNames2[column];
        } 
    }
}

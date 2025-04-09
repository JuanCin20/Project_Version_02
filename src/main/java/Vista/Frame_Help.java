/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import java.awt.Image;
import java.awt.Toolkit;
import javax.swing.table.DefaultTableModel;
import javax.swing.JTable;
import java.util.EventObject;
import java.util.Random;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
// import javax.swing.table.DefaultTableCellRenderer;
// import java.awt.Component;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Point;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author JuanCin20
 */
public class Frame_Help extends javax.swing.JFrame {

    /**
     * Creates new form Frame_Help
     */
    public Frame_Help() {
        initComponents();
        this.setResizable(false);
        this.setLocationRelativeTo(null);
        this.setTitle("Pc - Factory Desktop App: Help");
        this.Initialize_Table();
        this.Show_Table_Header();
        this.Show_Table_Content();
        // this.Show_Table_Color();
        this.Show_Table_Color_Alternative();
        this.Show_Field_Content();
    }

    @Override
    public Image getIconImage() {
        Image Obj_Image = (Toolkit.getDefaultToolkit()).getImage("src//main//java//Imágenes//ToolKit.png");
        return Obj_Image;
    }

    private final DefaultTableModel Obj_DefaultTableModel = new DefaultTableModel();

    private void Initialize_Table() {
        Table_01 = new JTable(Obj_DefaultTableModel) {
            @Override
            public boolean editCellAt(int Row_Index, int Column_Index, EventObject Obj_EventObject) {
                return false;
            }
        };
        ScrollPane_01.setViewportView(Table_01);
        Table_01.setRowSelectionAllowed(true);
        Table_01.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        Table_01.setFont(new Font("Yu Gothic UI", Font.BOLD, 14));
    }

    private void Show_Table_Header() {
        Obj_DefaultTableModel.addColumn("N°");
        Obj_DefaultTableModel.addColumn("Date");
        Obj_DefaultTableModel.addColumn("Random Number");
    }

    private void Show_Table_Content() {
        Obj_DefaultTableModel.setRowCount(0);
        Random Obj_Random = new Random();
        for (int i = 1; i <= 10; i++) {
            int Min_Day = (int) LocalDate.of(1995, 1, 1).toEpochDay();
            int Max_Day = (int) LocalDate.of(2025, 1, 1).toEpochDay();
            long Random_Day = Min_Day + Obj_Random.nextInt(Max_Day - Min_Day);

            LocalDate Obj_LocalDate = LocalDate.ofEpochDay(Random_Day);
            DateTimeFormatter Obj_DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String Fecha_Registro_Usuario = Obj_LocalDate.format(Obj_DateTimeFormatter);

            Obj_DefaultTableModel.addRow(new Object[]{i, Fecha_Registro_Usuario, Obj_Random.nextInt(100)});
        }
    }

    /* private void Function_Table_Color(JTable Obj_JTable, int Column_Index) {
        Obj_JTable.getColumnModel().getColumn(Column_Index).setCellRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable Obj_JTable, Object Obj_Object, boolean Is_Selected, boolean Has_Focus, int Row_Index, int Column_Index) {
                final Component Obj_Component = super.getTableCellRendererComponent(Obj_JTable, Obj_Object, Is_Selected, Has_Focus, Row_Index, Column_Index);
                DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
                int Random_Number = Integer.parseInt((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 2)).toString());
                if (Random_Number >= 50) {
                    Obj_Component.setFont(new Font("Yu Gothic UI", Font.BOLD, 14));
                    Obj_Component.setForeground(Color.BLACK);
                    Obj_Component.setBackground(Color.GREEN);
                } else {
                    if (Random_Number < 50) {
                        Obj_Component.setFont(new Font("Yu Gothic UI", Font.BOLD, 14));
                        Obj_Component.setForeground(Color.WHITE);
                        Obj_Component.setBackground(Color.RED);
                    }
                }
                return Obj_Component;
            }
        });
    } */

 /* private void Show_Table_Color() {
        for (int i = 0; i <= 2; i++) {
            this.Function_Table_Color(Table_01, i);
        }
    } */
    private void Show_Table_Color_Alternative() {
        Table_01.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent Obj_MouseEvent) {
                JTable Obj_JTable = (JTable) Obj_MouseEvent.getSource();
                Point Obj_Point = Obj_MouseEvent.getPoint();
                int Row_Index = Obj_JTable.rowAtPoint(Obj_Point);
                if (Obj_MouseEvent.getClickCount() == 1) {
                    DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

                    int Random_Number = Integer.parseInt((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 2)).toString());

                    if (Random_Number >= 50) {
                        Table_01.setSelectionForeground(Color.BLACK);
                        Table_01.setSelectionBackground(Color.GREEN);
                    } else {
                        if (Random_Number < 50) {
                            Table_01.setSelectionForeground(Color.WHITE);
                            Table_01.setSelectionBackground(Color.RED);
                        }
                    }
                }
            }
        });
    }

    private void Show_Field_Content() {
        Table_01.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent Obj_MouseEvent) {
                JTable Obj_JTable = (JTable) Obj_MouseEvent.getSource();
                Point Obj_Point = Obj_MouseEvent.getPoint();
                int Row_Index = Obj_JTable.rowAtPoint(Obj_Point);
                if (Obj_MouseEvent.getClickCount() == 1) {
                    DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
                    try {
                        String Row_Value = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 1)).toString();
                        SimpleDateFormat Obj_SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        Date Obj_Date = Obj_SimpleDateFormat.parse(Row_Value);
                        DateChooser_01.setDate(Obj_Date);
                    } catch (ParseException Obj_ParseException) {
                        Logger.getLogger(Frame_Help.class.getName()).log(Level.SEVERE, null, Obj_ParseException.getMessage());
                    }
                    // System.out.println("Row_Index: " + Row_Index);
                    // System.out.println("Row_Index: " + Row_Index);
                }
            }
        });
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Panel_01 = new javax.swing.JPanel();
        DateChooser_01 = new com.toedter.calendar.JDateChooser();
        Label_01 = new javax.swing.JLabel();
        ScrollPane_01 = new javax.swing.JScrollPane();
        Table_01 = new javax.swing.JTable();
        Button_01 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setIconImage(getIconImage());

        Panel_01.setBackground(new java.awt.Color(153, 204, 255));
        Panel_01.setMaximumSize(new java.awt.Dimension(2147483647, 2147483647));

        DateChooser_01.setDateFormatString("dd/MM/yyy");
        DateChooser_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        Label_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_01.setForeground(new java.awt.Color(0, 0, 0));
        Label_01.setText("Fecha Seleccionada:");

        Table_01.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        ScrollPane_01.setViewportView(Table_01);

        Button_01.setBackground(new java.awt.Color(51, 204, 0));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setForeground(new java.awt.Color(0, 0, 0));
        Button_01.setText("Generar Fila");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addGap(13, 13, 13)
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_01, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(13, 13, 13))
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addGap(13, 13, 13)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ScrollPane_01, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addComponent(Label_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(13, 13, 13))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Panel_01, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Panel_01, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        Random Obj_Random = new Random();

        int Min_Day = (int) LocalDate.of(1995, 1, 1).toEpochDay();
        int Max_Day = (int) LocalDate.of(2025, 1, 1).toEpochDay();
        long Random_Day = Min_Day + Obj_Random.nextInt(Max_Day - Min_Day);

        LocalDate Obj_LocalDate = LocalDate.ofEpochDay(Random_Day);
        DateTimeFormatter Obj_DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String Fecha_Registro_Usuario = Obj_LocalDate.format(Obj_DateTimeFormatter);

        int Next_Row_Number = (Obj_DefaultTableModel.getRowCount()) + 1;

        Obj_DefaultTableModel.addRow(new Object[]{Next_Row_Number, Fecha_Registro_Usuario, Obj_Random.nextInt(100)});
    }//GEN-LAST:event_Button_01ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Frame_Help.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Frame_Help.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Frame_Help.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Frame_Help.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Frame_Help().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private com.toedter.calendar.JDateChooser DateChooser_01;
    private javax.swing.JLabel Label_01;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JScrollPane ScrollPane_01;
    private javax.swing.JTable Table_01;
    // End of variables declaration//GEN-END:variables
}
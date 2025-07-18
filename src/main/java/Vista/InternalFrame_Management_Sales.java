/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package Vista;

import javax.swing.ImageIcon;
import Controlador.Controlador_Boleta_Venta;
import java.util.Date;
import javax.swing.JOptionPane;
import java.awt.Color;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.plot.PlotOrientation;
import java.net.URI;
import java.nio.file.Paths;
import java.io.File;
import java.awt.Image;
import javax.imageio.ImageIO;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.ChartFrame;
import java.awt.Dimension;
import java.sql.SQLException;
import java.io.IOException;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperCompileManager;
import java.util.Map;
import java.util.HashMap;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.view.JasperViewer;
import net.sf.jasperreports.engine.JRException;

/**
 *
 * @author JuanCin20
 */
public class InternalFrame_Management_Sales extends javax.swing.JInternalFrame {

    /**
     * Creates new form InternalFrame_Management_Sales
     */
    public InternalFrame_Management_Sales() {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: Management Sales");
    }

    private final Controlador_Boleta_Venta Obj_Controlador_Boleta_Venta = new Controlador_Boleta_Venta();

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Panel_01 = new javax.swing.JPanel();
        Label_02 = new javax.swing.JLabel();
        Label_03 = new javax.swing.JLabel();
        DateChooser_01 = new com.toedter.calendar.JDateChooser();
        DateChooser_02 = new com.toedter.calendar.JDateChooser();
        Panel_02 = new javax.swing.JPanel();
        Button_01 = new javax.swing.JButton();
        Button_02 = new javax.swing.JButton();
        Label_01 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Panel_01.setBackground(new java.awt.Color(102, 102, 102));
        Panel_01.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_02.setForeground(new java.awt.Color(255, 255, 255));
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Calendar.png"));
        Label_02.setText("Fecha Inicial:");

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//Calendar.png"));
        Label_03.setText("Fecha Final:");

        DateChooser_01.setDateFormatString("dd/MM/yyyy");
        DateChooser_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        DateChooser_02.setDateFormatString("dd/MM/yyyy");
        DateChooser_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_02, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_02, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 20, -1, 90));

        Panel_02.setBackground(new java.awt.Color(102, 102, 102));
        Panel_02.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Button_01.setBackground(new java.awt.Color(51, 204, 0));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setText("Graficar Ventas");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        Button_02.setBackground(new java.awt.Color(255, 255, 153));
        Button_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_02.setText("Generar Reporte");
        Button_02.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_02ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_02Layout = new javax.swing.GroupLayout(Panel_02);
        Panel_02.setLayout(Panel_02Layout);
        Panel_02Layout.setHorizontalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_02Layout.setVerticalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 20, -1, 90));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_04.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 620, 130));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        Date Obj_Date_01 = DateChooser_01.getDate();
        Date Obj_Date_02 = DateChooser_02.getDate();

        if (Obj_Date_01 == null) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha Inicial.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            DateChooser_01.setBackground(Color.RED);
        } else {
            if (Obj_Date_02 == null) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha Final.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                DateChooser_02.setBackground(Color.RED);
            } else {
                if (Obj_Date_01.after(Obj_Date_02)) {
                    JOptionPane.showMessageDialog(null, "Las Fechas Deben ser Ingresadas de Manera Ascendente.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    DateChooser_01.setCalendar(null);
                    DateChooser_01.setBackground(Color.RED);
                } else {
                    DateChooser_01.setBackground(Color.GREEN);
                    DateChooser_02.setBackground(Color.GREEN);

                    SimpleDateFormat Obj_SimpleDateFormat_01 = new SimpleDateFormat("dd/MM/yyyy");
                    String Fecha_Boleta_Venta_Inicial = Obj_SimpleDateFormat_01.format(Obj_Date_01);
                    SimpleDateFormat Obj_SimpleDateFormat_02 = new SimpleDateFormat("dd/MM/yyyy");
                    String Fecha_Boleta_Venta_Final = Obj_SimpleDateFormat_02.format(Obj_Date_02);

                    try {
                        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = Obj_Controlador_Boleta_Venta.ArrayList_ArrayList_Object_01(Fecha_Boleta_Venta_Inicial, Fecha_Boleta_Venta_Final);

                        if (Obj_ArrayList_ArrayList_Object.isEmpty()) {
                            JOptionPane.showMessageDialog(null, "No Existen Datos Informativos Registrados para Generar el Gráfico de Ventas.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                        } else {
                            DefaultCategoryDataset Obj_DefaultCategoryDataset = new DefaultCategoryDataset();

                            for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
                                Obj_DefaultCategoryDataset.setValue((int) (Obj_ArrayList_ArrayList_Object.get(i)).get(1), "Sale_Number", (String) (Obj_ArrayList_ArrayList_Object.get(i)).get(0));
                            }

                            JFreeChart Obj_JFreeChart = ChartFactory.createBarChart("Sale_Graphic", "Sale_Date", "Sale_Number", Obj_DefaultCategoryDataset, PlotOrientation.VERTICAL, true, true, false);

                            URI Obj_URI_01 = (Paths.get("src//main//java//Imágenes//Wallpaper_03.png")).toUri();
                            File Obj_File_01 = new File(Obj_URI_01);
                            Image Obj_Image_01 = ImageIO.read(Obj_File_01);
                            Obj_JFreeChart.setBackgroundImage(Obj_Image_01);

                            Obj_JFreeChart.getTitle().setPaint(Color.BLACK);

                            CategoryPlot Obj_CategoryPlot = Obj_JFreeChart.getCategoryPlot();

                            Obj_CategoryPlot.setRangeGridlinePaint(Color.BLUE);

                            BarRenderer Obj_BarRenderer = (BarRenderer) Obj_CategoryPlot.getRenderer();
                            Color Obj_Color = new Color(153, 204, 255);
                            Obj_BarRenderer.setSeriesPaint(0, Obj_Color);

                            ChartFrame Obj_ChartFrame = new ChartFrame("Pc - Factory Desktop App: Sale Graphic", Obj_JFreeChart);

                            // Obj_ChartFrame.setLocationRelativeTo(null);
                            URI Obj_URI_02 = (Paths.get("src//main//java//Imágenes//ToolKit.png")).toUri();
                            File Obj_File_02 = new File(Obj_URI_02);
                            Image Obj_Image_02 = ImageIO.read(Obj_File_02);
                            Obj_ChartFrame.setIconImage(Obj_Image_02);

                            Obj_ChartFrame.setSize(new Dimension(450, 350));
                            Obj_ChartFrame.setVisible(true);
                        }
                    } catch (SQLException | ClassNotFoundException | IOException Obj_SQLException_ClassNotFoundException_IOException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException_IOException.getMessage());
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        Date Obj_Date_01 = DateChooser_01.getDate();
        Date Obj_Date_02 = DateChooser_02.getDate();

        if (Obj_Date_01 == null) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha Inicial.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            DateChooser_01.setBackground(Color.RED);
        } else {
            if (Obj_Date_02 == null) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha Final.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                DateChooser_02.setBackground(Color.RED);
            } else {
                if (Obj_Date_01.after(Obj_Date_02)) {
                    JOptionPane.showMessageDialog(null, "Las Fechas Deben ser Ingresadas de Manera Ascendente.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    DateChooser_01.setCalendar(null);
                    DateChooser_01.setBackground(Color.RED);
                } else {
                    DateChooser_01.setBackground(Color.GREEN);
                    DateChooser_02.setBackground(Color.GREEN);

                    SimpleDateFormat Obj_SimpleDateFormat_01 = new SimpleDateFormat("dd/MM/yyyy");
                    String Fecha_Boleta_Venta_Inicial = Obj_SimpleDateFormat_01.format(Obj_Date_01);
                    SimpleDateFormat Obj_SimpleDateFormat_02 = new SimpleDateFormat("dd/MM/yyyy");
                    String Fecha_Boleta_Venta_Final = Obj_SimpleDateFormat_02.format(Obj_Date_02);

                    try {
                        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = Obj_Controlador_Boleta_Venta.ArrayList_ArrayList_Object_02(Fecha_Boleta_Venta_Inicial, Fecha_Boleta_Venta_Final);

                        if (Obj_ArrayList_ArrayList_Object.isEmpty()) {
                            JOptionPane.showMessageDialog(null, "No Existen Datos Informativos Registrados para Generar el Reporte de Ventas.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                        } else {
                            String Report_Path = "src//main//java//Report//Sale_Report.jrxml";
                            JasperReport Obj_JasperReport = JasperCompileManager.compileReport(Report_Path);
                            Map Obj_Map = new HashMap();
                            Obj_Map.put("Parameter_01", Fecha_Boleta_Venta_Inicial);
                            Obj_Map.put("Parameter_02", Fecha_Boleta_Venta_Final);
                            JasperPrint Obj_JasperPrint = JasperFillManager.fillReport(Obj_JasperReport, Obj_Map, MySQL_Connection.Obj_Connection);
                            JasperViewer.viewReport(Obj_JasperPrint, false);
                        }
                    } catch (SQLException | ClassNotFoundException | JRException Obj_SQLException_ClassNotFoundException_JRException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException_JRException.getMessage());
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_02ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private com.toedter.calendar.JDateChooser DateChooser_01;
    private com.toedter.calendar.JDateChooser DateChooser_02;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    // End of variables declaration//GEN-END:variables
}
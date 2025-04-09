/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package Vista;

import javax.swing.ImageIcon;
import javax.swing.UIManager;
import Controlador.Controlador_Marca_Producto;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.awt.Color;
import javax.swing.JOptionPane;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.SQLException;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
import Modelo.Modelo_Marca_Producto;

/**
 *
 * @author JuanCin20
 */
public class InternalFrame_New_Product_Brand extends javax.swing.JInternalFrame {

    /**
     * Creates new form InternalFrame_New_Product_Brand
     */
    public InternalFrame_New_Product_Brand() {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: New Product Brand");
        UIManager.put("OptionPane.okButtonText", "Aceptar");
        UIManager.put("OptionPane.cancelButtonText", "Cancelar");
    }

    private final Controlador_Marca_Producto Obj_Controlador_Marca_Producto = new Controlador_Marca_Producto();

    private boolean Validate_Telefono_Marca_Producto(String Telefono_Marca_Producto) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Telefono_Marca_Producto);
        return Obj_Matcher.find();
    }

    private boolean Validate_E_Mail_Marca_Producto(String E_Mail_Marca_Producto) {
        Pattern Obj_Pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(E_Mail_Marca_Producto);
        return Obj_Matcher.find();
    }

    private void Show_Confirm_Dialog() {
        InternalFrame_New_Product_Brand Obj_InternalFrame_New_Product_Brand = new InternalFrame_New_Product_Brand();
        TextField_01.setBackground(Color.BLUE);
        TextField_01.setText("");
        TextField_02.setBackground(Color.BLUE);
        TextField_02.setText("");
        TextField_03.setBackground(Color.BLUE);
        TextField_03.setText("");
        TextField_04.setBackground(Color.BLUE);
        TextField_04.setText("");

        int Option_Selected = JOptionPane.showConfirmDialog(null, "Marca del Producto Registrada Correctamente.", "Información", JOptionPane.CLOSED_OPTION, JOptionPane.INFORMATION_MESSAGE);

        switch (Option_Selected) {
            case -1 -> {
                this.dispose();
                Frame_Administrator.DesktopPane_01.add(Obj_InternalFrame_New_Product_Brand);
                Obj_InternalFrame_New_Product_Brand.setVisible(true);
                System.out.println("Option_Selected: " + Option_Selected);
            }
            case 0 -> {
                this.dispose();
                Frame_Administrator.DesktopPane_01.add(Obj_InternalFrame_New_Product_Brand);
                Obj_InternalFrame_New_Product_Brand.setVisible(true);
                System.out.println("Option_Selected: " + Option_Selected);
            }
            default ->
                System.out.println("Switch_Default_Case");
        }
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
        Label_02 = new javax.swing.JLabel();
        Label_03 = new javax.swing.JLabel();
        Label_04 = new javax.swing.JLabel();
        Label_05 = new javax.swing.JLabel();
        TextField_01 = new javax.swing.JTextField();
        TextField_02 = new javax.swing.JTextField();
        TextField_03 = new javax.swing.JTextField();
        TextField_04 = new javax.swing.JTextField();
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
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Brand.png"));
        Label_02.setText("Nombre:");

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//Brand.png"));
        Label_03.setText("Teléfono:");

        Label_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_04.setForeground(new java.awt.Color(255, 255, 255));
        Label_04.setIcon(new ImageIcon("src//main//java//Imágenes//Brand.png"));
        Label_04.setText("Correo Electrónico:");

        Label_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_05.setForeground(new java.awt.Color(255, 255, 255));
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//Brand.png"));
        Label_05.setText("Dirección:");

        TextField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TextField_01, javax.swing.GroupLayout.DEFAULT_SIZE, 260, Short.MAX_VALUE)
                    .addComponent(TextField_02)
                    .addComponent(TextField_03)
                    .addComponent(TextField_04))
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 30, 460, 194));

        Panel_02.setBackground(new java.awt.Color(102, 102, 102));
        Panel_02.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Button_01.setBackground(new java.awt.Color(51, 204, 0));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setText("Insertar");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        Button_02.setBackground(new java.awt.Color(255, 0, 0));
        Button_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_02.setText("Volver");
        Button_02.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_02ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_02Layout = new javax.swing.GroupLayout(Panel_02);
        Panel_02.setLayout(Panel_02Layout);
        Panel_02Layout.setHorizontalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_02Layout.setVerticalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 90, 120, 80));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_03.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 740, 260));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        if ((TextField_01.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Nombre de la Marca del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_01.setBackground(Color.RED);
            TextField_01.requestFocus();
        } else {
            if ((TextField_02.getText()).isEmpty() == true) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Teléfono de la Marca del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_02.setBackground(Color.RED);
                TextField_02.requestFocus();
            } else {
                if ((TextField_03.getText()).isEmpty() == true) {
                    JOptionPane.showMessageDialog(null, "Campo Requerido: Correo Electrónico de la Marca del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextField_03.setBackground(Color.RED);
                    TextField_03.requestFocus();
                } else {
                    if ((TextField_04.getText()).isEmpty() == true) {
                        JOptionPane.showMessageDialog(null, "Campo Requerido: Dirección de la Marca del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                        TextField_04.setBackground(Color.RED);
                        TextField_04.requestFocus();
                    } else {
                        String Nombre_Marca_Producto = (TextField_01.getText()).trim();
                        String Telefono_Marca_Producto = (TextField_02.getText()).trim();
                        String E_Mail_Marca_Producto = (TextField_03.getText()).trim();
                        String Direccion_Marca_Producto = (TextField_04.getText()).trim();

                        LocalDateTime Obj_LocalDateTime = LocalDateTime.now();
                        DateTimeFormatter Obj_DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        String Fecha_Registro_Marca_Producto = Obj_LocalDateTime.format(Obj_DateTimeFormatter);

                        if ((Nombre_Marca_Producto.length()) > 50) {
                            JOptionPane.showMessageDialog(null, "El Nombre debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_01.setBackground(Color.RED);
                            TextField_01.setText("");
                            TextField_01.requestFocus();
                        } else {
                            try {
                                if (Obj_Controlador_Marca_Producto.Check_Nombre_Marca_Producto(Nombre_Marca_Producto) == true) {
                                    JOptionPane.showMessageDialog(null, "El Nombre ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                    TextField_01.setBackground(Color.RED);
                                    TextField_01.setText("");
                                    TextField_01.requestFocus();
                                } else {
                                    TextField_01.setBackground(Color.GREEN);
                                    System.out.println("Nombre_Marca_Producto: Ok!.");
                                }
                            } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                            }
                        }

                        if (this.Validate_Telefono_Marca_Producto(Telefono_Marca_Producto) == false) {
                            JOptionPane.showMessageDialog(null, "Ingrese un Teléfono Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_02.setBackground(Color.RED);
                            TextField_02.setText("");
                            TextField_02.requestFocus();
                        } else {
                            if ((Telefono_Marca_Producto.length()) != 9) {
                                JOptionPane.showMessageDialog(null, "El Teléfono debe Contener 9 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                TextField_02.setBackground(Color.RED);
                                TextField_02.setText("");
                                TextField_02.requestFocus();
                            } else {
                                try {
                                    if (Obj_Controlador_Marca_Producto.Check_Telefono_Marca_Producto(Telefono_Marca_Producto) == true) {
                                        JOptionPane.showMessageDialog(null, "El Teléfono ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                        TextField_02.setBackground(Color.RED);
                                        TextField_02.setText("");
                                        TextField_02.requestFocus();
                                    } else {
                                        TextField_02.setBackground(Color.GREEN);
                                        System.out.println("Telefono_Marca_Producto: Ok!.");
                                    }
                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                }
                            }
                        }

                        if (this.Validate_E_Mail_Marca_Producto(E_Mail_Marca_Producto) == false) {
                            JOptionPane.showMessageDialog(null, "Ingrese un Correo Electrónico Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_03.setBackground(Color.RED);
                            TextField_03.setText("");
                            TextField_03.requestFocus();
                        } else {
                            if ((E_Mail_Marca_Producto.length()) > 50) {
                                JOptionPane.showMessageDialog(null, "El Correo Electrónico debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                TextField_03.setBackground(Color.RED);
                                TextField_03.setText("");
                                TextField_03.requestFocus();
                            } else {
                                try {
                                    if (Obj_Controlador_Marca_Producto.Check_E_Mail_Marca_Producto(E_Mail_Marca_Producto) == true) {
                                        JOptionPane.showMessageDialog(null, "El Correo Electrónico ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                        TextField_03.setBackground(Color.RED);
                                        TextField_03.setText("");
                                        TextField_03.requestFocus();
                                    } else {
                                        TextField_03.setBackground(Color.GREEN);
                                        System.out.println("E_Mail_Marca_Producto: Ok!.");
                                    }
                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                }
                            }
                        }

                        if ((Direccion_Marca_Producto.length()) > 50) {
                            JOptionPane.showMessageDialog(null, "La Dirección debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_04.setBackground(Color.RED);
                            TextField_04.setText("");
                            TextField_04.requestFocus();
                        } else {
                            try {
                                if (Obj_Controlador_Marca_Producto.Check_Nombre_Marca_Producto(Direccion_Marca_Producto) == true) {
                                    JOptionPane.showMessageDialog(null, "La Dirección ya se Encuentra Registrada en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                    TextField_04.setBackground(Color.RED);
                                    TextField_04.setText("");
                                    TextField_04.requestFocus();
                                } else {
                                    TextField_04.setBackground(Color.GREEN);
                                    System.out.println("Direccion_Marca_Producto: Ok!.");
                                }
                            } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                            }
                        }

                        if ((TextField_01.getText()).isEmpty() == true || (TextField_02.getText()).isEmpty() == true || (TextField_03.getText()).isEmpty() == true || (TextField_04.getText()).isEmpty() == true) {
                            System.out.println("Try Again!");
                        } else {
                            Modelo_Marca_Producto Obj_Modelo_Marca_Producto = new Modelo_Marca_Producto();

                            Obj_Modelo_Marca_Producto.setNombre_Marca_Producto(Nombre_Marca_Producto);
                            Obj_Modelo_Marca_Producto.setTelefono_Marca_Producto(Integer.parseInt(Telefono_Marca_Producto));
                            Obj_Modelo_Marca_Producto.setE_Mail_Marca_Producto(E_Mail_Marca_Producto);
                            Obj_Modelo_Marca_Producto.setDireccion_Marca_Producto(Direccion_Marca_Producto);
                            Obj_Modelo_Marca_Producto.setEstado_Marca_Producto(true);
                            Obj_Modelo_Marca_Producto.setFecha_Registro_Marca_Producto(Fecha_Registro_Marca_Producto);

                            try {
                                if (Obj_Controlador_Marca_Producto.Insertar_Marca_Producto(Obj_Modelo_Marca_Producto) == true) {
                                    this.Show_Confirm_Dialog();
                                } else {
                                    JOptionPane.showMessageDialog(null, "Error al Registrar la Marca del Producto.", "Error", JOptionPane.ERROR_MESSAGE);
                                }
                            } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                            }
                        }
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_Button_02ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_04;
    private javax.swing.JLabel Label_05;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JTextField TextField_01;
    private javax.swing.JTextField TextField_02;
    private javax.swing.JTextField TextField_03;
    private javax.swing.JTextField TextField_04;
    // End of variables declaration//GEN-END:variables
}
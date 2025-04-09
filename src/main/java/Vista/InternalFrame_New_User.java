/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package Vista;

import javax.swing.ImageIcon;
import javax.swing.UIManager;
import Controlador.Controlador_Usuario;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.awt.Color;
import javax.swing.JOptionPane;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.SQLException;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
import Modelo.Modelo_Usuario;
import Encryption.Encryption;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.BadPaddingException;

/**
 *
 * @author JuanCin20
 */
public class InternalFrame_New_User extends javax.swing.JInternalFrame {

    /**
     * Creates new form InternalFrame_New_Employee
     */
    public InternalFrame_New_User() {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: New User");
        PasswordField_01.setEchoChar('\u25cf');
        PasswordField_02.setEchoChar('\u25cf');
        UIManager.put("OptionPane.okButtonText", "Aceptar");
        UIManager.put("OptionPane.cancelButtonText", "Cancelar");
    }

    private final Controlador_Usuario Obj_Controlador_Usuario = new Controlador_Usuario();

    private boolean Validate_DNI_Usuario(String DNI_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(DNI_Usuario);
        return Obj_Matcher.find();
    }

    private boolean Validate_E_Mail_Usuario(String E_Mail_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(E_Mail_Usuario);
        return Obj_Matcher.find();
    }

    private boolean Validate_Password_Usuario(String Password_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,20}$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Password_Usuario);
        return Obj_Matcher.find();
    }

    private boolean Validate_Nombre_Usuario(String Nombre_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Nombre_Usuario);
        return Obj_Matcher.find();
    }

    private boolean Validate_Apellido_Usuario(String Apellido_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1\\u00E0-\\u00FC]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Apellido_Usuario);
        return Obj_Matcher.find();
    }

    private boolean Validate_Telefono_Usuario(String Telefono_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Telefono_Usuario);
        return Obj_Matcher.find();
    }

    private void Show_Confirm_Dialog() {
        InternalFrame_New_User Obj_InternalFrame_New_User = new InternalFrame_New_User();
        TextField_01.setBackground(Color.BLUE);
        TextField_01.setText("");
        TextField_02.setBackground(Color.BLUE);
        TextField_02.setText("");
        PasswordField_01.setBackground(Color.BLUE);
        PasswordField_01.setText("");
        PasswordField_02.setBackground(Color.BLUE);
        PasswordField_02.setText("");
        TextField_03.setBackground(Color.BLUE);
        TextField_03.setText("");
        TextField_04.setBackground(Color.BLUE);
        TextField_04.setText("");
        TextField_05.setBackground(Color.BLUE);
        TextField_05.setText("");
        TextField_06.setBackground(Color.BLUE);
        TextField_06.setText("");
        DateChooser_01.setBackground(Color.BLUE);
        DateChooser_01.setCalendar(null);

        int Option_Selected = JOptionPane.showConfirmDialog(null, "Usuario Registrado Correctamente.", "Información", JOptionPane.CLOSED_OPTION, JOptionPane.INFORMATION_MESSAGE);

        switch (Option_Selected) {
            case -1 -> {
                this.dispose();
                Frame_Administrator.DesktopPane_01.add(Obj_InternalFrame_New_User);
                Obj_InternalFrame_New_User.setVisible(true);
                System.out.println("Option_Selected: " + Option_Selected);
            }
            case 0 -> {
                this.dispose();
                Frame_Administrator.DesktopPane_01.add(Obj_InternalFrame_New_User);
                Obj_InternalFrame_New_User.setVisible(true);
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
        Label_03 = new javax.swing.JLabel();
        Label_04 = new javax.swing.JLabel();
        Label_05 = new javax.swing.JLabel();
        Label_06 = new javax.swing.JLabel();
        Label_07 = new javax.swing.JLabel();
        Label_08 = new javax.swing.JLabel();
        Label_09 = new javax.swing.JLabel();
        Label_10 = new javax.swing.JLabel();
        Label_11 = new javax.swing.JLabel();
        TextField_01 = new javax.swing.JTextField();
        TextField_02 = new javax.swing.JTextField();
        PasswordField_01 = new javax.swing.JPasswordField();
        PasswordField_02 = new javax.swing.JPasswordField();
        CheckBox_01 = new javax.swing.JCheckBox();
        CheckBox_02 = new javax.swing.JCheckBox();
        TextField_03 = new javax.swing.JTextField();
        TextField_04 = new javax.swing.JTextField();
        TextField_05 = new javax.swing.JTextField();
        TextField_06 = new javax.swing.JTextField();
        DateChooser_01 = new com.toedter.calendar.JDateChooser();
        Panel_02 = new javax.swing.JPanel();
        Button_01 = new javax.swing.JButton();
        Button_02 = new javax.swing.JButton();
        Label_01 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Panel_01.setBackground(new java.awt.Color(102, 102, 102));
        Panel_01.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_03.setText("Documento Nacional de Identidad:");

        Label_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_04.setForeground(new java.awt.Color(255, 255, 255));
        Label_04.setIcon(new ImageIcon("src//main//java//Imágenes//E_Mail.png"));
        Label_04.setText("Correo Electrónico:");

        Label_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_05.setForeground(new java.awt.Color(255, 255, 255));
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//Password.png"));
        Label_05.setText("Contraseña:");

        Label_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_06.setForeground(new java.awt.Color(255, 255, 255));
        Label_06.setIcon(new ImageIcon("src//main//java//Imágenes//Password.png"));
        Label_06.setText("Repetir Contraseña:");

        Label_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_07.setForeground(new java.awt.Color(255, 255, 255));
        Label_07.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_07.setText("Nombres:");

        Label_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_08.setForeground(new java.awt.Color(255, 255, 255));
        Label_08.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_08.setText("Apellidos:");

        Label_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_09.setForeground(new java.awt.Color(255, 255, 255));
        Label_09.setIcon(new ImageIcon("src//main//java//Imágenes//Phone.png"));
        Label_09.setText("Teléfono:");

        Label_10.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_10.setForeground(new java.awt.Color(255, 255, 255));
        Label_10.setIcon(new ImageIcon("src//main//java//Imágenes//Address.png"));
        Label_10.setText("Dirección:");

        Label_11.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_11.setForeground(new java.awt.Color(255, 255, 255));
        Label_11.setIcon(new ImageIcon("src//main//java//Imágenes//Calendar.png"));
        Label_11.setText("Fecha de Nacimiento:");

        TextField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        PasswordField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        PasswordField_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        CheckBox_01.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                CheckBox_01MouseClicked(evt);
            }
        });

        CheckBox_02.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                CheckBox_02MouseClicked(evt);
            }
        });

        TextField_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        DateChooser_01.setDateFormatString("dd/MM/yyyy");
        DateChooser_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_11, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(Panel_01Layout.createSequentialGroup()
                                .addComponent(PasswordField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(CheckBox_01))
                            .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(Panel_01Layout.createSequentialGroup()
                                .addComponent(PasswordField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(CheckBox_02))
                            .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_06, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_05, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addComponent(CheckBox_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(CheckBox_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(PasswordField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(PasswordField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_11, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, 600, -1));

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
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
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

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 210, 120, 80));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_03.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 770, 470));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        Date Obj_Date = DateChooser_01.getDate();

        if ((TextField_01.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Documento Nacional de Identidad del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_01.setBackground(Color.RED);
            TextField_01.requestFocus();
        } else {
            if ((TextField_02.getText()).isEmpty() == true) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Correo Electrónico del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_02.setBackground(Color.RED);
                TextField_02.requestFocus();
            } else {
                if ((String.valueOf(PasswordField_01.getPassword())).isEmpty() == true) {
                    JOptionPane.showMessageDialog(null, "Campo Requerido: Contraseña 01 del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    PasswordField_01.setBackground(Color.RED);
                    PasswordField_01.requestFocus();
                } else {
                    if ((String.valueOf(PasswordField_02.getPassword())).isEmpty() == true) {
                        JOptionPane.showMessageDialog(null, "Campo Requerido: Contraseña 02 del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                        PasswordField_02.setBackground(Color.RED);
                        PasswordField_02.requestFocus();
                    } else {
                        if ((TextField_03.getText()).isEmpty() == true) {
                            JOptionPane.showMessageDialog(null, "Campo Requerido: Nombres del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_03.setBackground(Color.RED);
                            TextField_03.requestFocus();
                        } else {
                            if ((TextField_04.getText()).isEmpty() == true) {
                                JOptionPane.showMessageDialog(null, "Campo Requerido: Apellidos del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                TextField_04.setBackground(Color.RED);
                                TextField_04.requestFocus();
                            } else {
                                if ((TextField_05.getText()).isEmpty() == true) {
                                    JOptionPane.showMessageDialog(null, "Campo Requerido: Teléfono del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                    TextField_05.setBackground(Color.RED);
                                    TextField_05.requestFocus();
                                } else {
                                    if ((TextField_06.getText()).isEmpty() == true) {
                                        JOptionPane.showMessageDialog(null, "Campo Requerido: Dirección del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                        TextField_06.setBackground(Color.RED);
                                        TextField_06.requestFocus();
                                    } else {
                                        if (Obj_Date == null) {
                                            JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha de Nacimiento del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            DateChooser_01.setBackground(Color.RED);
                                        } else {
                                            DateChooser_01.setBackground(Color.GREEN);

                                            String DNI_Usuario = (TextField_01.getText()).trim();
                                            String E_Mail_Usuario = (TextField_02.getText()).trim();
                                            String Password_Usuario_Decrypted_01 = (String.valueOf(PasswordField_01.getPassword())).trim();
                                            String Password_Usuario_Decrypted_02 = (String.valueOf(PasswordField_02.getPassword())).trim();
                                            String Nombre_Usuario = (TextField_03.getText()).trim();
                                            String Apellido_Usuario = (TextField_04.getText()).trim();
                                            String Telefono_Usuario = (TextField_05.getText()).trim();
                                            String Direccion_Usuario = (TextField_06.getText()).trim();

                                            SimpleDateFormat Obj_SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                            String Fecha_Nacimiento_Usuario = Obj_SimpleDateFormat.format(Obj_Date);

                                            LocalDateTime Obj_LocalDateTime = LocalDateTime.now();
                                            DateTimeFormatter Obj_DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                                            String Fecha_Registro_Usuario = Obj_LocalDateTime.format(Obj_DateTimeFormatter);

                                            if (this.Validate_DNI_Usuario(DNI_Usuario) == false) {
                                                JOptionPane.showMessageDialog(null, "Ingrese un Documento Nacional de Identidad Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_01.setBackground(Color.RED);
                                                TextField_01.setText("");
                                                TextField_01.requestFocus();
                                            } else {
                                                if ((DNI_Usuario.length()) != 8) {
                                                    JOptionPane.showMessageDialog(null, "El Documento Nacional de Identidad debe Contener 8 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    TextField_01.setBackground(Color.RED);
                                                    TextField_01.setText("");
                                                    TextField_01.requestFocus();
                                                } else {
                                                    try {
                                                        if (Obj_Controlador_Usuario.Check_DNI_Usuario(DNI_Usuario) == true) {
                                                            JOptionPane.showMessageDialog(null, "El Documento Nacional de Identidad ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                            TextField_01.setBackground(Color.RED);
                                                            TextField_01.setText("");
                                                            TextField_01.requestFocus();
                                                        } else {
                                                            TextField_01.setBackground(Color.GREEN);
                                                            System.out.println("DNI_Usuario: Ok!.");
                                                        }
                                                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                    }
                                                }
                                            }

                                            if (this.Validate_E_Mail_Usuario(E_Mail_Usuario) == false) {
                                                JOptionPane.showMessageDialog(null, "Ingrese un Correo Electrónico Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_02.setBackground(Color.RED);
                                                TextField_02.setText("");
                                                TextField_02.requestFocus();
                                            } else {
                                                if ((E_Mail_Usuario.length()) > 50) {
                                                    JOptionPane.showMessageDialog(null, "El Correo Electrónico debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    TextField_02.setBackground(Color.RED);
                                                    TextField_02.setText("");
                                                    TextField_02.requestFocus();
                                                } else {
                                                    try {
                                                        if (Obj_Controlador_Usuario.Check_E_Mail_Usuario(E_Mail_Usuario) == true) {
                                                            JOptionPane.showMessageDialog(null, "El Correo Electrónico ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                            TextField_02.setBackground(Color.RED);
                                                            TextField_02.setText("");
                                                            TextField_02.requestFocus();
                                                        } else {
                                                            TextField_02.setBackground(Color.GREEN);
                                                            System.out.println("E_Mail_Usuario: Ok!.");
                                                        }
                                                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                    }
                                                }
                                            }

                                            if (this.Validate_Password_Usuario(Password_Usuario_Decrypted_01) == false) {
                                                JOptionPane.showMessageDialog(null, "La Contraseña 01 Debe Contener al Menos: Una Letra en Minúscula, Una Letra en Mayúscula, Un Número, Un Caracter Especial y Entre 8 - 20 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                PasswordField_01.setBackground(Color.RED);
                                                PasswordField_01.setText("");
                                                PasswordField_01.requestFocus();
                                            } else {
                                                PasswordField_01.setBackground(Color.GREEN);
                                                System.out.println("Password_Usuario_Decrypted_01: Ok!.");
                                            }

                                            if (this.Validate_Password_Usuario(Password_Usuario_Decrypted_02) == false) {
                                                JOptionPane.showMessageDialog(null, "La Contraseña 02 Debe Contener al Menos: Una Letra en Minúscula, Una Letra en Mayúscula, Un Número, Un Caracter Especial y Entre 8 - 20 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                PasswordField_02.setBackground(Color.RED);
                                                PasswordField_02.setText("");
                                                PasswordField_02.requestFocus();
                                            } else {
                                                if ((Password_Usuario_Decrypted_02).equals(Password_Usuario_Decrypted_01) == false) {
                                                    JOptionPane.showMessageDialog(null, "La Contraseña 02 debe Coincidir con la Contraseña 01.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    PasswordField_02.setBackground(Color.RED);
                                                    PasswordField_02.setText("");
                                                    PasswordField_02.requestFocus();
                                                } else {
                                                    PasswordField_02.setBackground(Color.GREEN);
                                                    System.out.println("Password_Usuario_Decrypted_02: Ok!.");
                                                }
                                            }

                                            if (this.Validate_Nombre_Usuario(Nombre_Usuario) == false) {
                                                JOptionPane.showMessageDialog(null, "Ingrese Nombres Válidos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_03.setBackground(Color.RED);
                                                TextField_03.setText("");
                                                TextField_03.requestFocus();
                                            } else {
                                                if ((Nombre_Usuario.length()) > 50) {
                                                    JOptionPane.showMessageDialog(null, "El Nombre debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    TextField_03.setBackground(Color.RED);
                                                    TextField_03.setText("");
                                                    TextField_03.requestFocus();
                                                } else {
                                                    TextField_03.setBackground(Color.GREEN);
                                                    System.out.println("Nombre_Usuario: Ok!.");
                                                }
                                            }

                                            if (this.Validate_Apellido_Usuario(Apellido_Usuario) == false) {
                                                JOptionPane.showMessageDialog(null, "Ingrese Apellidos Válidos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_04.setBackground(Color.RED);
                                                TextField_04.setText("");
                                                TextField_04.requestFocus();
                                            } else {
                                                if ((Apellido_Usuario.length()) > 50) {
                                                    JOptionPane.showMessageDialog(null, "El Apellido debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    TextField_04.setBackground(Color.RED);
                                                    TextField_04.setText("");
                                                    TextField_04.requestFocus();
                                                } else {
                                                    TextField_04.setBackground(Color.GREEN);
                                                    System.out.println("Apellido_Usuario: Ok!.");
                                                }
                                            }

                                            if (this.Validate_Telefono_Usuario(Telefono_Usuario) == false) {
                                                JOptionPane.showMessageDialog(null, "Ingrese un Teléfono Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_05.setBackground(Color.RED);
                                                TextField_05.setText("");
                                                TextField_05.requestFocus();
                                            } else {
                                                if ((Telefono_Usuario.length()) != 9) {
                                                    JOptionPane.showMessageDialog(null, "El Teléfono debe Contener 9 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                    TextField_05.setBackground(Color.RED);
                                                    TextField_05.setText("");
                                                    TextField_05.requestFocus();
                                                } else {
                                                    try {
                                                        if (Obj_Controlador_Usuario.Check_Telefono_Usuario(Telefono_Usuario)) {
                                                            JOptionPane.showMessageDialog(null, "El Teléfono ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                            TextField_05.setBackground(Color.RED);
                                                            TextField_05.setText("");
                                                            TextField_05.requestFocus();
                                                        } else {
                                                            TextField_05.setBackground(Color.GREEN);
                                                            System.out.println("Telefono_Usuario: Ok!.");
                                                        }
                                                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                    }
                                                }
                                            }

                                            if ((Direccion_Usuario.length()) > 50) {
                                                JOptionPane.showMessageDialog(null, "La Dirección debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_06.setBackground(Color.RED);
                                                TextField_06.setText("");
                                                TextField_06.requestFocus();
                                            } else {
                                                TextField_06.setBackground(Color.GREEN);
                                                System.out.println("Direccion_Usuario: Ok!.");
                                            }

                                            if ((TextField_01.getText()).isEmpty() == true || (TextField_02.getText()).isEmpty() == true || (String.valueOf(PasswordField_01.getPassword())).isEmpty() || (String.valueOf(PasswordField_02.getPassword())).isEmpty() || (TextField_03.getText()).isEmpty() == true || (TextField_04.getText()).isEmpty() == true || (TextField_05.getText()).isEmpty() == true || (TextField_06.getText()).isEmpty() == true) {
                                                System.out.println("Try Again!");
                                            } else {
                                                Modelo_Usuario Obj_Modelo_Usuario = new Modelo_Usuario();

                                                String Password_Usuario_Encrypted = "";
                                                try {
                                                    Password_Usuario_Encrypted = Encryption.Encrypt_Password_Usuario(Password_Usuario_Decrypted_01);
                                                } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
                                                    Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
                                                }

                                                Obj_Modelo_Usuario.setID_Tipo_Usuario(2);
                                                Obj_Modelo_Usuario.setDNI_Usuario(Integer.parseInt(DNI_Usuario));
                                                Obj_Modelo_Usuario.setE_Mail_Usuario(E_Mail_Usuario);
                                                Obj_Modelo_Usuario.setPassword_Usuario(Password_Usuario_Encrypted);
                                                Obj_Modelo_Usuario.setNombre_Usuario(Nombre_Usuario);
                                                Obj_Modelo_Usuario.setApellido_Usuario(Apellido_Usuario);
                                                Obj_Modelo_Usuario.setTelefono_Usuario(Integer.parseInt(Telefono_Usuario));
                                                Obj_Modelo_Usuario.setDireccion_Usuario(Direccion_Usuario);
                                                Obj_Modelo_Usuario.setFecha_Nacimiento_Usuario(Fecha_Nacimiento_Usuario);
                                                Obj_Modelo_Usuario.setEstado_Usuario(true);
                                                Obj_Modelo_Usuario.setFecha_Registro_Usuario(Fecha_Registro_Usuario);

                                                try {
                                                    if (Obj_Controlador_Usuario.Insertar_Usuario(Obj_Modelo_Usuario) == true) {
                                                        this.Show_Confirm_Dialog();
                                                    } else {
                                                        JOptionPane.showMessageDialog(null, "Error al Registrar el Usuario.", "Error", JOptionPane.ERROR_MESSAGE);
                                                    }
                                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                }
                                            }
                                        }
                                    }
                                }
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

    private void CheckBox_02MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_CheckBox_02MouseClicked
        // TODO add your handling code here:
        if (CheckBox_01.isSelected() == true) {
            PasswordField_01.setEchoChar((char) 0);
        } else {
            PasswordField_01.setEchoChar('\u25cf');
        }
    }//GEN-LAST:event_CheckBox_02MouseClicked

    private void CheckBox_01MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_CheckBox_01MouseClicked
        // TODO add your handling code here:
        if (CheckBox_02.isSelected() == true) {
            PasswordField_02.setEchoChar((char) 0);
        } else {
            PasswordField_02.setEchoChar('\u25cf');
        }
    }//GEN-LAST:event_CheckBox_01MouseClicked

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JCheckBox CheckBox_01;
    private javax.swing.JCheckBox CheckBox_02;
    private com.toedter.calendar.JDateChooser DateChooser_01;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_04;
    private javax.swing.JLabel Label_05;
    private javax.swing.JLabel Label_06;
    private javax.swing.JLabel Label_07;
    private javax.swing.JLabel Label_08;
    private javax.swing.JLabel Label_09;
    private javax.swing.JLabel Label_10;
    private javax.swing.JLabel Label_11;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JPasswordField PasswordField_01;
    private javax.swing.JPasswordField PasswordField_02;
    private javax.swing.JTextField TextField_01;
    private javax.swing.JTextField TextField_02;
    private javax.swing.JTextField TextField_03;
    private javax.swing.JTextField TextField_04;
    private javax.swing.JTextField TextField_05;
    private javax.swing.JTextField TextField_06;
    // End of variables declaration//GEN-END:variables
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.ImageIcon;
import javax.swing.UIManager;
import java.awt.Image;
import java.awt.Toolkit;
import Controlador.Controlador_Usuario;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
import java.io.IOException;
import WallPaper_Background.WallPaper_Background;
import java.awt.Color;
import Encryption.Encryption;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.BadPaddingException;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

/**
 *
 * @author JuanCin20
 */
public class Frame_Log_In extends javax.swing.JFrame {

    /**
     * Creates new form Frame_Log_In
     */
    public Frame_Log_In() {
        initComponents();
        this.setResizable(false);
        this.setLocationRelativeTo(null);
        this.setTitle("Pc - Factory Desktop App: Log In");
        PasswordField_01.setEchoChar('\u25cf');
        Button_02.setVisible(false);
        UIManager.put("OptionPane.okButtonText", "Aceptar");
        UIManager.put("OptionPane.cancelButtonText", "Cancelar");
    }

    @Override
    public Image getIconImage() {
        Image Obj_Image = (Toolkit.getDefaultToolkit()).getImage("src//main//java//Imágenes//ToolKit.png");
        return Obj_Image;
    }

    private final Controlador_Usuario Obj_Controlador_Usuario = new Controlador_Usuario();

    private void Log_In(String E_Mail_Usuario, String Password_Usuario) {
        String Password_Usuario_Decrypted = "";

        ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
        try {
            Obj_ArrayList_Object = Obj_Controlador_Usuario.Check_Usuario(E_Mail_Usuario);
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }

        Frame_Administrator Obj_Frame_Administrator = null;
        try {
            Obj_Frame_Administrator = new Frame_Administrator();
        } catch (IOException Obj_IOException) {
            Logger.getLogger(WallPaper_Background.class.getName()).log(Level.SEVERE, Obj_IOException.getMessage());
        }

        Frame_Employee Obj_Frame_Employee = null;
        try {
            Obj_Frame_Employee = new Frame_Employee();
        } catch (IOException Obj_IOException) {
            Logger.getLogger(WallPaper_Background.class.getName()).log(Level.SEVERE, Obj_IOException.getMessage());
        }

        if (Obj_ArrayList_Object.isEmpty() == true) {
            TextField_01.setBackground(Color.RED);
            TextField_01.setText("");
            JOptionPane.showMessageDialog(null, "Verifique su Correo Electrónico.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_01.requestFocus();
            System.out.println("Try_Again!");
        } else {

            if ((boolean) Obj_ArrayList_Object.get(4) == true) {
                String Password_Usuario_Encrypted = (Obj_ArrayList_Object.get(1)).toString();

                try {
                    Password_Usuario_Decrypted = Encryption.Decrypt_Password_Usuario(Password_Usuario_Encrypted);
                } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
                    Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
                }

                if (Password_Usuario.equals(Password_Usuario_Decrypted) == false) {
                    PasswordField_01.setBackground(Color.RED);
                    PasswordField_01.setText("");
                    JOptionPane.showMessageDialog(null, "Verifique su Contraseña.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    PasswordField_01.requestFocus();
                    System.out.println("Try_Again!");
                } else {
                    if (((Obj_ArrayList_Object.get(0)).toString()).equals("1") == true) {
                        TextField_01.setBackground(Color.BLUE);
                        TextField_01.setText("");
                        PasswordField_01.setBackground(Color.BLUE);
                        PasswordField_01.setText("");
                        JOptionPane.showMessageDialog(null, "Bienvenido/a: " + (Obj_ArrayList_Object.get(2)).toString() + " " + (Obj_ArrayList_Object.get(3)).toString() + ".", "Información", JOptionPane.INFORMATION_MESSAGE);
                        Obj_Frame_Administrator.setVisible(true);
                        this.dispose();
                        System.out.println("ID_Tipo_Usuario: " + (Obj_ArrayList_Object.get(0)).toString());
                    } else {
                        if (((Obj_ArrayList_Object.get(0)).toString()).equals("2") == true) {
                            TextField_01.setBackground(Color.BLUE);
                            TextField_01.setText("");
                            PasswordField_01.setBackground(Color.BLUE);
                            PasswordField_01.setText("");
                            JOptionPane.showMessageDialog(null, "Bienvenido/a: " + (Obj_ArrayList_Object.get(2)).toString() + " " + (Obj_ArrayList_Object.get(3)).toString() + ".", "Información", JOptionPane.INFORMATION_MESSAGE);
                            Obj_Frame_Employee.setVisible(true);
                            this.dispose();
                            System.out.println("ID_Tipo_Usuario: " + (Obj_ArrayList_Object.get(0)).toString());
                        }
                    }
                }
            } else {
                if ((boolean) Obj_ArrayList_Object.get(4) == false) {
                    JOptionPane.showMessageDialog(null, "Sus Credenciales no se Encuentran Habilitadas.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                }
            }
        }
    }

    private void Show_Input_Dialog() {
        String Master_Password_Usuario = JOptionPane.showInputDialog(null, "Ingrese la Contraseña Maestra:", "Verificación", JOptionPane.QUESTION_MESSAGE);

        if (Master_Password_Usuario == null || (Master_Password_Usuario).equals("") == true) {
            Button_02.setVisible(false);
        } else {
            if ((Master_Password_Usuario).equals("JU@NCIn080604") == false) {
                JOptionPane.showMessageDialog(null, "Contraseña Maestra Incorrecta.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                Button_02.setVisible(false);
            } else {
                if ((Master_Password_Usuario).equals("JU@NCIn080604") == true) {
                    JOptionPane.showMessageDialog(null, "Contraseña Maestra Correcta.", "Información", JOptionPane.INFORMATION_MESSAGE);
                    Button_02.setVisible(true);
                }
            }
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
        Label_01 = new javax.swing.JLabel();
        Label_02 = new javax.swing.JLabel();
        Label_03 = new javax.swing.JLabel();
        Panel_02 = new javax.swing.JPanel();
        Label_04 = new javax.swing.JLabel();
        Label_05 = new javax.swing.JLabel();
        Label_06 = new javax.swing.JLabel();
        Label_07 = new javax.swing.JLabel();
        TextField_01 = new javax.swing.JTextField();
        PasswordField_01 = new javax.swing.JPasswordField();
        Button_01 = new javax.swing.JButton();
        Button_02 = new javax.swing.JButton();
        CheckBox_01 = new javax.swing.JCheckBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setIconImage(getIconImage());

        Panel_01.setBackground(new java.awt.Color(255, 255, 255));
        Panel_01.setMaximumSize(new java.awt.Dimension(2147483647, 2147483647));
        Panel_01.setPreferredSize(new java.awt.Dimension(330, 475));

        Label_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 36)); // NOI18N
        Label_01.setForeground(new java.awt.Color(51, 153, 255));
        Label_01.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label_01.setText("Pc - Factory ™");

        Label_02.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Pc_Factory.png"));
        Label_02.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Label_02MouseClicked(evt);
            }
        });

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        Label_03.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label_03.setText("Desarrollado por: Tec - Samples ©");

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_01Layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_01, javax.swing.GroupLayout.PREFERRED_SIZE, 284, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 284, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 284, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(23, 23, 23))
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addGap(99, 99, 99)
                .addComponent(Label_01, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(99, 99, 99))
        );

        Panel_02.setBackground(new java.awt.Color(153, 204, 255));
        Panel_02.setMaximumSize(new java.awt.Dimension(2147483647, 2147483647));
        Panel_02.setPreferredSize(new java.awt.Dimension(445, 475));

        Label_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 36)); // NOI18N
        Label_04.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label_04.setText("Iniciar Sesión");

        Label_05.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//User_02.png"));

        Label_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_06.setIcon(new ImageIcon("src//main//java//Imágenes//E_Mail.png"));
        Label_06.setText("Correo Electrónico:");

        Label_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_07.setIcon(new ImageIcon("src//main//java//Imágenes//Password.png"));
        Label_07.setText("Contraseña:");

        TextField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextField_01.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TextField_01KeyPressed(evt);
            }
        });

        PasswordField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        PasswordField_01.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                PasswordField_01KeyPressed(evt);
            }
        });

        Button_01.setBackground(new java.awt.Color(51, 204, 0));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setText("Iniciar Sesión");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        Button_02.setBackground(new java.awt.Color(204, 153, 0));
        Button_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_02.setText("Registro");
        Button_02.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_02ActionPerformed(evt);
            }
        });

        CheckBox_01.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                CheckBox_01MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout Panel_02Layout = new javax.swing.GroupLayout(Panel_02);
        Panel_02.setLayout(Panel_02Layout);
        Panel_02Layout.setHorizontalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addGap(57, 57, 57)
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 374, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 374, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_02Layout.createSequentialGroup()
                        .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, Panel_02Layout.createSequentialGroup()
                                .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(115, 115, 115)
                                .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, Panel_02Layout.createSequentialGroup()
                                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 165, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 165, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(PasswordField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE))))
                        .addGap(10, 10, 10)
                        .addComponent(CheckBox_01)))
                .addGap(57, 57, 57))
        );
        Panel_02Layout.setVerticalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addGap(59, 59, 59)
                .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20)
                .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 136, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20)
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(10, 10, 10)
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(CheckBox_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(PasswordField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(60, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(Panel_01, javax.swing.GroupLayout.PREFERRED_SIZE, 328, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Panel_02, javax.swing.GroupLayout.PREFERRED_SIZE, 488, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Panel_01, javax.swing.GroupLayout.PREFERRED_SIZE, 485, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Panel_02, javax.swing.GroupLayout.PREFERRED_SIZE, 485, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 0, 0))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void TextField_01KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_01KeyPressed
        // TODO add your handling code here:
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            PasswordField_01.requestFocus();
        }
    }//GEN-LAST:event_TextField_01KeyPressed

    private void PasswordField_01KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_PasswordField_01KeyPressed
        // TODO add your handling code here:
        String E_Mail_Usuario = (TextField_01.getText()).trim();
        String Password_Usuario = (String.valueOf(PasswordField_01.getPassword())).trim();

        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            this.Log_In(E_Mail_Usuario, Password_Usuario);
        }
    }//GEN-LAST:event_PasswordField_01KeyPressed

    private void CheckBox_01MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_CheckBox_01MouseClicked
        // TODO add your handling code here:
        if (CheckBox_01.isSelected() == true) {
            PasswordField_01.setEchoChar((char) 0);
        } else {
            PasswordField_01.setEchoChar('\u25cf');
        }
    }//GEN-LAST:event_CheckBox_01MouseClicked

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        if ((TextField_01.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Correo Electrónico del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_01.setBackground(Color.RED);
            TextField_01.requestFocus();
        } else {
            if ((String.valueOf(PasswordField_01.getPassword())).isEmpty() == true) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Contraseña del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                PasswordField_01.setBackground(Color.RED);
                PasswordField_01.requestFocus();
            } else {
                String E_Mail_Usuario = (TextField_01.getText()).trim();
                String Password_Usuario = (String.valueOf(PasswordField_01.getPassword())).trim();
                this.Log_In(E_Mail_Usuario, Password_Usuario);
            }
        }
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        Frame_Sign_Up Obj_Frame_Sign_Up = new Frame_Sign_Up();
        Obj_Frame_Sign_Up.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_Button_02ActionPerformed

    private void Label_02MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Label_02MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 4) {
            System.out.println("Click_Number: " + 4);
            this.Show_Input_Dialog();
        }
    }//GEN-LAST:event_Label_02MouseClicked

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
            java.util.logging.Logger.getLogger(Frame_Log_In.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Frame_Log_In.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Frame_Log_In.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Frame_Log_In.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Frame_Log_In().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JCheckBox CheckBox_01;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_04;
    private javax.swing.JLabel Label_05;
    private javax.swing.JLabel Label_06;
    private javax.swing.JLabel Label_07;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JPasswordField PasswordField_01;
    private javax.swing.JTextField TextField_01;
    // End of variables declaration//GEN-END:variables
}
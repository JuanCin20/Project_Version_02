/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package Vista;

import javax.swing.ImageIcon;
import java.sql.SQLException;
import javax.swing.UIManager;
import javax.swing.table.DefaultTableModel;
import javax.swing.JTable;
import java.util.EventObject;
import java.awt.Font;
import Controlador.Controlador_Usuario;
import java.util.ArrayList;
import Modelo.Modelo_Usuario;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
// import javax.swing.table.DefaultTableCellRenderer;
// import java.awt.Component;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Point;
import Encryption.Encryption;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.BadPaddingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.swing.JOptionPane;
import java.awt.event.KeyEvent;

/**
 *
 * @author JuanCin20
 */
public class InternalFrame_Management_Users extends javax.swing.JInternalFrame {

    /**
     * Creates new form InternalFrame_Management_Employees
     *
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public InternalFrame_Management_Users() throws SQLException, ClassNotFoundException {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: Management Users");
        this.Initialize_Table();
        this.Show_Table_Header();
        // this.Show_Table_Content();
        this.Show_Table_Content_Alternative();
        // this.Show_Table_Color();
        this.Show_Table_Color_Alternative();
        this.Show_Field_Content();
        this.Modify_Component();
        this.Get_Value_Row();
        this.Initial_State();
        UIManager.put("OptionPane.okButtonText", "Aceptar");
        UIManager.put("OptionPane.yesButtonText", "Aceptar");
        UIManager.put("OptionPane.noButtonText", "Volver");
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
        Obj_DefaultTableModel.addColumn("ID del Usuario");
        Obj_DefaultTableModel.addColumn("Cargo del Usuario");
        Obj_DefaultTableModel.addColumn("DNI del Usuario");
        Obj_DefaultTableModel.addColumn("E - Mail del Usuario");
        Obj_DefaultTableModel.addColumn("Contraseña del Usuario");
        Obj_DefaultTableModel.addColumn("Nombre del Usuario");
        Obj_DefaultTableModel.addColumn("Apellido del Usuario");
        Obj_DefaultTableModel.addColumn("Teléfono del Usuario");
        Obj_DefaultTableModel.addColumn("Dirección del Usuario");
        Obj_DefaultTableModel.addColumn("Fecha de Nacimiento del Usuario");
        Obj_DefaultTableModel.addColumn("Estado del Usuario");
        Obj_DefaultTableModel.addColumn("Fecha de Registro del Usuario");
    }

    private final Controlador_Usuario Obj_Controlador_Usuario = new Controlador_Usuario();

    /* private void Show_Table_Content() {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        ArrayList<Modelo_Usuario> Obj_ArrayList_Modelo_Usuario = new ArrayList<>();
        try {
            Obj_ArrayList_Modelo_Usuario = Obj_Controlador_Usuario.ArrayList_Modelo_Usuario();
        } catch (SQLException Obj_SQLException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException.getMessage());
        }

        Object Obj_Object[] = new Object[12];

        for (int i = 0; i < Obj_ArrayList_Modelo_Usuario.size(); i++) {
            Obj_Object[0] = ((Obj_ArrayList_Modelo_Usuario.get(i))).getID_Usuario();

            if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 2) {
                Obj_Object[1] = "Empleado";
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 3) {
                    Obj_Object[1] = "Cliente";
                }
            }

            Obj_Object[2] = (Obj_ArrayList_Modelo_Usuario.get(i)).getDNI_Usuario();
            Obj_Object[3] = (Obj_ArrayList_Modelo_Usuario.get(i)).getE_Mail_Usuario();
            Obj_Object[4] = (Obj_ArrayList_Modelo_Usuario.get(i)).getPassword_Usuario();
            Obj_Object[5] = (Obj_ArrayList_Modelo_Usuario.get(i)).getNombre_Usuario();
            Obj_Object[6] = (Obj_ArrayList_Modelo_Usuario.get(i)).getApellido_Usuario();
            Obj_Object[7] = (Obj_ArrayList_Modelo_Usuario.get(i)).getTelefono_Usuario();
            Obj_Object[8] = (Obj_ArrayList_Modelo_Usuario.get(i)).getDireccion_Usuario();
            Obj_Object[9] = (Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Nacimiento_Usuario();

            if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == true) {
                Obj_Object[10] = "Disponible";
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == false) {
                    Obj_Object[10] = "No Disponible";
                }
            }

            Obj_Object[11] = (Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Registro_Usuario();
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object);
        }
    } */
    private final ArrayList<Modelo_Usuario> Obj_ArrayList_Modelo_Usuario = Obj_Controlador_Usuario.ArrayList_Modelo_Usuario();
    private final ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = Obj_Controlador_Usuario.ArrayList_ArrayList_Object();
    private ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
    private Object Obj_Object_01[] = new Object[12];
    private Modelo_Usuario Obj_Modelo_Usuario = new Modelo_Usuario();

    private void Show_Table_Content_Alternative() {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
            Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object.get(i)).get(0);

            if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(1)).toString()).equals("2") == true) {
                Obj_Object_01[1] = "Empleado";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(1)).toString()).equals("3") == true) {
                    Obj_Object_01[1] = "Cliente";
                }
            }

            Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object.get(i)).get(2);
            Obj_Object_01[3] = (Obj_ArrayList_ArrayList_Object.get(i)).get(3);
            Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object.get(i)).get(4);
            Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object.get(i)).get(5);
            Obj_Object_01[6] = (Obj_ArrayList_ArrayList_Object.get(i)).get(6);
            Obj_Object_01[7] = (Obj_ArrayList_ArrayList_Object.get(i)).get(7);
            Obj_Object_01[8] = (Obj_ArrayList_ArrayList_Object.get(i)).get(8);
            Obj_Object_01[9] = (Obj_ArrayList_ArrayList_Object.get(i)).get(9);

            if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(10)).toString()).equals("true") == true) {
                Obj_Object_01[10] = "Disponible";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(10)).toString()).equals("false") == true) {
                    Obj_Object_01[10] = "No Disponible";
                }
            }

            Obj_Object_01[11] = (Obj_ArrayList_ArrayList_Object.get(i)).get(11);
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
        }
    }

    private void Busqueda_Secuencial(String Nombre_Usuario) {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        if (Obj_ArrayList_ArrayList_Object.isEmpty() == false) {
            for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
                if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(5)).toString()).equalsIgnoreCase(Nombre_Usuario) == true) {
                    Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object.get(i)).get(0);

                    if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(1)).toString()).equals("2") == true) {
                        Obj_Object_01[1] = "Empleado";
                    } else {
                        if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(1)).toString()).equals("3") == true) {
                            Obj_Object_01[1] = "Cliente";
                        }
                    }

                    Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object.get(i)).get(2);
                    Obj_Object_01[3] = (Obj_ArrayList_ArrayList_Object.get(i)).get(3);
                    Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object.get(i)).get(4);
                    Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object.get(i)).get(5);
                    Obj_Object_01[6] = (Obj_ArrayList_ArrayList_Object.get(i)).get(6);
                    Obj_Object_01[7] = (Obj_ArrayList_ArrayList_Object.get(i)).get(7);
                    Obj_Object_01[8] = (Obj_ArrayList_ArrayList_Object.get(i)).get(8);
                    Obj_Object_01[9] = (Obj_ArrayList_ArrayList_Object.get(i)).get(9);

                    if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(10)).toString()).equals("true") == true) {
                        Obj_Object_01[10] = "Disponible";
                    } else {
                        if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(10)).toString()).equals("false") == true) {
                            Obj_Object_01[10] = "No Disponible";
                        }
                    }

                    Obj_Object_01[11] = (Obj_ArrayList_ArrayList_Object.get(i)).get(11);
                    Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
                }
            }
        }
    }

    private void Busqueda_Binaria(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object, int ID_Usuario) {
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object.size() - 1;
        boolean Found_Status = false;

        while (Begin_ArrayList_Index <= End_ArrayList_Index && Found_Status == false) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(0) == ID_Usuario) {
                Obj_Object_01[0] = Control_ArrayList.get(0);

                if (((Control_ArrayList.get(1)).toString()).equals("2") == true) {
                    Obj_Object_01[1] = "Empleado";
                } else {
                    if (((Control_ArrayList.get(1)).toString()).equals("3") == true) {
                        Obj_Object_01[1] = "Cliente";
                    }
                }

                Obj_Object_01[2] = Control_ArrayList.get(2);
                Obj_Object_01[3] = Control_ArrayList.get(3);
                Obj_Object_01[4] = Control_ArrayList.get(4);
                Obj_Object_01[5] = Control_ArrayList.get(5);
                Obj_Object_01[6] = Control_ArrayList.get(6);
                Obj_Object_01[7] = Control_ArrayList.get(7);
                Obj_Object_01[8] = Control_ArrayList.get(8);
                Obj_Object_01[9] = Control_ArrayList.get(9);

                if (((Control_ArrayList.get(10)).toString()).equals("true") == true) {
                    Obj_Object_01[10] = "Disponible";
                } else {
                    if (((Control_ArrayList.get(10)).toString()).equals("false") == true) {
                        Obj_Object_01[10] = "No Disponible";
                    }
                }
                Obj_Object_01[11] = Control_ArrayList.get(11);
                Found_Status = true;
            } else {
                if (ID_Usuario < (int) Control_ArrayList.get(0)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Usuario > (int) Control_ArrayList.get(0)) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
    }

    /* private Object[] Busqueda_Binaria_Alternative(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object, int ID_Usuario) {
        Object Obj_Object_03[] = new Object[12];
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object.size();

        while (Begin_ArrayList_Index <= End_ArrayList_Index) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(0) == ID_Usuario) {
                Obj_Object_03[0] = Control_ArrayList.get(0);

                if (((Control_ArrayList.get(1)).toString()).equals("2") == true) {
                    Obj_Object_03[1] = "Empleado";
                } else {
                    if (((Control_ArrayList.get(1)).toString()).equals("3") == true) {
                        Obj_Object_03[1] = "Cliente";
                    }
                }

                Obj_Object_03[2] = Control_ArrayList.get(2);
                Obj_Object_03[3] = Control_ArrayList.get(3);
                Obj_Object_03[4] = Control_ArrayList.get(4);
                Obj_Object_03[5] = Control_ArrayList.get(5);
                Obj_Object_03[6] = Control_ArrayList.get(6);
                Obj_Object_03[7] = Control_ArrayList.get(7);
                Obj_Object_03[8] = Control_ArrayList.get(8);
                Obj_Object_03[9] = Control_ArrayList.get(9);

                if (((Control_ArrayList.get(10)).toString()).equals("true") == true) {
                    Obj_Object_03[10] = "Disponible";
                } else {
                    if (((Control_ArrayList.get(10)).toString()).equals("false") == true) {
                        Obj_Object_03[10] = "No Disponible";
                    }
                }
                Obj_Object_03[11] = Control_ArrayList.get(11);
                return Obj_Object_03;
            } else {
                if (ID_Usuario < (int) Control_ArrayList.get(0)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Usuario > (int) Control_ArrayList.get(0)) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
        return Obj_Object_03;
    } */

 /* private void Function_Table_Color(JTable Obj_JTable, int Column_Index) {
        Obj_JTable.getColumnModel().getColumn(Column_Index).setCellRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable Obj_JTable, Object Obj_Object, boolean Is_Selected, boolean Has_Focus, int Row_Index, int Column_Index) {
                final Component Obj_Component = super.getTableCellRendererComponent(Obj_JTable, Obj_Object, Is_Selected, Has_Focus, Row_Index, Column_Index);
                DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
                String Estado_Usuario = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 10)).toString();

                if (Estado_Usuario.equals("Disponible") == true) {
                    Obj_Component.setFont(new Font("Yu Gothic UI", Font.BOLD, 14));
                    Obj_Component.setForeground(Color.BLACK);
                    Obj_Component.setBackground(Color.GREEN);
                } else {
                    if (Estado_Usuario.equals("No Disponible") == true) {
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
        for (int i = 0; i <= 11; i++) {
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

                    String Estado_Usuario = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 10)).toString();

                    if (Estado_Usuario.equals("Disponible") == true) {
                        Table_01.setSelectionForeground(Color.BLACK);
                        Table_01.setSelectionBackground(Color.GREEN);
                    } else {
                        if (Estado_Usuario.equals("No Disponible") == true) {
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

                    TextField_03.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 2)).toString());
                    TextField_04.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 3)).toString());

                    String Password_Usuario_Encrypted = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 4)).toString();
                    String Password_Usuario_Decrypted = null;
                    try {
                        Password_Usuario_Decrypted = Encryption.Decrypt_Password_Usuario(Password_Usuario_Encrypted);
                    } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
                        Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
                    }
                    PasswordField_01.setText(Password_Usuario_Decrypted);

                    TextField_05.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 5)).toString());
                    TextField_06.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 6)).toString());
                    TextField_07.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 7)).toString());
                    TextField_08.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 8)).toString());

                    try {
                        String Row_Value = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 9)).toString();
                        SimpleDateFormat Obj_SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        Date Obj_Date = Obj_SimpleDateFormat.parse(Row_Value);
                        DateChooser_01.setDate(Obj_Date);
                    } catch (ParseException Obj_ParseException) {
                        Logger.getLogger(InternalFrame_Management_Users.class.getName()).log(Level.SEVERE, null, Obj_ParseException.getMessage());
                    }

                    TextField_09.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 11)).toString());
                    // System.out.println("Row_Index: " + Row_Index);
                }
            }
        });
    }

    private void Modify_Component() {
        Table_01.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent Obj_MouseEvent) {
                JTable Obj_JTable = (JTable) Obj_MouseEvent.getSource();
                Point Obj_Point = Obj_MouseEvent.getPoint();
                int Row_Index = Obj_JTable.rowAtPoint(Obj_Point);
                if (Obj_MouseEvent.getClickCount() == 1) {
                    DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

                    String Estado_Usuario = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 10)).toString();

                    if (Estado_Usuario.equals("Disponible") == true) {
                        Button_03.setEnabled(true);
                        Button_04.setEnabled(true);
                        Button_04.setText("Eliminar");
                        Button_04.setBackground(Color.RED);
                        TextField_03.setEnabled(true);
                        TextField_04.setEnabled(true);
                        PasswordField_01.setEnabled(true);
                        PasswordField_01.setEchoChar((char) 0);
                        CheckBox_01.setEnabled(true);
                        CheckBox_01.setSelected(true);
                        TextField_05.setEnabled(true);
                        TextField_06.setEnabled(true);
                        TextField_07.setEnabled(true);
                        TextField_08.setEnabled(true);
                        DateChooser_01.setEnabled(true);
                    } else {
                        if (Estado_Usuario.equals("No Disponible") == true) {
                            Button_03.setEnabled(false);
                            Button_04.setEnabled(true);
                            Button_04.setText("Restaurar");
                            Button_04.setBackground(Color.YELLOW);
                            TextField_03.setEnabled(false);
                            TextField_04.setEnabled(false);
                            PasswordField_01.setEnabled(false);
                            PasswordField_01.setEchoChar('\u25cf');
                            CheckBox_01.setEnabled(false);
                            CheckBox_01.setSelected(false);
                            TextField_05.setEnabled(false);
                            TextField_06.setEnabled(false);
                            TextField_07.setEnabled(false);
                            TextField_08.setEnabled(false);
                            DateChooser_01.setEnabled(false);
                        }
                    }
                }
            }
        });
    }

    private final Object Obj_Object_02[] = new Object[2];

    private void Get_Value_Row() {
        Table_01.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent Obj_MouseEvent) {
                JTable Obj_JTable = (JTable) Obj_MouseEvent.getSource();
                Point Obj_Point = Obj_MouseEvent.getPoint();
                int Row_Index = Obj_JTable.rowAtPoint(Obj_Point);
                if (Obj_MouseEvent.getClickCount() == 1) {
                    DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

                    String ID_Usuario = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 0)).toString();
                    Obj_Object_02[0] = Integer.valueOf(ID_Usuario);

                    String Estado_Usuario = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 10)).toString();
                    if (Estado_Usuario.equals("Disponible") == true) {
                        Obj_Object_02[1] = true;
                    } else {
                        if (Estado_Usuario.equals("No Disponible") == true) {
                            Obj_Object_02[1] = false;
                        }
                    }
                }
            }
        });
    }

    private void Initial_State() {
        Button_03.setEnabled(false);
        Button_04.setEnabled(false);
        Button_04.setText("Eliminar");
        Button_04.setBackground(Color.RED);
        TextField_01.setText("");
        TextField_03.setEnabled(false);
        TextField_03.setText("");
        TextField_04.setEnabled(false);
        TextField_04.setText("");
        PasswordField_01.setEnabled(false);
        PasswordField_01.setEchoChar('\u25cf');
        PasswordField_01.setText("");
        CheckBox_01.setEnabled(false);
        CheckBox_01.setSelected(false);
        TextField_05.setEnabled(false);
        TextField_05.setText("");
        TextField_06.setEnabled(false);
        TextField_06.setText("");
        TextField_07.setEnabled(false);
        TextField_07.setText("");
        TextField_08.setEnabled(false);
        TextField_08.setText("");
        DateChooser_01.setEnabled(false);
        DateChooser_01.setCalendar(null);
        TextField_09.setText("");
    }

    private boolean Validate_ID_Usuario(String ID_Usuario) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(ID_Usuario);
        return Obj_Matcher.find();
    }

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

    /* private String Print_ArrayList_Model() {
        String Data = "";
        for (int i = 0; i < Obj_ArrayList_Modelo_Usuario.size(); i++) {
            Data += Obj_ArrayList_Modelo_Usuario.get(i) + "\n";
        }
        return Data;
    } */

 /* private String Print_ArrayList_ArrayList() {
        String Data = "";
        for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
            for (int j = 0; j < (Obj_ArrayList_ArrayList_Object.get(i)).size(); j++) {
                Data += (Obj_ArrayList_ArrayList_Object.get(i)).get(j) + " || ";
            }
            Data += "\n";
        }
        return Data;
    } */
    private void Bubble_Sort_Nombre_Usuario() {
        for (int i = 0; i < (Obj_ArrayList_Modelo_Usuario.size() - 1); i++) {
            for (int j = 0; j < (Obj_ArrayList_Modelo_Usuario.size() - 1); j++) {
                if (((Obj_ArrayList_Modelo_Usuario.get(j)).getNombre_Usuario()).compareToIgnoreCase((Obj_ArrayList_Modelo_Usuario.get(j + 1)).getNombre_Usuario()) > 0) {
                    Obj_Modelo_Usuario = Obj_ArrayList_Modelo_Usuario.get(j);
                    Obj_ArrayList_Modelo_Usuario.set(j, Obj_ArrayList_Modelo_Usuario.get(j + 1));
                    Obj_ArrayList_Modelo_Usuario.set(j + 1, Obj_Modelo_Usuario);
                }
            }
        }

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_Modelo_Usuario.size(); i++) {
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Usuario(), i, 0);
            if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 2) {
                Obj_DefaultTableModel_Alternative.setValueAt("Empleado", i, 1);
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 3) {
                    Obj_DefaultTableModel_Alternative.setValueAt("Cliente", i, 1);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getDNI_Usuario(), i, 2);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getE_Mail_Usuario(), i, 3);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getPassword_Usuario(), i, 4);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getNombre_Usuario(), i, 5);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getApellido_Usuario(), i, 6);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getTelefono_Usuario(), i, 7);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getDireccion_Usuario(), i, 8);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Nacimiento_Usuario(), i, 9);
            if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == true) {
                Obj_DefaultTableModel_Alternative.setValueAt("Disponible", i, 10);
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == false) {
                    Obj_DefaultTableModel_Alternative.setValueAt("No Disponible", i, 10);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Registro_Usuario(), i, 11);
        }
    }

    private void Optimized_Bubble_Sort_Nombre_Usuario() {
        int Counter = 0;
        boolean Swapped;
        do {
            Swapped = false;
            for (int i = 0; i < (Obj_ArrayList_Modelo_Usuario.size() - 1); i++) {
                if (((Obj_ArrayList_Modelo_Usuario.get(i)).getNombre_Usuario()).compareToIgnoreCase((Obj_ArrayList_Modelo_Usuario.get(i + 1)).getNombre_Usuario()) > 0) {
                    Obj_Modelo_Usuario = Obj_ArrayList_Modelo_Usuario.get(i);
                    Obj_ArrayList_Modelo_Usuario.set(i, Obj_ArrayList_Modelo_Usuario.get(i + 1));
                    Obj_ArrayList_Modelo_Usuario.set(i + 1, Obj_Modelo_Usuario);
                    Swapped = true;
                }
            }
            Counter++;
        } while (Swapped == true);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_Modelo_Usuario.size(); i++) {
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Usuario(), i, 0);
            if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 2) {
                Obj_DefaultTableModel_Alternative.setValueAt("Empleado", i, 1);
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).getID_Tipo_Usuario() == 3) {
                    Obj_DefaultTableModel_Alternative.setValueAt("Cliente", i, 1);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getDNI_Usuario(), i, 2);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getE_Mail_Usuario(), i, 3);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getPassword_Usuario(), i, 4);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getNombre_Usuario(), i, 5);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getApellido_Usuario(), i, 6);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getTelefono_Usuario(), i, 7);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getDireccion_Usuario(), i, 8);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Nacimiento_Usuario(), i, 9);
            if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == true) {
                Obj_DefaultTableModel_Alternative.setValueAt("Disponible", i, 10);
            } else {
                if ((Obj_ArrayList_Modelo_Usuario.get(i)).isEstado_Usuario() == false) {
                    Obj_DefaultTableModel_Alternative.setValueAt("No Disponible", i, 10);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Usuario.get(i)).getFecha_Registro_Usuario(), i, 11);
        }
        System.out.println("Steps Quantity, Optimized = " + Counter);
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
        ScrollPane_01 = new javax.swing.JScrollPane();
        Table_01 = new javax.swing.JTable();
        Panel_02 = new javax.swing.JPanel();
        Label_02 = new javax.swing.JLabel();
        TextField_01 = new javax.swing.JTextField();
        Button_01 = new javax.swing.JButton();
        Panel_03 = new javax.swing.JPanel();
        Label_03 = new javax.swing.JLabel();
        TextField_02 = new javax.swing.JTextField();
        Button_02 = new javax.swing.JButton();
        Panel_04 = new javax.swing.JPanel();
        Button_03 = new javax.swing.JButton();
        Button_04 = new javax.swing.JButton();
        Panel_05 = new javax.swing.JPanel();
        Button_05 = new javax.swing.JButton();
        Button_06 = new javax.swing.JButton();
        Panel_06 = new javax.swing.JPanel();
        Label_05 = new javax.swing.JLabel();
        Label_06 = new javax.swing.JLabel();
        Label_07 = new javax.swing.JLabel();
        Label_08 = new javax.swing.JLabel();
        Label_09 = new javax.swing.JLabel();
        Label_10 = new javax.swing.JLabel();
        Label_11 = new javax.swing.JLabel();
        Label_12 = new javax.swing.JLabel();
        Label_13 = new javax.swing.JLabel();
        TextField_03 = new javax.swing.JTextField();
        TextField_04 = new javax.swing.JTextField();
        PasswordField_01 = new javax.swing.JPasswordField();
        CheckBox_01 = new javax.swing.JCheckBox();
        TextField_05 = new javax.swing.JTextField();
        TextField_06 = new javax.swing.JTextField();
        TextField_07 = new javax.swing.JTextField();
        TextField_08 = new javax.swing.JTextField();
        DateChooser_01 = new com.toedter.calendar.JDateChooser();
        TextField_09 = new javax.swing.JTextField();
        Button_07 = new javax.swing.JButton();
        Label_01 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Panel_01.setBackground(new java.awt.Color(102, 102, 102));
        Panel_01.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

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

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 862, Short.MAX_VALUE)
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 312, Short.MAX_VALUE)
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, 880, 330));

        Panel_02.setBackground(new java.awt.Color(102, 102, 102));
        Panel_02.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_02.setForeground(new java.awt.Color(255, 255, 255));
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_02.setText("Búsqueda (Secuencial - Nombre_Usuario):");

        TextField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextField_01.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TextField_01KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                TextField_01KeyReleased(evt);
            }
        });

        Button_01.setBackground(new java.awt.Color(51, 153, 255));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setText("Buscar");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_02Layout = new javax.swing.GroupLayout(Panel_02);
        Panel_02.setLayout(Panel_02Layout);
        Panel_02Layout.setHorizontalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 262, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_02Layout.createSequentialGroup()
                        .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        Panel_02Layout.setVerticalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(910, 10, 280, 100));

        Panel_03.setBackground(new java.awt.Color(102, 102, 102));
        Panel_03.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_03.setText("Búsqueda (Binaria - ID_Usuario):");

        TextField_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        Button_02.setBackground(new java.awt.Color(51, 153, 255));
        Button_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_02.setText("Buscar");
        Button_02.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_02ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_03Layout = new javax.swing.GroupLayout(Panel_03);
        Panel_03.setLayout(Panel_03Layout);
        Panel_03Layout.setHorizontalGroup(
            Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_03Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 262, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_03Layout.createSequentialGroup()
                        .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        Panel_03Layout.setVerticalGroup(
            Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_03Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_03, new org.netbeans.lib.awtextra.AbsoluteConstraints(910, 120, 280, 100));

        Panel_04.setBackground(new java.awt.Color(102, 102, 102));
        Panel_04.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Button_03.setBackground(new java.awt.Color(51, 204, 0));
        Button_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_03.setText("Editar");
        Button_03.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_03ActionPerformed(evt);
            }
        });

        Button_04.setBackground(new java.awt.Color(255, 0, 0));
        Button_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_04.setText("Eliminar");
        Button_04.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_04ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_04Layout = new javax.swing.GroupLayout(Panel_04);
        Panel_04.setLayout(Panel_04Layout);
        Panel_04Layout.setHorizontalGroup(
            Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_04Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_03, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_04, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_04Layout.setVerticalGroup(
            Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_04Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Button_03, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Button_04, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        getContentPane().add(Panel_04, new org.netbeans.lib.awtextra.AbsoluteConstraints(910, 230, 120, 80));

        Panel_05.setBackground(new java.awt.Color(102, 102, 102));
        Panel_05.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Button_05.setBackground(new java.awt.Color(255, 255, 153));
        Button_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_05.setText("BSNU");
        Button_05.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_05ActionPerformed(evt);
            }
        });

        Button_06.setBackground(new java.awt.Color(255, 255, 153));
        Button_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_06.setText("OBSNU");
        Button_06.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_06ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_05Layout = new javax.swing.GroupLayout(Panel_05);
        Panel_05.setLayout(Panel_05Layout);
        Panel_05Layout.setHorizontalGroup(
            Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_05Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_06, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(21, 21, 21))
        );
        Panel_05Layout.setVerticalGroup(
            Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_05Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Button_06, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        getContentPane().add(Panel_05, new org.netbeans.lib.awtextra.AbsoluteConstraints(1040, 230, 150, 80));

        Panel_06.setBackground(new java.awt.Color(102, 102, 102));
        Panel_06.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_05.setForeground(new java.awt.Color(255, 255, 255));
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_05.setText("Documento Nacional de Identidad:");

        Label_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_06.setForeground(new java.awt.Color(255, 255, 255));
        Label_06.setIcon(new ImageIcon("src//main//java//Imágenes//E_Mail.png"));
        Label_06.setText("Correo Electrónico:");

        Label_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_07.setForeground(new java.awt.Color(255, 255, 255));
        Label_07.setIcon(new ImageIcon("src//main//java//Imágenes//Password.png"));
        Label_07.setText("Contraseña:");

        Label_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_08.setForeground(new java.awt.Color(255, 255, 255));
        Label_08.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_08.setText("Nombres:");

        Label_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_09.setForeground(new java.awt.Color(255, 255, 255));
        Label_09.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_09.setText("Apellidos:");

        Label_10.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_10.setForeground(new java.awt.Color(255, 255, 255));
        Label_10.setIcon(new ImageIcon("src//main//java//Imágenes//Phone.png"));
        Label_10.setText("Teléfono:");

        Label_11.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_11.setForeground(new java.awt.Color(255, 255, 255));
        Label_11.setIcon(new ImageIcon("src//main//java//Imágenes//Address.png"));
        Label_11.setText("Dirección:");

        Label_12.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_12.setForeground(new java.awt.Color(255, 255, 255));
        Label_12.setIcon(new ImageIcon("src//main//java//Imágenes//Calendar.png"));
        Label_12.setText("Fecha de Nacimiento:");

        Label_13.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_13.setForeground(new java.awt.Color(255, 255, 255));
        Label_13.setIcon(new ImageIcon("src//main//java//Imágenes//Calendar.png"));
        Label_13.setText("Fecha de Registro:");

        TextField_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        PasswordField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        CheckBox_01.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                CheckBox_01MouseClicked(evt);
            }
        });

        TextField_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        DateChooser_01.setDateFormatString("dd/MM/yyyy");
        DateChooser_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_09.setEditable(false);
        TextField_09.setBackground(new java.awt.Color(153, 204, 255));
        TextField_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        javax.swing.GroupLayout Panel_06Layout = new javax.swing.GroupLayout(Panel_06);
        Panel_06.setLayout(Panel_06Layout);
        Panel_06Layout.setHorizontalGroup(
            Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_06Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(TextField_06, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_03, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_04, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(PasswordField_01, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_05, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(CheckBox_01)
                .addGap(18, 18, 18)
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(Label_13, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_11, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(Label_12, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TextField_07, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_08, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_09, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_06Layout.setVerticalGroup(
            Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_06Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(Panel_06Layout.createSequentialGroup()
                        .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(PasswordField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(Panel_06Layout.createSequentialGroup()
                        .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(TextField_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(Label_11, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(TextField_08, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(CheckBox_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_12, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(DateChooser_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_09, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_13, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        getContentPane().add(Panel_06, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 350, 1170, 240));

        Button_07.setBackground(new java.awt.Color(153, 204, 255));
        Button_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_07.setText("Reset");
        Button_07.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_07ActionPerformed(evt);
            }
        });
        getContentPane().add(Button_07, new org.netbeans.lib.awtextra.AbsoluteConstraints(910, 320, -1, -1));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_04.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1220, 600));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_03ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_03ActionPerformed
        // TODO add your handling code here:
        Date Obj_Date = DateChooser_01.getDate();

        if ((TextField_03.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Documento Nacional de Identidad del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_03.requestFocus();
        } else {
            if ((TextField_04.getText()).isEmpty() == true) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Correo Electrónico del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_04.requestFocus();
            } else {
                if ((String.valueOf(PasswordField_01.getPassword())).isEmpty() == true) {
                    JOptionPane.showMessageDialog(null, "Campo Requerido: Contraseña 01 del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    PasswordField_01.requestFocus();
                } else {
                    if ((TextField_05.getText()).isEmpty() == true) {
                        JOptionPane.showMessageDialog(null, "Campo Requerido: Nombres del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                        TextField_05.requestFocus();
                    } else {
                        if ((TextField_06.getText()).isEmpty() == true) {
                            JOptionPane.showMessageDialog(null, "Campo Requerido: Apellidos del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_06.requestFocus();
                        } else {
                            if ((TextField_07.getText()).isEmpty() == true) {
                                JOptionPane.showMessageDialog(null, "Campo Requerido: Teléfono del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                TextField_07.requestFocus();
                            } else {
                                if ((TextField_08.getText()).isEmpty() == true) {
                                    JOptionPane.showMessageDialog(null, "Campo Requerido: Dirección del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                    TextField_08.requestFocus();
                                } else {
                                    if (Obj_Date == null) {
                                        JOptionPane.showMessageDialog(null, "Campo Requerido: Fecha de Nacimiento del Usuario.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                    } else {

                                        String DNI_Usuario = (TextField_03.getText()).trim();
                                        String E_Mail_Usuario = (TextField_04.getText()).trim();
                                        String Password_Usuario_Decrypted = (String.valueOf(PasswordField_01.getPassword())).trim();
                                        String Nombre_Usuario = (TextField_05.getText()).trim();
                                        String Apellido_Usuario = (TextField_06.getText()).trim();
                                        String Telefono_Usuario = (TextField_07.getText()).trim();
                                        String Direccion_Usuario = (TextField_08.getText()).trim();

                                        SimpleDateFormat Obj_SimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                        String Fecha_Nacimiento_Usuario = Obj_SimpleDateFormat.format(Obj_Date);

                                        if (this.Validate_DNI_Usuario(DNI_Usuario) == false) {
                                            JOptionPane.showMessageDialog(null, "Ingrese un Documento Nacional de Identidad Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_03.setText("");
                                            TextField_03.requestFocus();
                                        } else {
                                            if ((DNI_Usuario.length()) != 8) {
                                                JOptionPane.showMessageDialog(null, "El Documento Nacional de Identidad debe Contener 8 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_03.setText("");
                                                TextField_03.requestFocus();
                                            } else {
                                                try {
                                                    if (Obj_Controlador_Usuario.Check_DNI_Usuario(DNI_Usuario) == true) {
                                                        JOptionPane.showMessageDialog(null, "El Documento Nacional de Identidad ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                        TextField_03.setText("");
                                                        TextField_03.requestFocus();
                                                    } else {
                                                        System.out.println("DNI_Usuario: Ok!.");
                                                    }
                                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                }
                                            }
                                        }

                                        if (this.Validate_E_Mail_Usuario(E_Mail_Usuario) == false) {
                                            JOptionPane.showMessageDialog(null, "Ingrese un Correo Electrónico Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_04.setText("");
                                            TextField_04.requestFocus();
                                        } else {
                                            if ((E_Mail_Usuario.length()) > 50) {
                                                JOptionPane.showMessageDialog(null, "El Correo Electrónico debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_04.setText("");
                                                TextField_04.requestFocus();
                                            } else {
                                                try {
                                                    if (Obj_Controlador_Usuario.Check_E_Mail_Usuario(E_Mail_Usuario) == true) {
                                                        JOptionPane.showMessageDialog(null, "El Correo Electrónico ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                        TextField_04.setText("");
                                                        TextField_04.requestFocus();
                                                    } else {
                                                        System.out.println("E_Mail_Usuario: Ok!.");
                                                    }
                                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                }
                                            }
                                        }

                                        if (this.Validate_Password_Usuario(Password_Usuario_Decrypted) == false) {
                                            JOptionPane.showMessageDialog(null, "La Contraseña Debe Contener al Menos: Una Letra en Minúscula, Una Letra en Mayúscula, Un Número, Un Caracter Especial y Entre 8 - 20 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            PasswordField_01.setText("");
                                            PasswordField_01.requestFocus();
                                        } else {
                                            System.out.println("Password_Usuario_Decrypted: Ok!.");
                                        }

                                        if (this.Validate_Nombre_Usuario(Nombre_Usuario) == false) {
                                            JOptionPane.showMessageDialog(null, "Ingrese Nombres Válidos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_05.setText("");
                                            TextField_05.requestFocus();
                                        } else {
                                            if ((Nombre_Usuario.length()) > 50) {
                                                JOptionPane.showMessageDialog(null, "El Nombre debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_05.setText("");
                                                TextField_05.requestFocus();
                                            } else {
                                                System.out.println("Nombre_Usuario: Ok!.");
                                            }
                                        }

                                        if (this.Validate_Apellido_Usuario(Apellido_Usuario) == false) {
                                            JOptionPane.showMessageDialog(null, "Ingrese Apellidos Válidos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_06.setText("");
                                            TextField_06.requestFocus();
                                        } else {
                                            if ((Apellido_Usuario.length()) > 50) {
                                                JOptionPane.showMessageDialog(null, "El Apellido debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_06.setText("");
                                                TextField_06.requestFocus();
                                            } else {
                                                System.out.println("Apellido_Usuario: Ok!.");
                                            }
                                        }

                                        if (this.Validate_Telefono_Usuario(Telefono_Usuario) == false) {
                                            JOptionPane.showMessageDialog(null, "Ingrese un Teléfono Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_07.setText("");
                                            TextField_07.requestFocus();
                                        } else {
                                            if ((Telefono_Usuario.length()) != 9) {
                                                JOptionPane.showMessageDialog(null, "El Teléfono debe Contener 9 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                TextField_07.setText("");
                                                TextField_07.requestFocus();
                                            } else {
                                                try {
                                                    if (Obj_Controlador_Usuario.Check_Telefono_Usuario(Telefono_Usuario)) {
                                                        JOptionPane.showMessageDialog(null, "El Teléfono ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                                        TextField_07.setText("");
                                                        TextField_07.requestFocus();
                                                    } else {
                                                        System.out.println("Telefono_Usuario: Ok!.");
                                                    }
                                                } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                                                    Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                                                }
                                            }
                                        }

                                        if ((Direccion_Usuario.length()) > 50) {
                                            JOptionPane.showMessageDialog(null, "La Dirección debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                                            TextField_08.setText("");
                                            TextField_08.requestFocus();
                                        } else {
                                            System.out.println("Direccion_Usuario: Ok!.");
                                        }

                                        if ((TextField_03.getText()).isEmpty() == true || (TextField_04.getText()).isEmpty() == true || (String.valueOf(PasswordField_01.getPassword())).isEmpty() || (TextField_05.getText()).isEmpty() == true || (TextField_06.getText()).isEmpty() == true || (TextField_07.getText()).isEmpty() == true || (TextField_08.getText()).isEmpty() == true) {
                                            System.out.println("Try Again!");
                                        } else {
                                            String Password_Usuario_Encrypted = "";
                                            try {
                                                Password_Usuario_Encrypted = Encryption.Encrypt_Password_Usuario(Password_Usuario_Decrypted);
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

                                            try {
                                                if (Obj_Controlador_Usuario.Editar_Usuario(Obj_Modelo_Usuario, (int) Obj_Object_02[0]) == true) {
                                                    Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                                                    Obj_ArrayList_Object.set(1, 2);
                                                    Obj_ArrayList_Object.set(2, Integer.valueOf(DNI_Usuario));
                                                    Obj_ArrayList_Object.set(3, E_Mail_Usuario);
                                                    Obj_ArrayList_Object.set(4, Password_Usuario_Encrypted);
                                                    Obj_ArrayList_Object.set(5, Nombre_Usuario);
                                                    Obj_ArrayList_Object.set(6, Apellido_Usuario);
                                                    Obj_ArrayList_Object.set(7, Integer.valueOf(Telefono_Usuario));
                                                    Obj_ArrayList_Object.set(8, Direccion_Usuario);
                                                    Obj_ArrayList_Object.set(9, Fecha_Nacimiento_Usuario);
                                                    this.Show_Table_Content_Alternative();
                                                    this.Initial_State();
                                                    JOptionPane.showMessageDialog(null, "Los Datos del Usuario han sido Editados Correctamente.", "Información", JOptionPane.INFORMATION_MESSAGE);
                                                } else {
                                                    JOptionPane.showMessageDialog(null, "Error al Editar el Usuario.", "Error", JOptionPane.ERROR_MESSAGE);
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
    }//GEN-LAST:event_Button_03ActionPerformed

    private void Button_04ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_04ActionPerformed
        // TODO add your handling code here:InternalFrame_Management_Users Obj_InternalFrame_Management_Users = null;
        String Operation = "";

        if ((boolean) Obj_Object_02[1] == true) {
            Operation = "Eliminar";
        } else {
            if ((boolean) Obj_Object_02[1] == false) {
                Operation = "Restaurar";
            }
        }

        int Option_Selected = JOptionPane.showConfirmDialog(null, "¿Desea " + Operation + " el Usuario Seleccionado?.", "Información", JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE);

        switch (Option_Selected) {
            case -1 -> {
                // System.out.println("Option_Selected: " + Option_Selected);
            }
            case 0 -> {
                if ((boolean) Obj_Object_02[1] == true) {
                    try {
                        if (Obj_Controlador_Usuario.Eliminar_Usuario((int) Obj_Object_02[0]) == true) {
                            JOptionPane.showMessageDialog(null, "Usuario Eliminado.", "Información", JOptionPane.INFORMATION_MESSAGE);
                            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                            Obj_ArrayList_Object.set(10, false);
                            this.Show_Table_Content_Alternative();
                            this.Initial_State();
                        } else {
                            JOptionPane.showMessageDialog(null, "Error al Eliminar el Usuario.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, null, Obj_SQLException_ClassNotFoundException.getMessage());
                    }
                } else {
                    if ((boolean) Obj_Object_02[1] == false) {
                        try {
                            if (Obj_Controlador_Usuario.Restaurar_Usuario((int) Obj_Object_02[0]) == true) {
                                JOptionPane.showMessageDialog(null, "Usuario Restaurado.", "Información", JOptionPane.INFORMATION_MESSAGE);
                                Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                                Obj_ArrayList_Object.set(10, true);
                                this.Show_Table_Content_Alternative();
                                this.Initial_State();
                            } else {
                                JOptionPane.showMessageDialog(null, "Error al Restaurar el Usuario.", "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, null, Obj_SQLException_ClassNotFoundException.getMessage());
                        }
                    }
                }
                // System.out.println("Option_Selected: " + Option_Selected);
            }
            case 1 -> {
                // System.out.println("Option_Selected: " + Option_Selected);
            }
            default ->
                System.out.println("Switch_Default_Case");
        }
    }//GEN-LAST:event_Button_04ActionPerformed

    private void CheckBox_01MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_CheckBox_01MouseClicked
        // TODO add your handling code here:
        if (CheckBox_01.isSelected() == true) {
            PasswordField_01.setEchoChar((char) 0);
        } else {
            PasswordField_01.setEchoChar('\u25cf');
        }
    }//GEN-LAST:event_CheckBox_01MouseClicked

    private void TextField_01KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_01KeyPressed
        // TODO add your handling code here:
        String Nombre_Usuario = (TextField_01.getText()).trim();
        if (evt.getExtendedKeyCode() == KeyEvent.VK_ENTER) {
            this.Busqueda_Secuencial(Nombre_Usuario);
        }
    }//GEN-LAST:event_TextField_01KeyPressed

    private void TextField_01KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_01KeyReleased
        // TODO add your handling code here:
        if (((TextField_01.getText()).trim()).equals("") == true) {
            this.Show_Table_Content_Alternative();
        }
    }//GEN-LAST:event_TextField_01KeyReleased

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        String Nombre_Usuario = (TextField_01.getText()).trim();
        this.Busqueda_Secuencial(Nombre_Usuario);
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        if ((TextField_02.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese el ID del Usuario a Buscar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_02.requestFocus();
        } else {
            String ID_Usuario = (TextField_02.getText()).trim();
            if (this.Validate_ID_Usuario(ID_Usuario) == false) {
                JOptionPane.showMessageDialog(null, "Ingrese un ID Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_02.setText("");
                TextField_02.requestFocus();
            } else {
                Obj_Object_01 = new Object[12];
                this.Busqueda_Binaria(Obj_ArrayList_ArrayList_Object, Integer.parseInt(ID_Usuario));
                if (Obj_Object_01[0] == null) {
                    JOptionPane.showMessageDialog(null, "El ID del Usuario no se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                } else {
                    if (Obj_Object_01[0] != null) {
                        String Data = "";
                        String Password_Usuario_Encrypted = (Obj_Object_01[4]).toString();
                        String Password_Usuario_Decrypted = null;

                        try {
                            Password_Usuario_Decrypted = Encryption.Decrypt_Password_Usuario(Password_Usuario_Encrypted);
                        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
                            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
                        }

                        Data = "ID_Usuario: " + Obj_Object_01[0] + "\n";
                        Data += "Cargo_Usuario: " + Obj_Object_01[1] + "\n";
                        Data += "DNI_Usuario: " + Obj_Object_01[2] + "\n";
                        Data += "E_Mail_Usuario: " + Obj_Object_01[3] + "\n";
                        Data += "Contraseña_Usuario: " + Password_Usuario_Decrypted + "\n";
                        Data += "Nombre_Usuario: " + Obj_Object_01[5] + "\n";
                        Data += "Apellido_Usuario: " + Obj_Object_01[6] + "\n";
                        Data += "Telefono_Usuario: " + Obj_Object_01[7] + "\n";
                        Data += "Direccion_Usuario: " + Obj_Object_01[8] + "\n";
                        Data += "Fecha_Nacimiento_Usuario: " + Obj_Object_01[9] + "\n";
                        Data += "Estado_Usuario: " + Obj_Object_01[10] + "\n";
                        Data += "Fecha_Registro_Usuario: " + Obj_Object_01[11] + "\n";
                        TextField_02.setText("");
                        JOptionPane.showMessageDialog(null, Data, "Información", JOptionPane.INFORMATION_MESSAGE);
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_02ActionPerformed

    private void Button_07ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_07ActionPerformed
        // TODO add your handling code here:
        this.Show_Table_Content_Alternative();
    }//GEN-LAST:event_Button_07ActionPerformed

    private void Button_05ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_05ActionPerformed
        // TODO add your handling code here:
        this.Bubble_Sort_Nombre_Usuario();
    }//GEN-LAST:event_Button_05ActionPerformed

    private void Button_06ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_06ActionPerformed
        // TODO add your handling code here:
        this.Optimized_Bubble_Sort_Nombre_Usuario();
    }//GEN-LAST:event_Button_06ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JButton Button_03;
    private javax.swing.JButton Button_04;
    private javax.swing.JButton Button_05;
    private javax.swing.JButton Button_06;
    private javax.swing.JButton Button_07;
    private javax.swing.JCheckBox CheckBox_01;
    private com.toedter.calendar.JDateChooser DateChooser_01;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_05;
    private javax.swing.JLabel Label_06;
    private javax.swing.JLabel Label_07;
    private javax.swing.JLabel Label_08;
    private javax.swing.JLabel Label_09;
    private javax.swing.JLabel Label_10;
    private javax.swing.JLabel Label_11;
    private javax.swing.JLabel Label_12;
    private javax.swing.JLabel Label_13;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JPanel Panel_03;
    private javax.swing.JPanel Panel_04;
    private javax.swing.JPanel Panel_05;
    private javax.swing.JPanel Panel_06;
    private javax.swing.JPasswordField PasswordField_01;
    private javax.swing.JScrollPane ScrollPane_01;
    private javax.swing.JTable Table_01;
    private javax.swing.JTextField TextField_01;
    private javax.swing.JTextField TextField_02;
    private javax.swing.JTextField TextField_03;
    private javax.swing.JTextField TextField_04;
    private javax.swing.JTextField TextField_05;
    private javax.swing.JTextField TextField_06;
    private javax.swing.JTextField TextField_07;
    private javax.swing.JTextField TextField_08;
    private javax.swing.JTextField TextField_09;
    // End of variables declaration//GEN-END:variables
}
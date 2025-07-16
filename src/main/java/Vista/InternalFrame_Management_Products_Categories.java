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
import Controlador.Controlador_Categoria_Producto;
import java.util.ArrayList;
import Modelo.Modelo_Categoria_Producto;
import java.util.logging.Logger;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Level;
// import javax.swing.table.DefaultTableCellRenderer;
// import java.awt.Component;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Point;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import javax.swing.JOptionPane;
import java.awt.event.KeyEvent;

/**
 *
 * @author JuanCin20
 */
public class InternalFrame_Management_Products_Categories extends javax.swing.JInternalFrame {

    /**
     * Creates new form InternalFrame_Management_Products_Categories
     *
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public InternalFrame_Management_Products_Categories() throws SQLException, ClassNotFoundException {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: Management Products Categories");
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
        Obj_DefaultTableModel.addColumn("ID de la Categoría");
        Obj_DefaultTableModel.addColumn("Nombre de la Categoría");
        Obj_DefaultTableModel.addColumn("Descripción de la Categoría");
        Obj_DefaultTableModel.addColumn("Estado de la Categoría");
        Obj_DefaultTableModel.addColumn("Fecha de Registro de la Categoría");
        Obj_DefaultTableModel.addColumn("Product_Number");
    }

    private final Controlador_Categoria_Producto Obj_Controlador_Categoria_Producto = new Controlador_Categoria_Producto();

    /* private void Show_Table_Content() {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        ArrayList<Modelo_Categoria_Producto> Obj_ArrayList_Modelo_Categoria_Producto = new ArrayList<>();
        try {
            Obj_ArrayList_Modelo_Categoria_Producto = Obj_Controlador_Categoria_Producto.ArrayList_Modelo_Categoria_Producto();
        } catch (SQLException Obj_SQLException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException.getMessage());
        }

        Object Obj_Object[] = new Object[6];

        for (int i = 0; i < Obj_ArrayList_Modelo_Categoria_Producto.size(); i++) {
            Obj_Object[0] = ((Obj_ArrayList_Modelo_Categoria_Producto.get(i))).getID_Categoria_Producto();
            Obj_Object[1] = (Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getNombre_Categoria_Producto();
            Obj_Object[2] = (Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getDescripcion_Categoria_Producto();

            if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == true) {
                Obj_Object[3] = "Disponible";
            } else {
                if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == false) {
                    Obj_Object[3] = "No Disponible";
                }
            }

            Obj_Object[4] = (Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getFecha_Registro_Categoria_Producto();
            Obj_Object[5] = (Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getProduct_Number();
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object);
        }
    } */
    private final ArrayList<Modelo_Categoria_Producto> Obj_ArrayList_Modelo_Categoria_Producto = Obj_Controlador_Categoria_Producto.ArrayList_Modelo_Categoria_Producto();
    private final ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = Obj_Controlador_Categoria_Producto.ArrayList_ArrayList_Object();
    private ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
    private Object Obj_Object_01[] = new Object[6];
    private Modelo_Categoria_Producto Obj_Modelo_Categoria_Producto = new Modelo_Categoria_Producto();

    private void Show_Table_Content_Alternative() {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
            Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object.get(i)).get(0);
            Obj_Object_01[1] = (Obj_ArrayList_ArrayList_Object.get(i)).get(1);
            Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object.get(i)).get(2);

            if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(3)).toString()).equals("true") == true) {
                Obj_Object_01[3] = "Disponible";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(3)).toString()).equals("false") == true) {
                    Obj_Object_01[3] = "No Disponible";
                }
            }

            Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object.get(i)).get(4);
            Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object.get(i)).get(5);
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
        }
    }

    private void Busqueda_Secuencial(String Nombre_Categoria_Producto) {
        Obj_DefaultTableModel.setRowCount(0);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

        if (Obj_ArrayList_ArrayList_Object.isEmpty() == false) {
            for (int i = 0; i < Obj_ArrayList_ArrayList_Object.size(); i++) {
                if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(1)).toString()).equalsIgnoreCase(Nombre_Categoria_Producto) == true) {
                    Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object.get(i)).get(0);
                    Obj_Object_01[1] = (Obj_ArrayList_ArrayList_Object.get(i)).get(1);
                    Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object.get(i)).get(2);

                    if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(3)).toString()).equals("true") == true) {
                        Obj_Object_01[3] = "Disponible";
                    } else {
                        if ((((Obj_ArrayList_ArrayList_Object.get(i)).get(3)).toString()).equals("false") == true) {
                            Obj_Object_01[3] = "No Disponible";
                        }
                    }

                    Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object.get(i)).get(4);
                    Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object.get(i)).get(5);
                    Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
                }
            }
        }
    }

    private void Busqueda_Binaria(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object, int ID_Categoria_Producto) {
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object.size() - 1;
        boolean Found_Status = false;

        while (Begin_ArrayList_Index <= End_ArrayList_Index && Found_Status == false) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(0) == ID_Categoria_Producto) {
                Obj_Object_01[0] = Control_ArrayList.get(0);
                Obj_Object_01[1] = Control_ArrayList.get(1);
                Obj_Object_01[2] = Control_ArrayList.get(2);

                if (((Control_ArrayList.get(3)).toString()).equals("true") == true) {
                    Obj_Object_01[3] = "Disponible";
                } else {
                    if (((Control_ArrayList.get(3)).toString()).equals("false") == true) {
                        Obj_Object_01[3] = "No Disponible";
                    }
                }
                Obj_Object_01[4] = Control_ArrayList.get(4);
                Obj_Object_01[5] = Control_ArrayList.get(5);
                Found_Status = true;
            } else {
                if (ID_Categoria_Producto < (int) Control_ArrayList.get(0)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Categoria_Producto > (int) Control_ArrayList.get(0)) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
    }

    /* private Object[] Busqueda_Binaria_Alternative(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object, int ID_Categoria_Producto) {
        Object Obj_Object_03[] = new Object[6];
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object.size();

        while (Begin_ArrayList_Index <= End_ArrayList_Index) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(0) == ID_Categoria_Producto) {
                Obj_Object_03[0] = Control_ArrayList.get(0);
                Obj_Object_03[1] = Control_ArrayList.get(1);
                Obj_Object_03[2] = Control_ArrayList.get(2);

                if (((Control_ArrayList.get(3)).toString()).equals("true") == true) {
                    Obj_Object_03[3] = "Disponible";
                } else {
                    if (((Control_ArrayList.get(3)).toString()).equals("false") == true) {
                        Obj_Object_03[3] = "No Disponible";
                    }
                }
                Obj_Object_03[4] = Control_ArrayList.get(4);
                Obj_Object_03[5] = Control_ArrayList.get(5);
                return Obj_Object_03;
            } else {
                if (ID_Categoria_Producto < (int) Control_ArrayList.get(0)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Categoria_Producto > (int) Control_ArrayList.get(0)) {
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
                String Estado_Categoria_Producto = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 3)).toString();

                if (Estado_Categoria_Producto.equals("Disponible") == true) {
                    Obj_Component.setFont(new Font("Yu Gothic UI", Font.BOLD, 14));
                    Obj_Component.setForeground(Color.BLACK);
                    Obj_Component.setBackground(Color.GREEN);
                } else {
                    if (Estado_Categoria_Producto.equals("No Disponible") == true) {
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
        for (int i = 0; i <= 5; i++) {
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

                    String Estado_Categoria_Producto = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 3)).toString();

                    if (Estado_Categoria_Producto.equals("Disponible") == true) {
                        Table_01.setSelectionForeground(Color.BLACK);
                        Table_01.setSelectionBackground(Color.GREEN);
                    } else {
                        if (Estado_Categoria_Producto.equals("No Disponible") == true) {
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

                    TextField_03.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 1)).toString());
                    TextArea_01.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 2)).toString());
                    TextField_04.setText((Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 4)).toString());
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

                    String Estado_Categoria_Producto = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 3)).toString();

                    if (Estado_Categoria_Producto.equals("Disponible") == true) {
                        Button_03.setEnabled(true);
                        Button_04.setEnabled(true);
                        Button_04.setText("Eliminar");
                        Button_04.setBackground(Color.RED);
                        TextField_03.setEnabled(true);
                        TextArea_01.setEnabled(true);
                    } else {
                        if (Estado_Categoria_Producto.equals("No Disponible") == true) {
                            Button_03.setEnabled(false);
                            Button_04.setEnabled(true);
                            Button_04.setText("Restaurar");
                            Button_04.setBackground(Color.YELLOW);
                            TextField_03.setEnabled(false);
                            TextArea_01.setEnabled(false);
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

                    String ID_Categoria_Producto = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 0)).toString();
                    Obj_Object_02[0] = Integer.valueOf(ID_Categoria_Producto);

                    String Estado_Categoria_Producto = (Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, 3)).toString();
                    if (Estado_Categoria_Producto.equals("Disponible") == true) {
                        Obj_Object_02[1] = true;
                    } else {
                        if (Estado_Categoria_Producto.equals("No Disponible") == true) {
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
        TextArea_01.setEnabled(false);
        TextArea_01.setText("");
        TextField_04.setText("");
    }

    private boolean Validate_ID_Categoria_Producto(String ID_Categoria_Producto) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(ID_Categoria_Producto);
        return Obj_Matcher.find();
    }

    /* private String Print_ArrayList_Model() {
        String Data = "";
        for (int i = 0; i < Obj_ArrayList_Modelo_Categoria_Producto.size(); i++) {
            Data += Obj_ArrayList_Modelo_Categoria_Producto.get(i) + "\n";
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
    private void Bubble_Sort_Nombre_Categoria_Producto() {
        for (int i = 0; i < (Obj_ArrayList_Modelo_Categoria_Producto.size() - 1); i++) {
            for (int j = 0; j < (Obj_ArrayList_Modelo_Categoria_Producto.size() - 1); j++) {
                if (((Obj_ArrayList_Modelo_Categoria_Producto.get(j)).getNombre_Categoria_Producto()).compareToIgnoreCase((Obj_ArrayList_Modelo_Categoria_Producto.get(j + 1)).getNombre_Categoria_Producto()) > 0) {
                    Obj_Modelo_Categoria_Producto = Obj_ArrayList_Modelo_Categoria_Producto.get(j);
                    Obj_ArrayList_Modelo_Categoria_Producto.set(j, Obj_ArrayList_Modelo_Categoria_Producto.get(j + 1));
                    Obj_ArrayList_Modelo_Categoria_Producto.set(j + 1, Obj_Modelo_Categoria_Producto);
                }
            }
        }

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_Modelo_Categoria_Producto.size(); i++) {
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getID_Categoria_Producto(), i, 0);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getNombre_Categoria_Producto(), i, 1);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getDescripcion_Categoria_Producto(), i, 2);
            if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == true) {
                Obj_DefaultTableModel_Alternative.setValueAt("Disponible", i, 3);
            } else {
                if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == false) {
                    Obj_DefaultTableModel_Alternative.setValueAt("No Disponible", i, 3);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getFecha_Registro_Categoria_Producto(), i, 4);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getProduct_Number(), i, 5);
        }
    }

    private void Optimized_Bubble_Sort_Nombre_Categoria_Producto() {
        int Counter = 0;
        boolean Swapped;
        do {
            Swapped = false;
            for (int i = 0; i < (Obj_ArrayList_Modelo_Categoria_Producto.size() - 1); i++) {
                if (((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getNombre_Categoria_Producto()).compareToIgnoreCase((Obj_ArrayList_Modelo_Categoria_Producto.get(i + 1)).getNombre_Categoria_Producto()) > 0) {
                    Obj_Modelo_Categoria_Producto = Obj_ArrayList_Modelo_Categoria_Producto.get(i);
                    Obj_ArrayList_Modelo_Categoria_Producto.set(i, Obj_ArrayList_Modelo_Categoria_Producto.get(i + 1));
                    Obj_ArrayList_Modelo_Categoria_Producto.set(i + 1, Obj_Modelo_Categoria_Producto);
                    Swapped = true;
                }
            }
            Counter++;
        } while (Swapped == true);

        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_Modelo_Categoria_Producto.size(); i++) {
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getID_Categoria_Producto(), i, 0);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getNombre_Categoria_Producto(), i, 1);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getDescripcion_Categoria_Producto(), i, 2);
            if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == true) {
                Obj_DefaultTableModel_Alternative.setValueAt("Disponible", i, 3);
            } else {
                if ((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).isEstado_Categoria_Producto() == false) {
                    Obj_DefaultTableModel_Alternative.setValueAt("No Disponible", i, 3);
                }
            }
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getFecha_Registro_Categoria_Producto(), i, 4);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Categoria_Producto.get(i)).getProduct_Number(), i, 5);
        }
        System.out.println("Steps Quantity, Optimized = " + Counter);
    }

    private void Bubble_Sort_Product_Number() {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative = (ArrayList) Obj_ArrayList_ArrayList_Object.clone();

        int Counter = 0;
        for (int i = 0; i < Obj_ArrayList_ArrayList_Object_Alternative.size(); i++) {
            Counter = i + 1;
            for (int j = 1; j < (Obj_ArrayList_ArrayList_Object_Alternative.size() - i); j++) {
                if ((int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j - 1)).get(5) > (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j)).get(5)) {
                    Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Alternative.get(j - 1);
                    Obj_ArrayList_ArrayList_Object_Alternative.set(j - 1, Obj_ArrayList_ArrayList_Object_Alternative.get(j));
                    Obj_ArrayList_ArrayList_Object_Alternative.set(j, Obj_ArrayList_Object);
                }
            }
        }

        Obj_DefaultTableModel.setRowCount(0);
        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_ArrayList_Object_Alternative.size(); i++) {
            Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(0);
            Obj_Object_01[1] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(1);
            Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(2);

            if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("true") == true) {
                Obj_Object_01[3] = "Disponible";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("false") == true) {
                    Obj_Object_01[3] = "No Disponible";
                }
            }

            Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(4);
            Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(5);
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
        }
        System.out.println("Steps Quantity, non Optimized = " + Counter);
    }

    private void Optimized_Bubble_Sort_Product_Number() {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative = (ArrayList) Obj_ArrayList_ArrayList_Object.clone();

        int Counter = 0;
        boolean Swapped;
        for (int i = 0; i < (Obj_ArrayList_ArrayList_Object_Alternative.size() - 1); i++) {
            Counter = i + 1;
            Swapped = false;
            for (int j = 0; j < (Obj_ArrayList_ArrayList_Object_Alternative.size() - i) - 1; j++) {
                if ((int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j)).get(5) > (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j + 1)).get(5)) {
                    Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Alternative.get(j);
                    Obj_ArrayList_ArrayList_Object_Alternative.set(j, Obj_ArrayList_ArrayList_Object_Alternative.get(j + 1));
                    Obj_ArrayList_ArrayList_Object_Alternative.set(j + 1, Obj_ArrayList_Object);
                    Swapped = true;
                }
            }

            if (Swapped == false) {
                break;
            }
        }

        Obj_DefaultTableModel.setRowCount(0);
        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_ArrayList_Object_Alternative.size(); i++) {
            Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(0);
            Obj_Object_01[1] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(1);
            Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(2);

            if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("true") == true) {
                Obj_Object_01[3] = "Disponible";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("false") == true) {
                    Obj_Object_01[3] = "No Disponible";
                }
            }

            Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(4);
            Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(5);
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
        }
        System.out.println("Steps Quantity, Optimized = " + Counter);
    }

    private void Selection_Sort_Product_Number() {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative = (ArrayList) Obj_ArrayList_ArrayList_Object.clone();

        for (int i = 0; i < Obj_ArrayList_ArrayList_Object_Alternative.size() - 1; i++) {
            int Left = i;
            for (int j = i + 1; j < Obj_ArrayList_ArrayList_Object_Alternative.size(); j++) {
                if ((int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j)).get(5) < (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(Left)).get(5)) {
                    Left = j;
                }
            }
            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Alternative.get(i);
            Obj_ArrayList_ArrayList_Object_Alternative.set(i, Obj_ArrayList_ArrayList_Object_Alternative.get(Left));
            Obj_ArrayList_ArrayList_Object_Alternative.set(Left, Obj_ArrayList_Object);
        }

        Obj_DefaultTableModel.setRowCount(0);
        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        for (int i = 0; i < Obj_ArrayList_ArrayList_Object_Alternative.size(); i++) {
            Obj_Object_01[0] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(0);
            Obj_Object_01[1] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(1);
            Obj_Object_01[2] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(2);

            if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("true") == true) {
                Obj_Object_01[3] = "Disponible";
            } else {
                if ((((Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(3)).toString()).equals("false") == true) {
                    Obj_Object_01[3] = "No Disponible";
                }
            }

            Obj_Object_01[4] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(4);
            Obj_Object_01[5] = (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(5);
            Obj_DefaultTableModel_Alternative.addRow(Obj_Object_01);
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
        Button_07 = new javax.swing.JButton();
        Button_08 = new javax.swing.JButton();
        Button_09 = new javax.swing.JButton();
        Panel_06 = new javax.swing.JPanel();
        Label_04 = new javax.swing.JLabel();
        Label_05 = new javax.swing.JLabel();
        Label_06 = new javax.swing.JLabel();
        TextField_03 = new javax.swing.JTextField();
        ScrollPane_02 = new javax.swing.JScrollPane();
        TextArea_01 = new javax.swing.JTextArea();
        TextField_04 = new javax.swing.JTextField();
        Button_10 = new javax.swing.JButton();
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
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 442, Short.MAX_VALUE)
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 312, Short.MAX_VALUE)
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, 460, 330));

        Panel_02.setBackground(new java.awt.Color(102, 102, 102));
        Panel_02.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_02.setForeground(new java.awt.Color(255, 255, 255));
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_02.setText("Búsqueda (Secuencial - Nombre_Categoria_Producto):");

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
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_02Layout.createSequentialGroup()
                        .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 193, javax.swing.GroupLayout.PREFERRED_SIZE)
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

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 20, 350, 100));

        Panel_03.setBackground(new java.awt.Color(102, 102, 102));
        Panel_03.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_03.setText("Búsqueda (Binaria - ID_Categoria_Producto):");

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
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_03Layout.createSequentialGroup()
                        .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 193, javax.swing.GroupLayout.PREFERRED_SIZE)
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
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_03, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 130, 350, 100));

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

        getContentPane().add(Panel_04, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 240, 120, 80));

        Panel_05.setBackground(new java.awt.Color(102, 102, 102));
        Panel_05.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Button_05.setBackground(new java.awt.Color(255, 255, 153));
        Button_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_05.setText("BSNCP");
        Button_05.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_05ActionPerformed(evt);
            }
        });

        Button_06.setBackground(new java.awt.Color(255, 255, 153));
        Button_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_06.setText("OBSNCP");
        Button_06.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_06ActionPerformed(evt);
            }
        });

        Button_07.setBackground(new java.awt.Color(255, 255, 153));
        Button_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_07.setText("BSPN");
        Button_07.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_07ActionPerformed(evt);
            }
        });

        Button_08.setBackground(new java.awt.Color(255, 255, 153));
        Button_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_08.setText("OBSPN");
        Button_08.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_08ActionPerformed(evt);
            }
        });

        Button_09.setBackground(new java.awt.Color(255, 255, 153));
        Button_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_09.setText("SSPN");
        Button_09.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_09ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_05Layout = new javax.swing.GroupLayout(Panel_05);
        Panel_05.setLayout(Panel_05Layout);
        Panel_05Layout.setHorizontalGroup(
            Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_05Layout.createSequentialGroup()
                .addGap(12, 12, 12)
                .addGroup(Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_09, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_05Layout.createSequentialGroup()
                        .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_07, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(Panel_05Layout.createSequentialGroup()
                        .addComponent(Button_06, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_08, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(12, 12, 12))
        );
        Panel_05Layout.setVerticalGroup(
            Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_05Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_07, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(Panel_05Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_06, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_08, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Button_09, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        getContentPane().add(Panel_05, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 240, 220, -1));

        Panel_06.setBackground(new java.awt.Color(102, 102, 102));
        Panel_06.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_04.setForeground(new java.awt.Color(255, 255, 255));
        Label_04.setIcon(new ImageIcon("src//main//java//Imágenes//Category.png"));
        Label_04.setText("Nombre:");

        Label_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_05.setForeground(new java.awt.Color(255, 255, 255));
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//Category.png"));
        Label_05.setText("Descripción:");

        Label_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_06.setForeground(new java.awt.Color(255, 255, 255));
        Label_06.setIcon(new ImageIcon("src//main//java//Imágenes//Category.png"));
        Label_06.setText("Fecha de Registro:");

        TextField_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextArea_01.setColumns(20);
        TextArea_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextArea_01.setRows(5);
        ScrollPane_02.setViewportView(TextArea_01);

        TextField_04.setEditable(false);
        TextField_04.setBackground(new java.awt.Color(153, 204, 255));
        TextField_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        javax.swing.GroupLayout Panel_06Layout = new javax.swing.GroupLayout(Panel_06);
        Panel_06.setLayout(Panel_06Layout);
        Panel_06Layout.setHorizontalGroup(
            Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_06Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ScrollPane_02, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        Panel_06Layout.setVerticalGroup(
            Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_06Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_06Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ScrollPane_02, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_06, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 360, 820, 200));

        Button_10.setBackground(new java.awt.Color(153, 204, 255));
        Button_10.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_10.setText("Reset");
        Button_10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_10ActionPerformed(evt);
            }
        });
        getContentPane().add(Button_10, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 330, -1, -1));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_04.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 860, 570));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void TextField_01KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_01KeyPressed
        // TODO add your handling code here:
        String Nombre_Categoria_Producto = (TextField_01.getText()).trim();
        if (evt.getExtendedKeyCode() == KeyEvent.VK_ENTER) {
            this.Busqueda_Secuencial(Nombre_Categoria_Producto);
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
        String Nombre_Categoria_Producto = (TextField_01.getText()).trim();
        this.Busqueda_Secuencial(Nombre_Categoria_Producto);
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        if ((TextField_02.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese el ID de la Categoría del Producto a Buscar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_02.requestFocus();
        } else {
            String ID_Categoria_Producto = (TextField_02.getText()).trim();
            if (this.Validate_ID_Categoria_Producto(ID_Categoria_Producto) == false) {
                JOptionPane.showMessageDialog(null, "Ingrese un ID Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_02.setText("");
                TextField_02.requestFocus();
            } else {
                Obj_Object_01 = new Object[6];
                this.Busqueda_Binaria(Obj_ArrayList_ArrayList_Object, Integer.parseInt(ID_Categoria_Producto));
                if (Obj_Object_01[0] == null) {
                    JOptionPane.showMessageDialog(null, "El ID de la Categoría del Producto no se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                } else {
                    if (Obj_Object_01[0] != null) {
                        String Data = "";
                        Data = "ID_Categoria_Producto: " + Obj_Object_01[0] + "\n";
                        Data += "Nombre_Categoria_Producto: " + Obj_Object_01[1] + "\n";
                        Data += "Descripcion_Categoria_Producto: " + Obj_Object_01[2] + "\n";
                        Data += "Estado_Categoria_Producto: " + Obj_Object_01[3] + "\n";
                        Data += "Fecha_Registro_Categoria_Producto: " + Obj_Object_01[4] + "\n";
                        Data += "Product_Number: " + Obj_Object_01[5] + "\n";
                        TextField_02.setText("");
                        JOptionPane.showMessageDialog(null, Data, "Información", JOptionPane.INFORMATION_MESSAGE);
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_02ActionPerformed

    private void Button_03ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_03ActionPerformed
        // TODO add your handling code here:
        if ((TextField_03.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Campo Requerido: Nombre de la Categoría del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_03.requestFocus();
        } else {
            if ((TextArea_01.getText()).isEmpty() == true) {
                JOptionPane.showMessageDialog(null, "Campo Requerido: Descripción de la Categoría del Producto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextArea_01.requestFocus();
            } else {
                String Nombre_Categoria_Producto = (TextField_03.getText()).trim();
                String Descripcion_Categoria_Producto = (TextArea_01.getText()).trim();

                if ((Nombre_Categoria_Producto.length()) > 50) {
                    JOptionPane.showMessageDialog(null, "El Nombre debe Contener un Máximo de 50 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextField_03.setText("");
                    TextField_03.requestFocus();
                } else {
                    try {
                        if (Obj_Controlador_Categoria_Producto.Check_Nombre_Categoria_Producto(Nombre_Categoria_Producto) == true) {
                            JOptionPane.showMessageDialog(null, "El Nombre ya se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                            TextField_03.setText("");
                            TextField_03.requestFocus();
                        } else {
                            System.out.println("Nombre_Categoria_Producto: Ok!.");
                        }
                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
                    }
                }

                if ((Descripcion_Categoria_Producto.length()) > 260) {
                    JOptionPane.showMessageDialog(null, "La Descripción debe Contener un Máximo de 260 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextArea_01.setText("");
                    TextArea_01.requestFocus();
                } else {
                    System.out.println("Descripcion_Categoria_Producto: Ok!.");
                }

                if ((TextField_03.getText()).isEmpty() == true || (TextArea_01.getText()).isEmpty() == true) {
                    System.out.println("Try Again!");
                } else {
                    Obj_Modelo_Categoria_Producto.setNombre_Categoria_Producto(Nombre_Categoria_Producto);
                    Obj_Modelo_Categoria_Producto.setDescripcion_Categoria_Producto(Descripcion_Categoria_Producto);

                    try {
                        if (Obj_Controlador_Categoria_Producto.Editar_Categoria_Producto(Obj_Modelo_Categoria_Producto, (int) Obj_Object_02[0]) == true) {
                            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                            Obj_ArrayList_Object.set(1, Nombre_Categoria_Producto);
                            Obj_ArrayList_Object.set(2, Descripcion_Categoria_Producto);
                            this.Show_Table_Content_Alternative();
                            this.Initial_State();
                            JOptionPane.showMessageDialog(null, "Los Datos de la Categoría del Producto han sido Editados Correctamente.", "Información", JOptionPane.INFORMATION_MESSAGE);
                        } else {
                            JOptionPane.showMessageDialog(null, "Error al Editar la Categoría del Producto.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
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

        int Option_Selected = JOptionPane.showConfirmDialog(null, "¿Desea " + Operation + " la Categoría del Producto Seleccionada?.", "Información", JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE);

        switch (Option_Selected) {
            case -1 -> {
                // System.out.println("Option_Selected: " + Option_Selected);
            }
            case 0 -> {
                if ((boolean) Obj_Object_02[1] == true) {
                    try {
                        if (Obj_Controlador_Categoria_Producto.Eliminar_Categoria_Producto((int) Obj_Object_02[0]) == true) {
                            JOptionPane.showMessageDialog(null, "Categoría del Producto Eliminada.", "Información", JOptionPane.INFORMATION_MESSAGE);
                            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                            Obj_ArrayList_Object.set(3, false);
                            this.Show_Table_Content_Alternative();
                            this.Initial_State();
                        } else {
                            JOptionPane.showMessageDialog(null, "Error al Eliminar la Categoría del Producto.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                    } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
                        Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, null, Obj_SQLException_ClassNotFoundException.getMessage());
                    }
                } else {
                    if ((boolean) Obj_Object_02[1] == false) {
                        try {
                            if (Obj_Controlador_Categoria_Producto.Restaurar_Categoria_Producto((int) Obj_Object_02[0]) == true) {
                                JOptionPane.showMessageDialog(null, "Categoría del Producto Restaurada.", "Información", JOptionPane.INFORMATION_MESSAGE);
                                Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object.get(((int) Obj_Object_02[0] - 1));
                                Obj_ArrayList_Object.set(3, true);
                                this.Show_Table_Content_Alternative();
                                this.Initial_State();
                            } else {
                                JOptionPane.showMessageDialog(null, "Error al Restaurar la Categoría del Producto.", "Error", JOptionPane.ERROR_MESSAGE);
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

    private void Button_10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_10ActionPerformed
        // TODO add your handling code here:
        this.Show_Table_Content_Alternative();
    }//GEN-LAST:event_Button_10ActionPerformed

    private void Button_05ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_05ActionPerformed
        // TODO add your handling code here:
        this.Bubble_Sort_Nombre_Categoria_Producto();
    }//GEN-LAST:event_Button_05ActionPerformed

    private void Button_06ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_06ActionPerformed
        // TODO add your handling code here:
        this.Optimized_Bubble_Sort_Nombre_Categoria_Producto();
    }//GEN-LAST:event_Button_06ActionPerformed

    private void Button_07ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_07ActionPerformed
        // TODO add your handling code here:
        this.Bubble_Sort_Product_Number();
    }//GEN-LAST:event_Button_07ActionPerformed

    private void Button_08ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_08ActionPerformed
        // TODO add your handling code here:
        this.Optimized_Bubble_Sort_Product_Number();
    }//GEN-LAST:event_Button_08ActionPerformed

    private void Button_09ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_09ActionPerformed
        // TODO add your handling code here:
        this.Selection_Sort_Product_Number();
    }//GEN-LAST:event_Button_09ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JButton Button_03;
    private javax.swing.JButton Button_04;
    private javax.swing.JButton Button_05;
    private javax.swing.JButton Button_06;
    private javax.swing.JButton Button_07;
    private javax.swing.JButton Button_08;
    private javax.swing.JButton Button_09;
    private javax.swing.JButton Button_10;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_04;
    private javax.swing.JLabel Label_05;
    private javax.swing.JLabel Label_06;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JPanel Panel_03;
    private javax.swing.JPanel Panel_04;
    private javax.swing.JPanel Panel_05;
    private javax.swing.JPanel Panel_06;
    private javax.swing.JScrollPane ScrollPane_01;
    private javax.swing.JScrollPane ScrollPane_02;
    private javax.swing.JTable Table_01;
    private javax.swing.JTextArea TextArea_01;
    private javax.swing.JTextField TextField_01;
    private javax.swing.JTextField TextField_02;
    private javax.swing.JTextField TextField_03;
    private javax.swing.JTextField TextField_04;
    // End of variables declaration//GEN-END:variables
}
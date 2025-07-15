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
import Controlador.Controlador_Cliente;
import Controlador.Controlador_Producto;
import Controlador.Controlador_Boleta_Venta;
import Controlador.Controlador_Detalle_Boleta_Venta;
import java.util.ArrayList;
import Modelo.Modelo_Detalle_Boleta_Venta;
import java.text.DecimalFormat;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Point;
import javax.swing.JOptionPane;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.awt.event.KeyEvent;
import Modelo.Modelo_Boleta_Venta;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import Controlador.Controlador_Usuario;
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
public class InternalFrame_New_Sell extends javax.swing.JInternalFrame {

    /**
     * Creates new form Frame_Venta
     *
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public InternalFrame_New_Sell() throws SQLException, ClassNotFoundException {
        initComponents();
        this.setTitle("Pc - Factory Desktop App: New Sell");
        this.Initialize_Table();
        this.Show_Table_Header();
        this.Show_Table_Content_02();
        this.Initial_State();
        UIManager.put("OptionPane.okButtonText", "Aceptar");
        UIManager.put("OptionPane.yesButtonText", "Aceptar");
        UIManager.put("OptionPane.noButtonText", "Volver");
        UIManager.put("OptionPane.cancelButtonText", "Cancelar");
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
        Obj_DefaultTableModel.addColumn("Nombre");
        Obj_DefaultTableModel.addColumn("Cantidad");
        Obj_DefaultTableModel.addColumn("Precio");
        Obj_DefaultTableModel.addColumn("Subtotal");
        Obj_DefaultTableModel.addColumn("Descuento");
        Obj_DefaultTableModel.addColumn("IGV");
        Obj_DefaultTableModel.addColumn("Total");
        Obj_DefaultTableModel.addColumn("Operación");
    }

    private final Controlador_Cliente Obj_Controlador_Cliente = new Controlador_Cliente();
    private final Controlador_Producto Obj_Controlador_Producto = new Controlador_Producto();
    private final Controlador_Boleta_Venta Obj_Controlador_Boleta_Venta = new Controlador_Boleta_Venta();
    private final Controlador_Detalle_Boleta_Venta Obj_Controlador_Detalle_Boleta_Venta = new Controlador_Detalle_Boleta_Venta();
    private final ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Cliente = Obj_Controlador_Cliente.ArrayList_ArrayList_Object();
    private final ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Producto = Obj_Controlador_Producto.ArrayList_ArrayList_Object();
    private final ArrayList<Modelo_Detalle_Boleta_Venta> Obj_ArrayList_Modelo_Detalle_Boleta_Venta = new ArrayList<>();
    private ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
    private Object Obj_Object_Cliente[] = new Object[6];
    private Object Obj_Object_Producto[] = new Object[9];
    private final DecimalFormat Obj_DecimalFormat = new DecimalFormat("00.00");

    private void Show_Table_Content_01() {
        DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();
        Obj_DefaultTableModel_Alternative.setRowCount(Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size());
        for (int i = 0; i < Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size(); i++) {
            Obj_DefaultTableModel_Alternative.setValueAt(i + 1, i, 0);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getNombre_Producto(), i, 1);
            Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getCantidad_Producto(), i, 2);
            Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getPrecio_Producto()), i, 3);
            Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getSubtotal_Detalle_Boleta_Venta()), i, 4);
            Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getDescuento_Detalle_Boleta_Venta()), i, 5);
            Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getIGV_Detalle_Boleta_Venta()), i, 6);
            Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getTotal_Detalle_Boleta_Venta()), i, 7);
            Obj_DefaultTableModel_Alternative.setValueAt("Eliminar", i, 8);
        }
        Table_01.setModel(Obj_DefaultTableModel_Alternative);
    }

    private void Busqueda_Binaria_Cliente(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative, int DNI_Cliente) {
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object_Alternative.size() - 1;
        boolean Found_Status = false;

        while (Begin_ArrayList_Index <= End_ArrayList_Index && Found_Status == false) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object_Alternative.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(1) == DNI_Cliente) {
                Obj_Object_Cliente[0] = Control_ArrayList.get(0);
                Obj_Object_Cliente[1] = Control_ArrayList.get(1);
                Obj_Object_Cliente[2] = Control_ArrayList.get(2);
                Obj_Object_Cliente[3] = Control_ArrayList.get(3);
                Obj_Object_Cliente[4] = Control_ArrayList.get(4);
                Obj_Object_Cliente[5] = Control_ArrayList.get(5);
                Found_Status = true;
            } else {
                if (DNI_Cliente < (int) Control_ArrayList.get(1)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (DNI_Cliente > (int) Control_ArrayList.get(1)) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
    }

    private void Busqueda_Binaria_Producto(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object, int ID_Producto) {
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_ArrayList_Object.size() - 1;
        boolean Found_Status = false;

        while (Begin_ArrayList_Index <= End_ArrayList_Index && Found_Status == false) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            ArrayList Control_ArrayList = Obj_ArrayList_ArrayList_Object.get(Control_ArrayList_Index);

            if ((int) Control_ArrayList.get(0) == ID_Producto) {
                Obj_Object_Producto[0] = Control_ArrayList.get(0);
                Obj_Object_Producto[1] = Control_ArrayList.get(1);
                Obj_Object_Producto[2] = Control_ArrayList.get(2);
                Obj_Object_Producto[3] = Control_ArrayList.get(3);
                Obj_Object_Producto[4] = Control_ArrayList.get(4);
                Obj_Object_Producto[5] = Control_ArrayList.get(5);
                Obj_Object_Producto[6] = Control_ArrayList.get(6);

                if (((Control_ArrayList.get(7)).toString()).equals("true") == true) {
                    Obj_Object_Producto[7] = "Disponible";
                } else {
                    if (((Control_ArrayList.get(7)).toString()).equals("false") == true) {
                        Obj_Object_Producto[7] = "No Disponible";
                    }
                }
                Obj_Object_Producto[8] = Control_ArrayList.get(8);
                Found_Status = true;
            } else {
                if (ID_Producto < (int) Control_ArrayList.get(0)) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Producto > (int) Control_ArrayList.get(0)) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
    }

    private void Show_Table_Content_02() {
        Table_01.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent Obj_MouseEvent) {
                JTable Obj_JTable = (JTable) Obj_MouseEvent.getSource();
                Point Obj_Point = Obj_MouseEvent.getPoint();
                int Row_Index = Obj_JTable.rowAtPoint(Obj_Point);
                if (Obj_MouseEvent.getClickCount() == 1) {
                    DefaultTableModel Obj_DefaultTableModel_Alternative = (DefaultTableModel) Table_01.getModel();

                    int Value = 0;
                    int Column_Index = 0;

                    if (Row_Index > -1) {
                        Value = (int) Obj_DefaultTableModel_Alternative.getValueAt(Row_Index, Column_Index);
                    }

                    int Option_Selected = JOptionPane.showConfirmDialog(null, "¿Desea Eliminar el Producto Seleccionado?", "Información", JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE);

                    switch (Option_Selected) {

                        case -1 -> {
                            // System.out.println("Option_Selected: " + Option_Selected);
                        }
                        case 0 -> {
                            Obj_ArrayList_Modelo_Detalle_Boleta_Venta.remove(Value - 1);
                            Obj_DefaultTableModel_Alternative.setRowCount(Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size());
                            for (int i = 0; i < Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size(); i++) {
                                Obj_DefaultTableModel_Alternative.setValueAt(i + 1, i, 0);
                                Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getNombre_Producto(), i, 1);
                                Obj_DefaultTableModel_Alternative.setValueAt((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getCantidad_Producto(), i, 2);
                                Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getPrecio_Producto()), i, 3);
                                Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getSubtotal_Detalle_Boleta_Venta()), i, 4);
                                Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getDescuento_Detalle_Boleta_Venta()), i, 5);
                                Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getIGV_Detalle_Boleta_Venta()), i, 6);
                                Obj_DefaultTableModel_Alternative.setValueAt(Obj_DecimalFormat.format((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getTotal_Detalle_Boleta_Venta()), i, 7);
                                Obj_DefaultTableModel_Alternative.setValueAt("Eliminar", i, 8);
                            }
                            Table_01.setModel(Obj_DefaultTableModel_Alternative);
                            // System.out.println("Option_Selected: " + Option_Selected);
                        }
                        case 1 -> {
                            // System.out.println("Option_Selected: " + Option_Selected);
                        }
                        default ->
                            System.out.println("Switch_Default_Case");

                    }
                }
            }
        });
    }

    private void Show_Field_Content_Cliente() {
        if ((TextField_01.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese el DNI del Cliente a Buscar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_01.requestFocus();
        } else {
            String DNI_Cliente = (TextField_01.getText()).trim();
            if (this.Validate_Integer(DNI_Cliente) == false) {
                JOptionPane.showMessageDialog(null, "Ingrese un Documento Nacional de Identidad Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_01.setText("");
                TextField_01.requestFocus();
            } else {
                if ((DNI_Cliente.length()) != 8) {
                    JOptionPane.showMessageDialog(null, "El Documento Nacional de Identidad debe Contener 8 Caracteres.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextField_01.setText("");
                    TextField_01.requestFocus();
                } else {
                    Obj_Object_Cliente = new Object[6];
                    ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative = (ArrayList) Obj_ArrayList_ArrayList_Object_Cliente.clone();
                    int Left = 0;
                    int Right = Obj_ArrayList_ArrayList_Object_Alternative.size() - 1;
                    Obj_ArrayList_ArrayList_Object_Alternative = this.Quick_Sort_Cliente(Obj_ArrayList_ArrayList_Object_Alternative, Left, Right);

                    this.Busqueda_Binaria_Cliente(Obj_ArrayList_ArrayList_Object_Alternative, Integer.parseInt(DNI_Cliente));
                    if (Obj_Object_Cliente[0] == null) {
                        JOptionPane.showMessageDialog(null, "El DNI del Cliente no se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    } else {
                        if (Obj_Object_Cliente[0] != null) {
                            TextField_02.setText(Obj_Object_Cliente[2] + " " + Obj_Object_Cliente[3]);
                            TextField_03.setText(Integer.toString((int) Obj_Object_Cliente[1]));
                            TextField_04.setText((String) Obj_Object_Cliente[4]);
                            TextField_01.setText("");
                            TextField_01.setEnabled(false);
                            Button_01.setEnabled(false);
                            TextField_05.setEnabled(true);
                            Button_02.setEnabled(true);
                        }
                    }
                }
            }
        }
    }

    private void Show_Field_Content_Producto() {
        if ((TextField_05.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese el ID del Producto a Buscar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_05.requestFocus();
        } else {
            String ID_Producto = (TextField_05.getText()).trim();
            if (this.Validate_Integer(ID_Producto) == false) {
                JOptionPane.showMessageDialog(null, "Ingrese un ID Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_05.setText("");
                TextField_05.requestFocus();
            } else {
                Obj_Object_Producto = new Object[9];
                this.Busqueda_Binaria_Producto(Obj_ArrayList_ArrayList_Object_Producto, Integer.parseInt(ID_Producto));
                if (Obj_Object_Producto[0] == null) {
                    JOptionPane.showMessageDialog(null, "El ID del Producto no se Encuentra Registrado en la Base de Datos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                } else {
                    if (Obj_Object_Producto[0] != null) {
                        TextField_06.setText((String) Obj_Object_Producto[3]);
                        TextField_07.setText(Obj_DecimalFormat.format((double) Obj_Object_Producto[5]));
                        TextField_08.setText(Integer.toString((int) Obj_Object_Producto[4]));
                        TextField_05.setText("");
                        TextField_09.setEnabled(true);
                        Button_03.setEnabled(true);
                    }
                }
            }
        }
    }

    private void Initial_State() {
        TextField_01.setEnabled(true);
        Button_01.setEnabled(true);
        TextField_02.setText("");
        TextField_03.setText("");
        TextField_04.setText("");
        TextField_05.setEnabled(false);
        Button_02.setEnabled(false);
        TextField_09.setEnabled(false);
        Button_03.setEnabled(false);
        TextField_14.setText("");
        TextField_14.setEnabled(false);
        Button_04.setEnabled(false);
        Button_05.setEnabled(false);
        TextField_10.setText("00.00");
        TextField_11.setText("00.00");
        TextField_12.setText("00.00");
        TextField_13.setText("00.00");
        TextField_15.setText("00.00");
    }

    private boolean Validate_Integer(String Integer) {
        Pattern Obj_Pattern = Pattern.compile("^[0-9]+$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Integer);
        return Obj_Matcher.find();
    }

    private boolean Validate_Double(String Double) {
        Pattern Obj_Pattern = Pattern.compile("^[1-9]\\d*(\\.\\d+)?$");
        Matcher Obj_Matcher = Obj_Pattern.matcher(Double);
        return Obj_Matcher.find();
    }

    private String Print_ArrayList_Model() {
        String Data = "";
        for (int i = 0; i < Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size(); i++) {
            Data += Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i) + "\n";
        }
        return Data;
    }

    private ArrayList<ArrayList<Object>> Quick_Sort_Cliente(ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object_Alternative, int Left, int Right) {
        if (Left >= Right) {
            return null;
        }

        int Pivot = (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(Left)).get(1);
        int i = Left + 1;
        int j = Right;

        while (i <= j) {
            while (i <= Right && (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(i)).get(1) < Pivot) {
                i++;
            }
            while (j > Left && (int) (Obj_ArrayList_ArrayList_Object_Alternative.get(j)).get(1) >= Pivot) {
                j--;
            }
            if (i < j) {
                Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Alternative.get(i);
                Obj_ArrayList_ArrayList_Object_Alternative.set(i, Obj_ArrayList_ArrayList_Object_Alternative.get(j));
                Obj_ArrayList_ArrayList_Object_Alternative.set(j, Obj_ArrayList_Object);
            }
        }

        if (j > Left) {
            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Alternative.get(Left);
            Obj_ArrayList_ArrayList_Object_Alternative.set(Left, Obj_ArrayList_ArrayList_Object_Alternative.get(j));
            Obj_ArrayList_ArrayList_Object_Alternative.set(j, Obj_ArrayList_Object);
        }
        Quick_Sort_Cliente(Obj_ArrayList_ArrayList_Object_Alternative, Left, j - 1);
        Quick_Sort_Cliente(Obj_ArrayList_ArrayList_Object_Alternative, j + 1, Right);
        return Obj_ArrayList_ArrayList_Object_Alternative;
    }

    private void Calculate_Payroll() {
        double Subtotal_Detalle_Boleta_Venta = 00.00;
        double Descuento_Detalle_Boleta_Venta = 00.00;
        double IGV_Detalle_Boleta_Venta = 00.00;
        double Total_Detalle_Boleta_Venta = 00.00;

        for (int i = 0; i < Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size(); i++) {
            Subtotal_Detalle_Boleta_Venta += (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getSubtotal_Detalle_Boleta_Venta();
            Descuento_Detalle_Boleta_Venta += (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getDescuento_Detalle_Boleta_Venta();
            IGV_Detalle_Boleta_Venta += (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getIGV_Detalle_Boleta_Venta();
            Total_Detalle_Boleta_Venta += (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getTotal_Detalle_Boleta_Venta();
        }

        TextField_10.setText(Obj_DecimalFormat.format(Subtotal_Detalle_Boleta_Venta));
        TextField_11.setText(Obj_DecimalFormat.format(Descuento_Detalle_Boleta_Venta));
        TextField_12.setText(Obj_DecimalFormat.format(IGV_Detalle_Boleta_Venta));
        TextField_13.setText(Obj_DecimalFormat.format(Total_Detalle_Boleta_Venta));
    }

    private boolean Check_Repeat_Product(ArrayList<Modelo_Detalle_Boleta_Venta> Obj_ArrayList_Modelo_Detalle_Boleta_Venta, int ID_Producto) {
        int Begin_ArrayList_Index = 0;
        int End_ArrayList_Index = Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size() - 1;

        while (Begin_ArrayList_Index <= End_ArrayList_Index) {
            int Control_ArrayList_Index = (Begin_ArrayList_Index + End_ArrayList_Index) / 2;
            Modelo_Detalle_Boleta_Venta Obj_Modelo_Detalle_Boleta_Venta = Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(Control_ArrayList_Index);

            if ((int) Obj_Modelo_Detalle_Boleta_Venta.getID_Producto() == ID_Producto) {
                return true;
            } else {
                if (ID_Producto < (int) Obj_Modelo_Detalle_Boleta_Venta.getID_Producto()) {
                    End_ArrayList_Index = Control_ArrayList_Index - 1;
                } else {
                    if (ID_Producto > (int) Obj_Modelo_Detalle_Boleta_Venta.getID_Producto()) {
                        Begin_ArrayList_Index = Control_ArrayList_Index + 1;
                    }
                }
            }
        }
        return false;
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
        Button_01 = new javax.swing.JButton();
        Separator_01 = new javax.swing.JSeparator();
        Panel_02 = new javax.swing.JPanel();
        ScrollPane_01 = new javax.swing.JScrollPane();
        Table_01 = new javax.swing.JTable();
        Panel_03 = new javax.swing.JPanel();
        Label_06 = new javax.swing.JLabel();
        Label_07 = new javax.swing.JLabel();
        Label_08 = new javax.swing.JLabel();
        Label_09 = new javax.swing.JLabel();
        Label_10 = new javax.swing.JLabel();
        TextField_05 = new javax.swing.JTextField();
        TextField_06 = new javax.swing.JTextField();
        TextField_07 = new javax.swing.JTextField();
        TextField_08 = new javax.swing.JTextField();
        TextField_09 = new javax.swing.JTextField();
        Button_02 = new javax.swing.JButton();
        Button_03 = new javax.swing.JButton();
        Separator_02 = new javax.swing.JSeparator();
        Separator_03 = new javax.swing.JSeparator();
        Panel_04 = new javax.swing.JPanel();
        Label_11 = new javax.swing.JLabel();
        Label_12 = new javax.swing.JLabel();
        Label_13 = new javax.swing.JLabel();
        Label_14 = new javax.swing.JLabel();
        Label_15 = new javax.swing.JLabel();
        Label_16 = new javax.swing.JLabel();
        TextField_10 = new javax.swing.JTextField();
        TextField_11 = new javax.swing.JTextField();
        TextField_12 = new javax.swing.JTextField();
        TextField_13 = new javax.swing.JTextField();
        TextField_14 = new javax.swing.JTextField();
        TextField_15 = new javax.swing.JTextField();
        Button_04 = new javax.swing.JButton();
        Button_05 = new javax.swing.JButton();
        Button_06 = new javax.swing.JButton();
        Label_01 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Panel_01.setBackground(new java.awt.Color(102, 102, 102));
        Panel_01.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_02.setForeground(new java.awt.Color(255, 255, 255));
        Label_02.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_02.setText("Búsqueda (Binaria - DNI_Cliente):");

        Label_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_03.setForeground(new java.awt.Color(255, 255, 255));
        Label_03.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_03.setText("Nombres y Apellidos:");

        Label_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_04.setForeground(new java.awt.Color(255, 255, 255));
        Label_04.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_04.setText("Documento Nacional de Identidad:");

        Label_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_05.setForeground(new java.awt.Color(255, 255, 255));
        Label_05.setIcon(new ImageIcon("src//main//java//Imágenes//User_01.png"));
        Label_05.setText("Dirección:");

        TextField_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextField_01.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TextField_01KeyPressed(evt);
            }
        });

        TextField_02.setEditable(false);
        TextField_02.setBackground(new java.awt.Color(153, 204, 255));
        TextField_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_03.setEditable(false);
        TextField_03.setBackground(new java.awt.Color(153, 204, 255));
        TextField_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_04.setEditable(false);
        TextField_04.setBackground(new java.awt.Color(153, 204, 255));
        TextField_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        Button_01.setBackground(new java.awt.Color(51, 153, 255));
        Button_01.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_01.setText("Buscar");
        Button_01.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_01ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_01Layout = new javax.swing.GroupLayout(Panel_01);
        Panel_01.setLayout(Panel_01Layout);
        Panel_01Layout.setHorizontalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Separator_01, javax.swing.GroupLayout.Alignment.TRAILING)
            .addGroup(Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 202, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(Panel_01Layout.createSequentialGroup()
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        Panel_01Layout.setVerticalGroup(
            Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, Panel_01Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_01, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Separator_01, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_01Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TextField_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_04, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 30, 550, -1));

        Panel_02.setBackground(new java.awt.Color(102, 102, 102));
        Panel_02.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

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

        javax.swing.GroupLayout Panel_02Layout = new javax.swing.GroupLayout(Panel_02);
        Panel_02.setLayout(Panel_02Layout);
        Panel_02Layout.setHorizontalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 482, Short.MAX_VALUE)
                .addContainerGap())
        );
        Panel_02Layout.setVerticalGroup(
            Panel_02Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_02Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ScrollPane_01, javax.swing.GroupLayout.DEFAULT_SIZE, 162, Short.MAX_VALUE)
                .addContainerGap())
        );

        getContentPane().add(Panel_02, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 30, 500, 180));

        Panel_03.setBackground(new java.awt.Color(102, 102, 102));
        Panel_03.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 12)); // NOI18N
        Label_06.setForeground(new java.awt.Color(255, 255, 255));
        Label_06.setIcon(new ImageIcon("src//main//java//Imágenes//Magnifying_Glass.png"));
        Label_06.setText("Búsqueda (Binaria - ID_Producto):");

        Label_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_07.setForeground(new java.awt.Color(255, 255, 255));
        Label_07.setIcon(new ImageIcon("src//main//java//Imágenes//Product.png"));
        Label_07.setText("Nombre:");

        Label_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_08.setForeground(new java.awt.Color(255, 255, 255));
        Label_08.setIcon(new ImageIcon("src//main//java//Imágenes//Product.png"));
        Label_08.setText("Precio:");

        Label_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_09.setForeground(new java.awt.Color(255, 255, 255));
        Label_09.setIcon(new ImageIcon("src//main//java//Imágenes//Product.png"));
        Label_09.setText("Stock:");

        Label_10.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_10.setForeground(new java.awt.Color(255, 255, 255));
        Label_10.setIcon(new ImageIcon("src//main//java//Imágenes//Product.png"));
        Label_10.setText("Cantidad:");

        TextField_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextField_05.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TextField_05KeyPressed(evt);
            }
        });

        TextField_06.setEditable(false);
        TextField_06.setBackground(new java.awt.Color(153, 204, 255));
        TextField_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_07.setEditable(false);
        TextField_07.setBackground(new java.awt.Color(153, 204, 255));
        TextField_07.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_08.setEditable(false);
        TextField_08.setBackground(new java.awt.Color(153, 204, 255));
        TextField_08.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        TextField_08.setForeground(new java.awt.Color(205, 0, 0));

        TextField_09.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        Button_02.setBackground(new java.awt.Color(51, 153, 255));
        Button_02.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_02.setText("Buscar");
        Button_02.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_02ActionPerformed(evt);
            }
        });

        Button_03.setBackground(new java.awt.Color(255, 255, 255));
        Button_03.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_03.setIcon(new ImageIcon("src//main//java//Imágenes//Add.png"));
        Button_03.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_03ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_03Layout = new javax.swing.GroupLayout(Panel_03);
        Panel_03.setLayout(Panel_03Layout);
        Panel_03Layout.setHorizontalGroup(
            Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Separator_02)
            .addGroup(Panel_03Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(Panel_03Layout.createSequentialGroup()
                        .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_05, javax.swing.GroupLayout.PREFERRED_SIZE, 202, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(Panel_03Layout.createSequentialGroup()
                        .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_07, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(TextField_06, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TextField_08, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(Panel_03Layout.createSequentialGroup()
                        .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(TextField_09, javax.swing.GroupLayout.PREFERRED_SIZE, 202, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Button_03, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
            .addComponent(Separator_03)
        );
        Panel_03Layout.setVerticalGroup(
            Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_03Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_05, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_02, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Separator_02, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Label_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_06, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_08, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_09, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TextField_07, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_08, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Separator_03, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(Panel_03Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(Label_10, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(TextField_09, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(Button_03, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        getContentPane().add(Panel_03, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 250, -1, -1));

        Panel_04.setBackground(new java.awt.Color(102, 102, 102));
        Panel_04.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));

        Label_11.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_11.setForeground(new java.awt.Color(255, 255, 255));
        Label_11.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_11.setText("Subtotal:");

        Label_12.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_12.setForeground(new java.awt.Color(255, 255, 255));
        Label_12.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_12.setText("Descuento:");

        Label_13.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_13.setForeground(new java.awt.Color(255, 255, 255));
        Label_13.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_13.setText("IGV:");

        Label_14.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_14.setForeground(new java.awt.Color(255, 255, 255));
        Label_14.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_14.setText("Total a Pagar:");

        Label_15.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_15.setForeground(new java.awt.Color(255, 255, 255));
        Label_15.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_15.setText("Efectivo:");

        Label_16.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Label_16.setForeground(new java.awt.Color(255, 255, 255));
        Label_16.setIcon(new ImageIcon("src//main//java//Imágenes//Cart.png"));
        Label_16.setText("Vuelto:");

        TextField_10.setEditable(false);
        TextField_10.setBackground(new java.awt.Color(153, 204, 255));
        TextField_10.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_11.setEditable(false);
        TextField_11.setBackground(new java.awt.Color(153, 204, 255));
        TextField_11.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_12.setEditable(false);
        TextField_12.setBackground(new java.awt.Color(153, 204, 255));
        TextField_12.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_13.setEditable(false);
        TextField_13.setBackground(new java.awt.Color(153, 204, 255));
        TextField_13.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_14.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        TextField_15.setEditable(false);
        TextField_15.setBackground(new java.awt.Color(153, 204, 255));
        TextField_15.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N

        Button_04.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_04.setIcon(new ImageIcon("src//main//java//Imágenes//Printer.png"));
        Button_04.setText("Registrar Venta");
        Button_04.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        Button_04.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        Button_04.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_04ActionPerformed(evt);
            }
        });

        Button_05.setBackground(new java.awt.Color(255, 255, 153));
        Button_05.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_05.setIcon(new ImageIcon("src//main//java//Imágenes//ToolKit.png"));
        Button_05.setText("Calcular Vuelto");
        Button_05.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_05ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout Panel_04Layout = new javax.swing.GroupLayout(Panel_04);
        Panel_04.setLayout(Panel_04Layout);
        Panel_04Layout.setHorizontalGroup(
            Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_04Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label_11, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_12, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_13, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_14, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_15, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Label_16, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TextField_10, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_12, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_13, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_11, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_14, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TextField_15, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_04, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        Panel_04Layout.setVerticalGroup(
            Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(Panel_04Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_04, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_04Layout.createSequentialGroup()
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_10, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_11, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_11, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_12, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_12, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_13, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_13, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_14, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Button_05, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(Panel_04Layout.createSequentialGroup()
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_14, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_15, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(Panel_04Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(TextField_15, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Label_16, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );

        getContentPane().add(Panel_04, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 220, 500, 290));

        Button_06.setBackground(new java.awt.Color(153, 204, 255));
        Button_06.setFont(new java.awt.Font("Yu Gothic UI", 1, 14)); // NOI18N
        Button_06.setText("Reset");
        Button_06.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Button_06ActionPerformed(evt);
            }
        });
        getContentPane().add(Button_06, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 520, -1, -1));

        Label_01.setIcon(new ImageIcon("src//main//java//Imágenes//Wallpaper_04.png"));
        getContentPane().add(Label_01, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1120, 560));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Button_01ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_01ActionPerformed
        // TODO add your handling code here:
        this.Show_Field_Content_Cliente();
    }//GEN-LAST:event_Button_01ActionPerformed

    private void Button_02ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_02ActionPerformed
        // TODO add your handling code here:
        this.Show_Field_Content_Producto();
    }//GEN-LAST:event_Button_02ActionPerformed

    private void TextField_01KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_01KeyPressed
        // TODO add your handling code here:
        if (evt.getExtendedKeyCode() == KeyEvent.VK_ENTER) {
            this.Show_Field_Content_Cliente();
        }
    }//GEN-LAST:event_TextField_01KeyPressed

    private void TextField_05KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TextField_05KeyPressed
        // TODO add your handling code here:
        if (evt.getExtendedKeyCode() == KeyEvent.VK_ENTER) {
            this.Show_Field_Content_Producto();
        }
    }//GEN-LAST:event_TextField_05KeyPressed

    private void Button_03ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_03ActionPerformed
        // TODO add your handling code here:
        if ((TextField_09.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese la Cantidad del Producto a Comprar", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_09.requestFocus();
        } else {
            int Stock_Producto = Integer.parseInt(TextField_08.getText());
            String Cantidad_Producto = (TextField_09.getText()).trim();
            if (this.Validate_Integer(Cantidad_Producto) == false || Integer.parseInt(Cantidad_Producto) == 0) {
                JOptionPane.showMessageDialog(null, "Ingrese una Cantidad Válida.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_09.setText("");
                TextField_09.requestFocus();
            } else {
                if (Integer.parseInt(Cantidad_Producto) > Stock_Producto) {
                    JOptionPane.showMessageDialog(null, "La Cantidad de la Compra del Producto Supera a su Stock Actual.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextField_09.setText("");
                    TextField_09.requestFocus();
                } else {
                    System.out.println("Cantidad: Ok!.");
                }
            }
            if ((TextField_09.getText()).isEmpty() == true) {
                System.out.println("Try Again!");
            } else {
                if (this.Check_Repeat_Product(Obj_ArrayList_Modelo_Detalle_Boleta_Venta, (int) Obj_Object_Producto[0]) == true) {
                    JOptionPane.showMessageDialog(null, "El Producto ya se Encuentra Agregado a la Boleta de Venta.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                } else {
                    if (this.Check_Repeat_Product(Obj_ArrayList_Modelo_Detalle_Boleta_Venta, (int) Obj_Object_Producto[0]) == false) {
                        Modelo_Detalle_Boleta_Venta Obj_Modelo_Detalle_Boleta_Venta = new Modelo_Detalle_Boleta_Venta();

                        String Nombre_Producto = TextField_06.getText();
                        double Precio_Producto = Double.parseDouble(TextField_07.getText());
                        double Subtotal_Detalle_Boleta_Venta = Integer.parseInt(Cantidad_Producto) * Precio_Producto;
                        double Descuento_Detalle_Boleta_Venta = 00.00;

                        if (Integer.parseInt(Cantidad_Producto) <= 5) {
                            Descuento_Detalle_Boleta_Venta = Subtotal_Detalle_Boleta_Venta * 00.00;
                        } else {
                            if (Integer.parseInt(Cantidad_Producto) > 5) {
                                Descuento_Detalle_Boleta_Venta = Subtotal_Detalle_Boleta_Venta * 00.30;
                            }
                        }
                        double IGV_Detalle_Boleta_Venta = Subtotal_Detalle_Boleta_Venta * 00.18;
                        double Total_Detalle_Boleta_Venta = (Subtotal_Detalle_Boleta_Venta - Descuento_Detalle_Boleta_Venta) + IGV_Detalle_Boleta_Venta;

                        Obj_Modelo_Detalle_Boleta_Venta.setID_Producto((int) Obj_Object_Producto[0]);
                        // Extra_Sector_A
                        Obj_Modelo_Detalle_Boleta_Venta.setNombre_Producto(Nombre_Producto);
                        Obj_Modelo_Detalle_Boleta_Venta.setStock_Producto((int) Obj_Object_Producto[4]);
                        // Extra_Sector_B
                        Obj_Modelo_Detalle_Boleta_Venta.setPrecio_Producto(Precio_Producto);
                        Obj_Modelo_Detalle_Boleta_Venta.setCantidad_Producto(Integer.parseInt(Cantidad_Producto));
                        Obj_Modelo_Detalle_Boleta_Venta.setSubtotal_Detalle_Boleta_Venta(Subtotal_Detalle_Boleta_Venta);
                        Obj_Modelo_Detalle_Boleta_Venta.setDescuento_Detalle_Boleta_Venta(Descuento_Detalle_Boleta_Venta);
                        Obj_Modelo_Detalle_Boleta_Venta.setIGV_Detalle_Boleta_Venta(IGV_Detalle_Boleta_Venta);
                        Obj_Modelo_Detalle_Boleta_Venta.setTotal_Detalle_Boleta_Venta(Total_Detalle_Boleta_Venta);
                        Obj_ArrayList_Modelo_Detalle_Boleta_Venta.add(Obj_Modelo_Detalle_Boleta_Venta);
                        TextField_06.setText("");
                        TextField_07.setText("");
                        TextField_08.setText("");
                        TextField_09.setText("");
                        TextField_09.setEnabled(false);
                        Button_03.setEnabled(false);
                        JOptionPane.showMessageDialog(null, "Producto Agregado.", "Información", JOptionPane.INFORMATION_MESSAGE);
                        this.Show_Table_Content_01();
                        this.Calculate_Payroll();
                        TextField_14.setEnabled(true);
                        Button_05.setEnabled(true);
                    }
                }
            }
        }
    }//GEN-LAST:event_Button_03ActionPerformed

    private void Button_06ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_06ActionPerformed
        // TODO add your handling code here:
        String Data = this.Print_ArrayList_Model();
        System.out.println(Data);
    }//GEN-LAST:event_Button_06ActionPerformed

    private void Button_05ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_05ActionPerformed
        // TODO add your handling code here:
        if ((TextField_14.getText()).isEmpty() == true) {
            JOptionPane.showMessageDialog(null, "Ingrese el Monto de Dinero en Efectivo.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            TextField_14.requestFocus();
        } else {
            double Total_Boleta_Venta = Double.parseDouble(TextField_13.getText());
            String Efectivo = (TextField_14.getText()).trim();

            if (this.Validate_Double(Efectivo) == false) {
                JOptionPane.showMessageDialog(null, "Ingrese un Monto de Dinero Válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                TextField_14.setText("");
                TextField_14.requestFocus();
            } else {
                if (Double.parseDouble(Efectivo) < Total_Boleta_Venta) {
                    JOptionPane.showMessageDialog(null, "El Monto de Dinero en Efectivo es Menor al Valor Total de la Compra.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    TextField_14.setText("");
                    TextField_14.requestFocus();
                } else {
                    double Vuelto = Double.parseDouble(Efectivo) - Total_Boleta_Venta;
                    TextField_15.setText(Obj_DecimalFormat.format(Vuelto));
                    Button_04.setEnabled(true);
                }
            }
        }
    }//GEN-LAST:event_Button_05ActionPerformed

    private void Button_04ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Button_04ActionPerformed
        // TODO add your handling code here:
        Modelo_Boleta_Venta Obj_Modelo_Boleta_Venta = new Modelo_Boleta_Venta();
        Modelo_Detalle_Boleta_Venta Obj_Modelo_Detalle_Boleta_Venta = new Modelo_Detalle_Boleta_Venta();

        LocalDateTime Obj_LocalDateTime = LocalDateTime.now();
        DateTimeFormatter Obj_DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String Fecha_Boleta_Venta = Obj_LocalDateTime.format(Obj_DateTimeFormatter);

        Obj_Modelo_Boleta_Venta.setID_Usuario(Controlador_Usuario.ID_Usuario);
        Obj_Modelo_Boleta_Venta.setID_Cliente((int) Obj_Object_Cliente[0]);
        Obj_Modelo_Boleta_Venta.setTotal_Boleta_Venta(Double.parseDouble(TextField_13.getText()));
        Obj_Modelo_Boleta_Venta.setFecha_Boleta_Venta(Fecha_Boleta_Venta);
        try {
            if (Obj_Controlador_Boleta_Venta.Insertar_Boleta_Venta(Obj_Modelo_Boleta_Venta) == true) {
                JOptionPane.showMessageDialog(null, "Los Datos de la Boleta de Venta han sido Registrados Correctamente.", "Información", JOptionPane.INFORMATION_MESSAGE);
                for (int i = 0; i < Obj_ArrayList_Modelo_Detalle_Boleta_Venta.size(); i++) {
                    Obj_Modelo_Detalle_Boleta_Venta.setID_Boleta_Venta(Controlador_Boleta_Venta.ID_Boleta_Venta);
                    Obj_Modelo_Detalle_Boleta_Venta.setID_Producto((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getID_Producto());
                    Obj_Modelo_Detalle_Boleta_Venta.setPrecio_Producto((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getPrecio_Producto());
                    Obj_Modelo_Detalle_Boleta_Venta.setCantidad_Producto((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getCantidad_Producto());
                    Obj_Modelo_Detalle_Boleta_Venta.setSubtotal_Detalle_Boleta_Venta((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getSubtotal_Detalle_Boleta_Venta());
                    Obj_Modelo_Detalle_Boleta_Venta.setDescuento_Detalle_Boleta_Venta((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getDescuento_Detalle_Boleta_Venta());
                    Obj_Modelo_Detalle_Boleta_Venta.setIGV_Detalle_Boleta_Venta((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getIGV_Detalle_Boleta_Venta());
                    Obj_Modelo_Detalle_Boleta_Venta.setTotal_Detalle_Boleta_Venta((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getTotal_Detalle_Boleta_Venta());
                    if (Obj_Controlador_Detalle_Boleta_Venta.Insertar_Detalle_Boleta_Venta(Obj_Modelo_Detalle_Boleta_Venta) == true) {
                        System.out.println("Los Datos de los Detalles de la Boleta de Venta han sido Registrados Correctamente.");
                        int ID_Producto = (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getID_Producto();
                        int Stock_Producto = (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getStock_Producto() - (Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getCantidad_Producto();
                        if (Obj_Controlador_Producto.Editar_Stock_Producto(ID_Producto, Stock_Producto) == true) {
                            System.out.println("Los Stocks de los Productos Fueron Actualizados.");
                            Obj_ArrayList_Object = Obj_ArrayList_ArrayList_Object_Producto.get(((Obj_ArrayList_Modelo_Detalle_Boleta_Venta.get(i)).getID_Producto() - 1));
                            Obj_ArrayList_Object.set(4, Stock_Producto);
                        } else {
                            System.err.println("Error al Actualizar el Stock del Producto.");
                        }
                    } else {
                        System.err.println("Error al Registrar Los Detalles de la Boleta de Venta.");
                    }
                }
                String Report_Path = "src//main//java//Report//Receipt_Report.jrxml";
                JasperReport Obj_JasperReport = JasperCompileManager.compileReport(Report_Path);
                Map Obj_Map = new HashMap();
                Obj_Map.put("Parameter_01", Controlador_Boleta_Venta.ID_Boleta_Venta);
                Obj_Map.put("Parameter_02", Double.valueOf(TextField_14.getText()));
                Obj_Map.put("Parameter_03", Double.valueOf(TextField_15.getText()));
                JasperPrint Obj_JasperPrint = JasperFillManager.fillReport(Obj_JasperReport, Obj_Map, MySQL_Connection.Obj_Connection);
                JasperViewer.viewReport(Obj_JasperPrint, false);
                Obj_ArrayList_Modelo_Detalle_Boleta_Venta.clear();
                this.Show_Table_Content_01();
                this.Initial_State();
            } else {
                JOptionPane.showMessageDialog(null, "Error al Registrar la Boleta de Venta.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (SQLException | ClassNotFoundException | JRException Obj_SQLException_ClassNotFoundException_JRException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException_JRException.getMessage());
        }
    }//GEN-LAST:event_Button_04ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Button_01;
    private javax.swing.JButton Button_02;
    private javax.swing.JButton Button_03;
    private javax.swing.JButton Button_04;
    private javax.swing.JButton Button_05;
    private javax.swing.JButton Button_06;
    private javax.swing.JLabel Label_01;
    private javax.swing.JLabel Label_02;
    private javax.swing.JLabel Label_03;
    private javax.swing.JLabel Label_04;
    private javax.swing.JLabel Label_05;
    private javax.swing.JLabel Label_06;
    private javax.swing.JLabel Label_07;
    private javax.swing.JLabel Label_08;
    private javax.swing.JLabel Label_09;
    private javax.swing.JLabel Label_10;
    private javax.swing.JLabel Label_11;
    private javax.swing.JLabel Label_12;
    private javax.swing.JLabel Label_13;
    private javax.swing.JLabel Label_14;
    private javax.swing.JLabel Label_15;
    private javax.swing.JLabel Label_16;
    private javax.swing.JPanel Panel_01;
    private javax.swing.JPanel Panel_02;
    private javax.swing.JPanel Panel_03;
    private javax.swing.JPanel Panel_04;
    private javax.swing.JScrollPane ScrollPane_01;
    private javax.swing.JSeparator Separator_01;
    private javax.swing.JSeparator Separator_02;
    private javax.swing.JSeparator Separator_03;
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
    private javax.swing.JTextField TextField_10;
    private javax.swing.JTextField TextField_11;
    private javax.swing.JTextField TextField_12;
    private javax.swing.JTextField TextField_13;
    private javax.swing.JTextField TextField_14;
    private javax.swing.JTextField TextField_15;
    // End of variables declaration//GEN-END:variables
}
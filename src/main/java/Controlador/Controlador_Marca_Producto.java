/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import Modelo.Modelo_Marca_Producto;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Marca_Producto {

    private CallableStatement Obj_CallableStatement;
    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    private Statement Obj_Statement;

    public boolean Insertar_Marca_Producto(Modelo_Marca_Producto Obj_Modelo_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Marca_Producto VALUES (?, ?, ?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setString(2, Obj_Modelo_Marca_Producto.getNombre_Marca_Producto());
            Obj_PreparedStatement.setInt(3, Obj_Modelo_Marca_Producto.getTelefono_Marca_Producto());
            Obj_PreparedStatement.setString(4, Obj_Modelo_Marca_Producto.getE_Mail_Marca_Producto());
            Obj_PreparedStatement.setString(5, Obj_Modelo_Marca_Producto.getDireccion_Marca_Producto());
            Obj_PreparedStatement.setBoolean(6, Obj_Modelo_Marca_Producto.isEstado_Marca_Producto());
            Obj_PreparedStatement.setString(7, Obj_Modelo_Marca_Producto.getFecha_Registro_Marca_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_Nombre_Marca_Producto(String Nombre_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Nombre_Marca_Producto FROM Tabla_Marca_Producto WHERE Nombre_Marca_Producto = '" + Nombre_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_Telefono_Marca_Producto(String Telefono_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Telefono_Marca_Producto FROM Tabla_Marca_Producto WHERE Telefono_Marca_Producto = '" + Telefono_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_E_Mail_Marca_Producto(String E_Mail_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT E_Mail_Marca_Producto FROM Tabla_Marca_Producto WHERE E_Mail_Marca_Producto = '" + E_Mail_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_Direccion_Marca_Producto(String Direccion_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Direccion_Marca_Producto FROM Tabla_Marca_Producto WHERE Direccion_Marca_Producto = '" + Direccion_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public ArrayList<Modelo_Marca_Producto> ArrayList_Modelo_Marca_Producto() throws SQLException, ClassNotFoundException {
        ArrayList<Modelo_Marca_Producto> Obj_ArrayList_Modelo_Marca_Producto = new ArrayList<>();
        try {
            // String MySql_Command = "SELECT ID_Marca_Producto, Nombre_Marca_Producto, Telefono_Marca_Producto, E_Mail_Marca_Producto, Direccion_Marca_Producto, Estado_Marca_Producto, Fecha_Registro_Marca_Producto FROM Tabla_Marca_Producto;";
            String MySql_Command = "SELECT TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, COUNT(TP.ID_Marca_Producto) AS Product_Number FROM Tabla_Marca_Producto TMP LEFT JOIN Tabla_Producto TP ON TMP.ID_Marca_Producto = TP.ID_Marca_Producto GROUP BY TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, TP.ID_Marca_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                Modelo_Marca_Producto Obj_Modelo_Marca_Producto = new Modelo_Marca_Producto();
                Obj_Modelo_Marca_Producto.setID_Marca_Producto(Obj_ResultSet.getInt("ID_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setNombre_Marca_Producto(Obj_ResultSet.getString("Nombre_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setTelefono_Marca_Producto(Obj_ResultSet.getInt("Telefono_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setE_Mail_Marca_Producto(Obj_ResultSet.getString("E_Mail_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setDireccion_Marca_Producto(Obj_ResultSet.getString("Direccion_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setEstado_Marca_Producto(Obj_ResultSet.getBoolean("Estado_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setFecha_Registro_Marca_Producto(Obj_ResultSet.getString("Fecha_Registro_Marca_Producto"));
                Obj_Modelo_Marca_Producto.setProduct_Number(Obj_ResultSet.getInt("Product_Number"));
                Obj_ArrayList_Modelo_Marca_Producto.add(Obj_Modelo_Marca_Producto);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Modelo_Marca_Producto;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object() throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, COUNT(TP.ID_Marca_Producto) AS Product_Number FROM Tabla_Marca_Producto TMP LEFT JOIN Tabla_Producto TP ON TMP.ID_Marca_Producto = TP.ID_Marca_Producto GROUP BY TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, TP.ID_Marca_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Telefono_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("E_Mail_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Direccion_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getBoolean("Estado_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Registro_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Product_Number"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }

    public boolean Eliminar_Marca_Producto(int ID_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Marca_Producto SET Estado_Marca_Producto = b'0' WHERE ID_Marca_Producto = '" + ID_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Restaurar_Marca_Producto(int ID_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Marca_Producto SET Estado_Marca_Producto = b'1' WHERE ID_Marca_Producto = '" + ID_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Editar_Marca_Producto(Modelo_Marca_Producto Obj_Modelo_Marca_Producto, int ID_Marca_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Marca_Producto SET Nombre_Marca_Producto = ?, Telefono_Marca_Producto = ?, E_Mail_Marca_Producto = ?, Direccion_Marca_Producto = ? WHERE ID_Marca_Producto = '" + ID_Marca_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setString(1, Obj_Modelo_Marca_Producto.getNombre_Marca_Producto());
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Marca_Producto.getTelefono_Marca_Producto());
            Obj_PreparedStatement.setString(3, Obj_Modelo_Marca_Producto.getE_Mail_Marca_Producto());
            Obj_PreparedStatement.setString(4, Obj_Modelo_Marca_Producto.getDireccion_Marca_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }
}
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
import Modelo.Modelo_Producto;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Producto {

    private CallableStatement Obj_CallableStatement;
    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    private Statement Obj_Statement;

    public boolean Insertar_Producto(Modelo_Producto Obj_Modelo_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Producto VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Producto.getID_Categoria_Producto());
            Obj_PreparedStatement.setInt(3, Obj_Modelo_Producto.getID_Marca_Producto());
            Obj_PreparedStatement.setString(4, Obj_Modelo_Producto.getNombre_Producto());
            Obj_PreparedStatement.setInt(5, Obj_Modelo_Producto.getStock_Producto());
            Obj_PreparedStatement.setDouble(6, Obj_Modelo_Producto.getPrecio_Producto());
            Obj_PreparedStatement.setString(7, Obj_Modelo_Producto.getDescripcion_Producto());
            Obj_PreparedStatement.setBoolean(8, Obj_Modelo_Producto.isEstado_Producto());
            Obj_PreparedStatement.setString(9, Obj_Modelo_Producto.getFecha_Registro_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_Nombre_Producto(String Nombre_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Nombre_Producto FROM Tabla_Producto WHERE Nombre_Producto = '" + Nombre_Producto + "';";
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

    public ArrayList<String> ArrayList_Nombre_Categoria_Producto() throws SQLException, ClassNotFoundException {
        ArrayList<String> Obj_ArrayList_String = new ArrayList<>();
        try {
            String MySql_Command = "SELECT Nombre_Categoria_Producto FROM Tabla_Categoria_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                Obj_ArrayList_String.add(Obj_ResultSet.getString("Nombre_Categoria_Producto"));
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_String;
    }

    public ArrayList<String> ArrayList_Nombre_Marca_Producto() throws SQLException, ClassNotFoundException {
        ArrayList<String> Obj_ArrayList_String = new ArrayList<>();
        try {
            String MySql_Command = "SELECT Nombre_Marca_Producto FROM Tabla_Marca_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                Obj_ArrayList_String.add(Obj_ResultSet.getString("Nombre_Marca_Producto"));
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_String;
    }

    public ArrayList<Modelo_Producto> ArrayList_Modelo_Producto() throws SQLException, ClassNotFoundException {
        ArrayList<Modelo_Producto> Obj_ArrayList_Modelo_Producto = new ArrayList<>();
        try {
            String MySql_Command = "SELECT TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto FROM Tabla_Producto TP INNER JOIN Tabla_Categoria_Producto TCP ON TP.ID_Categoria_Producto = TCP.ID_Categoria_Producto INNER JOIN Tabla_Marca_Producto TMP ON TP.ID_Marca_Producto = TMP.ID_Marca_Producto GROUP BY TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                Modelo_Producto Obj_Modelo_Producto = new Modelo_Producto();
                Obj_Modelo_Producto.setID_Producto(Obj_ResultSet.getInt("ID_Producto"));
                Obj_Modelo_Producto.setNombre_Categoria_Producto(Obj_ResultSet.getString("Nombre_Categoria_Producto"));
                Obj_Modelo_Producto.setNombre_Marca_Producto(Obj_ResultSet.getString("Nombre_Marca_Producto"));
                Obj_Modelo_Producto.setNombre_Producto(Obj_ResultSet.getString("Nombre_Producto"));
                Obj_Modelo_Producto.setStock_Producto(Obj_ResultSet.getInt("Stock_Producto"));
                Obj_Modelo_Producto.setPrecio_Producto(Obj_ResultSet.getDouble("Precio_Producto"));
                Obj_Modelo_Producto.setDescripcion_Producto(Obj_ResultSet.getString("Descripcion_Producto"));
                Obj_Modelo_Producto.setEstado_Producto(Obj_ResultSet.getBoolean("Estado_Producto"));
                Obj_Modelo_Producto.setFecha_Registro_Producto(Obj_ResultSet.getString("Fecha_Registro_Producto"));
                Obj_ArrayList_Modelo_Producto.add(Obj_Modelo_Producto);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Modelo_Producto;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object() throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto FROM Tabla_Producto TP INNER JOIN Tabla_Categoria_Producto TCP ON TP.ID_Categoria_Producto = TCP.ID_Categoria_Producto INNER JOIN Tabla_Marca_Producto TMP ON TP.ID_Marca_Producto = TMP.ID_Marca_Producto GROUP BY TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Marca_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Stock_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("Precio_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Descripcion_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getBoolean("Estado_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Registro_Producto"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }

    public boolean Eliminar_Producto(int ID_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Producto SET Estado_Producto = b'0' WHERE ID_Producto = '" + ID_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Restaurar_Producto(int ID_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Producto SET Estado_Producto = b'1' WHERE ID_Producto = '" + ID_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Editar_Producto(Modelo_Producto Obj_Modelo_Producto, int ID_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Producto SET ID_Categoria_Producto = ?, ID_Marca_Producto = ?, Nombre_Producto = ?, Stock_Producto = ?, Precio_Producto = ?, Descripcion_Producto = ? WHERE ID_Producto = '" + ID_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, Obj_Modelo_Producto.getID_Categoria_Producto());
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Producto.getID_Marca_Producto());
            Obj_PreparedStatement.setString(3, Obj_Modelo_Producto.getNombre_Producto());
            Obj_PreparedStatement.setInt(4, Obj_Modelo_Producto.getStock_Producto());
            Obj_PreparedStatement.setDouble(5, Obj_Modelo_Producto.getPrecio_Producto());
            Obj_PreparedStatement.setString(6, Obj_Modelo_Producto.getDescripcion_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Editar_Stock_Producto(int ID_Producto, int Stock_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Producto SET Stock_Producto = ? WHERE ID_Producto = '" + ID_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, Stock_Producto);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }
}
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
import Modelo.Modelo_Categoria_Producto;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Categoria_Producto {

    private CallableStatement Obj_CallableStatement;
    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    private Statement Obj_Statement;

    public boolean Insertar_Categoria_Producto(Modelo_Categoria_Producto Obj_Modelo_Categoria_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Categoria_Producto VALUES (?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setString(2, Obj_Modelo_Categoria_Producto.getNombre_Categoria_Producto());
            Obj_PreparedStatement.setString(3, Obj_Modelo_Categoria_Producto.getDescripcion_Categoria_Producto());
            Obj_PreparedStatement.setBoolean(4, Obj_Modelo_Categoria_Producto.isEstado_Categoria_Producto());
            Obj_PreparedStatement.setString(5, Obj_Modelo_Categoria_Producto.getFecha_Registro_Categoria_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_Nombre_Categoria_Producto(String Nombre_Categoria_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Nombre_Categoria_Producto FROM Tabla_Categoria_Producto WHERE Nombre_Categoria_Producto = '" + Nombre_Categoria_Producto + "';";
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

    public ArrayList<Modelo_Categoria_Producto> ArrayList_Modelo_Categoria_Producto() throws SQLException, ClassNotFoundException {
        ArrayList<Modelo_Categoria_Producto> Obj_ArrayList_Modelo_Categoria_Producto = new ArrayList<>();
        try {
            // String MySql_Command = "SELECT ID_Categoria_Producto, Nombre_Categoria_Producto, Descripcion_Categoria_Producto, Estado_Categoria_Producto, Fecha_Registro_Categoria_Producto FROM Tabla_Categoria_Producto;";
            String MySql_Command = "SELECT TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, COUNT(TP.ID_Categoria_Producto) AS Product_Number FROM Tabla_Categoria_Producto TCP LEFT JOIN Tabla_Producto TP ON TCP.ID_Categoria_Producto = TP.ID_Categoria_Producto GROUP BY TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, TP.ID_Categoria_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                Modelo_Categoria_Producto Obj_Modelo_Categoria_Producto = new Modelo_Categoria_Producto();
                Obj_Modelo_Categoria_Producto.setID_Categoria_Producto(Obj_ResultSet.getInt("ID_Categoria_Producto"));
                Obj_Modelo_Categoria_Producto.setNombre_Categoria_Producto(Obj_ResultSet.getString("Nombre_Categoria_Producto"));
                Obj_Modelo_Categoria_Producto.setDescripcion_Categoria_Producto(Obj_ResultSet.getString("Descripcion_Categoria_Producto"));
                Obj_Modelo_Categoria_Producto.setEstado_Categoria_Producto(Obj_ResultSet.getBoolean("Estado_Categoria_Producto"));
                Obj_Modelo_Categoria_Producto.setFecha_Registro_Categoria_Producto(Obj_ResultSet.getString("Fecha_Registro_Categoria_Producto"));
                Obj_Modelo_Categoria_Producto.setProduct_Number(Obj_ResultSet.getInt("Product_Number"));
                Obj_ArrayList_Modelo_Categoria_Producto.add(Obj_Modelo_Categoria_Producto);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Modelo_Categoria_Producto;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object() throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, COUNT(TP.ID_Categoria_Producto) AS Product_Number FROM Tabla_Categoria_Producto TCP LEFT JOIN Tabla_Producto TP ON TCP.ID_Categoria_Producto = TP.ID_Categoria_Producto GROUP BY TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, TP.ID_Categoria_Producto;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Descripcion_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getBoolean("Estado_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Registro_Categoria_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Product_Number"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }

    public boolean Eliminar_Categoria_Producto(int ID_Categoria_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Categoria_Producto SET Estado_Categoria_Producto = b'0' WHERE ID_Categoria_Producto = '" + ID_Categoria_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Restaurar_Categoria_Producto(int ID_Categoria_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Categoria_Producto SET Estado_Categoria_Producto = b'1' WHERE ID_Categoria_Producto = '" + ID_Categoria_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Editar_Categoria_Producto(Modelo_Categoria_Producto Obj_Modelo_Categoria_Producto, int ID_Categoria_Producto) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Categoria_Producto SET Nombre_Categoria_Producto = ?, Descripcion_Categoria_Producto = ? WHERE ID_Categoria_Producto = '" + ID_Categoria_Producto + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setString(1, Obj_Modelo_Categoria_Producto.getNombre_Categoria_Producto());
            Obj_PreparedStatement.setString(2, Obj_Modelo_Categoria_Producto.getDescripcion_Categoria_Producto());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }
}
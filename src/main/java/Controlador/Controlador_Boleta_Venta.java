/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import Modelo.Modelo_Boleta_Venta;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Boleta_Venta {

    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    private Statement Obj_Statement;
    public static int ID_Boleta_Venta;
    java.math.BigDecimal ID_Boleta_Venta_Alternative;

    public boolean Insertar_Boleta_Venta(Modelo_Boleta_Venta Obj_Modelo_Boleta_Venta) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Boleta_Venta VALUES (?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command, Statement.RETURN_GENERATED_KEYS);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Boleta_Venta.getID_Usuario());
            Obj_PreparedStatement.setInt(3, Obj_Modelo_Boleta_Venta.getID_Cliente());
            Obj_PreparedStatement.setDouble(4, Obj_Modelo_Boleta_Venta.getTotal_Boleta_Venta());
            Obj_PreparedStatement.setString(5, Obj_Modelo_Boleta_Venta.getFecha_Boleta_Venta());
            Obj_PreparedStatement.executeUpdate();

            Obj_ResultSet = Obj_PreparedStatement.getGeneratedKeys();
            while (Obj_ResultSet.next() == true) {
                ID_Boleta_Venta_Alternative = Obj_ResultSet.getBigDecimal(1);
                ID_Boleta_Venta = ID_Boleta_Venta_Alternative.intValue();
            }
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object_01(String Fecha_Boleta_Venta_Inicial, String Fecha_Boleta_Venta_Final) throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT Fecha_Boleta_Venta, COUNT(Fecha_Boleta_Venta) AS Sell_Number FROM Tabla_Boleta_Venta WHERE STR_TO_DATE(Fecha_Boleta_Venta, '%d/%m/%Y') BETWEEN STR_TO_DATE('" + Fecha_Boleta_Venta_Inicial + "', '%d/%m/%Y') AND STR_TO_DATE('" + Fecha_Boleta_Venta_Final + "', '%d/%m/%Y') GROUP BY Fecha_Boleta_Venta;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Sell_Number"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object_02(String Fecha_Boleta_Venta_Inicial, String Fecha_Boleta_Venta_Final) throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT TBV.ID_Boleta_Venta, TU.Nombre_Usuario, TU.Apellido_Usuario, TC.Nombre_Cliente, TC.Apellido_Cliente, TC.Direccion_Cliente, TC.DNI_Cliente, TBV.Fecha_Boleta_Venta, TDBV.Cantidad_Producto, TP.Nombre_Producto, TP.Precio_Producto, TDBV.Subtotal_Detalle_Boleta_Venta, TDBV.Descuento_Detalle_Boleta_Venta, TDBV.IGV_Detalle_Boleta_Venta, TDBV.Total_Detalle_Boleta_Venta FROM Tabla_Detalle_Boleta_Venta TDBV INNER JOIN Tabla_Boleta_Venta TBV ON TDBV.ID_Boleta_Venta = TBV.ID_Boleta_Venta INNER JOIN Tabla_Usuario TU ON TBV.ID_Usuario = TU.ID_Usuario INNER JOIN Tabla_Cliente TC on TBV.ID_Cliente = TC.ID_Cliente INNER JOIN Tabla_Producto TP ON TDBV.ID_Producto = TP.ID_Producto WHERE STR_TO_DATE(TBV.Fecha_Boleta_Venta, '%d/%m/%Y') BETWEEN STR_TO_DATE('" + Fecha_Boleta_Venta_Inicial + "', '%d/%m/%Y') AND  STR_TO_DATE('" + Fecha_Boleta_Venta_Final + "', '%d/%m/%Y');";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Apellido_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Apellido_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Direccion_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("DNI_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Cantidad_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("Precio_Producto"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("Subtotal_Detalle_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("Descuento_Detalle_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("IGV_Detalle_Boleta_Venta"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getDouble("Total_Detalle_Boleta_Venta"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }
}
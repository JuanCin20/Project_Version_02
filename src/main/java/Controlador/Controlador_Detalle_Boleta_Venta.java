/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import Modelo.Modelo_Detalle_Boleta_Venta;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Detalle_Boleta_Venta {

    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;

    public boolean Insertar_Detalle_Boleta_Venta(Modelo_Detalle_Boleta_Venta Obj_Modelo_Detalle_Boleta_Venta) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Detalle_Boleta_Venta VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command, Statement.RETURN_GENERATED_KEYS);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Detalle_Boleta_Venta.getID_Boleta_Venta());
            Obj_PreparedStatement.setInt(3, Obj_Modelo_Detalle_Boleta_Venta.getID_Producto());
            Obj_PreparedStatement.setDouble(4, Obj_Modelo_Detalle_Boleta_Venta.getPrecio_Producto());
            Obj_PreparedStatement.setInt(5, Obj_Modelo_Detalle_Boleta_Venta.getCantidad_Producto());
            Obj_PreparedStatement.setDouble(6, Obj_Modelo_Detalle_Boleta_Venta.getSubtotal_Detalle_Boleta_Venta());
            Obj_PreparedStatement.setDouble(7, Obj_Modelo_Detalle_Boleta_Venta.getDescuento_Detalle_Boleta_Venta());
            Obj_PreparedStatement.setDouble(8, Obj_Modelo_Detalle_Boleta_Venta.getIGV_Detalle_Boleta_Venta());
            Obj_PreparedStatement.setDouble(9, Obj_Modelo_Detalle_Boleta_Venta.getTotal_Detalle_Boleta_Venta());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }
}
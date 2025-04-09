/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.CallableStatement;
import java.sql.Connection;
// import java.sql.PreparedStatement;
import java.sql.ResultSet;
// import java.sql.Statement;
import Modelo.Modelo_Cliente;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Cliente {

    private CallableStatement Obj_CallableStatement;
    private Connection Obj_Connection;
    // private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    // private Statement Obj_Statement;

    public ArrayList<Modelo_Cliente> ArrayList_Modelo_Cliente() throws SQLException, ClassNotFoundException {
        ArrayList<Modelo_Cliente> Obj_ArrayList_Modelo_Cliente = new ArrayList<>();
        try {
            String MySql_Command = "SELECT ID_Cliente, DNI_Cliente, Nombre_Cliente, Apellido_Cliente, Direccion_Cliente, Fecha_Nacimiento_Cliente FROM Tabla_Cliente;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                Modelo_Cliente Obj_Modelo_Cliente = new Modelo_Cliente();
                Obj_Modelo_Cliente.setID_Cliente(Obj_ResultSet.getInt("ID_Cliente"));
                Obj_Modelo_Cliente.setDNI_Cliente(Obj_ResultSet.getInt("DNI_Cliente"));
                Obj_Modelo_Cliente.setNombre_Cliente(Obj_ResultSet.getString("Nombre_Cliente"));
                Obj_Modelo_Cliente.setApellido_Cliente(Obj_ResultSet.getString("Apellido_Cliente"));
                Obj_Modelo_Cliente.setDireccion_Cliente(Obj_ResultSet.getString("Direccion_Cliente"));
                Obj_Modelo_Cliente.setFecha_Nacimiento_Cliente(Obj_ResultSet.getString("Fecha_Nacimiento_Cliente"));
                Obj_ArrayList_Modelo_Cliente.add(Obj_Modelo_Cliente);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Modelo_Cliente;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object() throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT ID_Cliente, DNI_Cliente, Nombre_Cliente, Apellido_Cliente, Direccion_Cliente, Fecha_Nacimiento_Cliente FROM Tabla_Cliente;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("DNI_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Apellido_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Direccion_Cliente"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Nacimiento_Cliente"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }
}
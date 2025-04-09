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
import Modelo.Modelo_Usuario;
import java.sql.SQLException;
import com.mycompany.project_version_02.MySQL_Connection;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.ArrayList;

/**
 *
 * @author JuanCin20
 */
public class Controlador_Usuario {

    private CallableStatement Obj_CallableStatement;
    private Connection Obj_Connection;
    private PreparedStatement Obj_PreparedStatement;
    private ResultSet Obj_ResultSet;
    private Statement Obj_Statement;
    public static int ID_Usuario;

    public boolean Insertar_Usuario(Modelo_Usuario Obj_Modelo_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "INSERT INTO Tabla_Usuario VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, 0);
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Usuario.getID_Tipo_Usuario());
            Obj_PreparedStatement.setInt(3, Obj_Modelo_Usuario.getDNI_Usuario());
            Obj_PreparedStatement.setString(4, Obj_Modelo_Usuario.getE_Mail_Usuario());
            Obj_PreparedStatement.setString(5, Obj_Modelo_Usuario.getPassword_Usuario());
            Obj_PreparedStatement.setString(6, Obj_Modelo_Usuario.getNombre_Usuario());
            Obj_PreparedStatement.setString(7, Obj_Modelo_Usuario.getApellido_Usuario());
            Obj_PreparedStatement.setInt(8, Obj_Modelo_Usuario.getTelefono_Usuario());
            Obj_PreparedStatement.setString(9, Obj_Modelo_Usuario.getDireccion_Usuario());
            Obj_PreparedStatement.setString(10, Obj_Modelo_Usuario.getFecha_Nacimiento_Usuario());
            Obj_PreparedStatement.setBoolean(11, Obj_Modelo_Usuario.isEstado_Usuario());
            Obj_PreparedStatement.setString(12, Obj_Modelo_Usuario.getFecha_Registro_Usuario());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Check_DNI_Usuario(String DNI_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT DNI_Usuario FROM Tabla_Usuario WHERE DNI_Usuario = '" + DNI_Usuario + "';";
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

    public boolean Check_E_Mail_Usuario(String E_Mail_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT E_Mail_Usuario FROM Tabla_Usuario WHERE E_Mail_Usuario = '" + E_Mail_Usuario + "';";
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

    public boolean Check_Telefono_Usuario(String Telefono_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "SELECT Telefono_Usuario FROM Tabla_Usuario WHERE Telefono_Usuario = '" + Telefono_Usuario + "';";
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

    public ArrayList<Object> Check_Usuario(String E_Mail_Usuario) throws SQLException, ClassNotFoundException {
        ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT ID_Usuario, ID_Tipo_Usuario, Password_Usuario, Nombre_Usuario, Apellido_Usuario, Estado_Usuario FROM Tabla_Usuario WHERE E_Mail_Usuario = '" + E_Mail_Usuario + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_Statement = Obj_Connection.createStatement();
            Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            while (Obj_ResultSet.next() == true) {
                ID_Usuario = Obj_ResultSet.getInt("ID_Usuario");
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Tipo_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Password_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Apellido_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getBoolean("Estado_Usuario"));
                return Obj_ArrayList_Object;
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Object;
    }

    public ArrayList<Modelo_Usuario> ArrayList_Modelo_Usuario() throws SQLException, ClassNotFoundException {
        ArrayList<Modelo_Usuario> Obj_ArrayList_Modelo_Usuario = new ArrayList<>();
        try {
            String MySql_Command = "SELECT ID_Usuario, ID_Tipo_Usuario, DNI_Usuario, E_Mail_Usuario, Password_Usuario, Nombre_Usuario, Apellido_Usuario, Telefono_Usuario, Direccion_Usuario, Fecha_Nacimiento_Usuario, Estado_Usuario, Fecha_Registro_Usuario FROM Tabla_Usuario WHERE ID_Tipo_Usuario != 1;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                Modelo_Usuario Obj_Modelo_Usuario = new Modelo_Usuario();
                Obj_Modelo_Usuario.setID_Usuario(Obj_ResultSet.getInt("ID_Usuario"));
                Obj_Modelo_Usuario.setID_Tipo_Usuario(Obj_ResultSet.getInt("ID_Tipo_Usuario"));
                Obj_Modelo_Usuario.setDNI_Usuario(Obj_ResultSet.getInt("DNI_Usuario"));
                Obj_Modelo_Usuario.setE_Mail_Usuario(Obj_ResultSet.getString("E_Mail_Usuario"));
                Obj_Modelo_Usuario.setPassword_Usuario(Obj_ResultSet.getString("Password_Usuario"));
                Obj_Modelo_Usuario.setNombre_Usuario(Obj_ResultSet.getString("Nombre_Usuario"));
                Obj_Modelo_Usuario.setApellido_Usuario(Obj_ResultSet.getString("Apellido_Usuario"));
                Obj_Modelo_Usuario.setTelefono_Usuario(Obj_ResultSet.getInt("Telefono_Usuario"));
                Obj_Modelo_Usuario.setDireccion_Usuario(Obj_ResultSet.getString("Direccion_Usuario"));
                Obj_Modelo_Usuario.setFecha_Nacimiento_Usuario(Obj_ResultSet.getString("Fecha_Nacimiento_Usuario"));
                Obj_Modelo_Usuario.setEstado_Usuario(Obj_ResultSet.getBoolean("Estado_Usuario"));
                Obj_Modelo_Usuario.setFecha_Registro_Usuario(Obj_ResultSet.getString("Fecha_Registro_Usuario"));
                Obj_ArrayList_Modelo_Usuario.add(Obj_Modelo_Usuario);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_Modelo_Usuario;
    }

    public ArrayList<ArrayList<Object>> ArrayList_ArrayList_Object() throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> Obj_ArrayList_ArrayList_Object = new ArrayList<>();
        try {
            String MySql_Command = "SELECT ID_Usuario, ID_Tipo_Usuario, DNI_Usuario, E_Mail_Usuario, Password_Usuario, Nombre_Usuario, Apellido_Usuario, Telefono_Usuario, Direccion_Usuario, Fecha_Nacimiento_Usuario, Estado_Usuario, Fecha_Registro_Usuario FROM Tabla_Usuario WHERE ID_Tipo_Usuario != 1;";
            Obj_Connection = MySQL_Connection.Function_Connection();
            // Obj_Statement = Obj_Connection.createStatement();
            // Obj_ResultSet = Obj_Statement.executeQuery(MySql_Command);
            Obj_CallableStatement = (CallableStatement) Obj_Connection.prepareCall(MySql_Command);
            Obj_ResultSet = Obj_CallableStatement.executeQuery();
            while (Obj_ResultSet.next() == true) {
                ArrayList<Object> Obj_ArrayList_Object = new ArrayList<>();
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("ID_Tipo_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("DNI_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("E_Mail_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Password_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Nombre_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Apellido_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getInt("Telefono_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Direccion_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Nacimiento_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getBoolean("Estado_Usuario"));
                Obj_ArrayList_Object.add(Obj_ResultSet.getString("Fecha_Registro_Usuario"));
                Obj_ArrayList_ArrayList_Object.add(Obj_ArrayList_Object);
            }
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return Obj_ArrayList_ArrayList_Object;
    }

    public boolean Eliminar_Usuario(int ID_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Usuario SET Estado_Usuario = b'0' WHERE ID_Usuario = '" + ID_Usuario + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Restaurar_Usuario(int ID_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Usuario SET Estado_Usuario = b'1' WHERE ID_Usuario = '" + ID_Usuario + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }

    public boolean Editar_Usuario(Modelo_Usuario Obj_Modelo_Usuario, int ID_Usuario) throws SQLException, ClassNotFoundException {
        try {
            String MySql_Command = "UPDATE Tabla_Usuario SET ID_Tipo_Usuario = ?, DNI_Usuario = ?, E_Mail_Usuario = ?, Password_Usuario = ?, Nombre_Usuario = ?, Apellido_Usuario = ?, Telefono_Usuario = ?, Direccion_Usuario = ?, Fecha_Nacimiento_Usuario = ? WHERE ID_Usuario = '" + ID_Usuario + "';";
            Obj_Connection = MySQL_Connection.Function_Connection();
            Obj_PreparedStatement = Obj_Connection.prepareStatement(MySql_Command);
            Obj_PreparedStatement.setInt(1, Obj_Modelo_Usuario.getID_Tipo_Usuario());
            Obj_PreparedStatement.setInt(2, Obj_Modelo_Usuario.getDNI_Usuario());
            Obj_PreparedStatement.setString(3, Obj_Modelo_Usuario.getE_Mail_Usuario());
            Obj_PreparedStatement.setString(4, Obj_Modelo_Usuario.getPassword_Usuario());
            Obj_PreparedStatement.setString(5, Obj_Modelo_Usuario.getNombre_Usuario());
            Obj_PreparedStatement.setString(6, Obj_Modelo_Usuario.getApellido_Usuario());
            Obj_PreparedStatement.setInt(7, Obj_Modelo_Usuario.getTelefono_Usuario());
            Obj_PreparedStatement.setString(8, Obj_Modelo_Usuario.getDireccion_Usuario());
            Obj_PreparedStatement.setString(9, Obj_Modelo_Usuario.getFecha_Nacimiento_Usuario());
            Obj_PreparedStatement.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
        }
        return false;
    }
}
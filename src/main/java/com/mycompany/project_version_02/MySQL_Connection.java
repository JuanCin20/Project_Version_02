/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.project_version_02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.swing.UIManager;
import javax.swing.JOptionPane;

/**
 *
 * @author JuanCin20
 */
public class MySQL_Connection {

    public static String Data_Base_Name = "project_version_01";
    public static String Data_Base_Username = "U22208295";
    public static String Data_Base_Password = "JU@NCIn080604";
    public static String Data_Base_Url = "jdbc:mysql://localhost:3306/" + MySQL_Connection.Data_Base_Name + "?zeroDateTimeBehavior=CONVERT_TO_NULL";
    public static Connection Obj_Connection = null;

    public static Connection Function_Connection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Obj_Connection = DriverManager.getConnection(Data_Base_Url, Data_Base_Username, Data_Base_Password);
            System.out.println("Conexión a la Base de Datos: " + MySQL_Connection.Data_Base_Name + " Exitosa.");
        } catch (SQLException | ClassNotFoundException Obj_SQLException_ClassNotFoundException) {
            Logger.getLogger(MySQL_Connection.class.getName()).log(Level.SEVERE, Obj_SQLException_ClassNotFoundException.getMessage());
            UIManager.put("OptionPane.okButtonText", "Aceptar");
            JOptionPane.showMessageDialog(null, Obj_SQLException_ClassNotFoundException.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return Obj_Connection;
    }
}
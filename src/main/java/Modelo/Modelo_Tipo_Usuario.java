/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Tipo_Usuario {

    // Sector #01
    private int ID_Tipo_Usuario;
    private String Nombre_Tipo_Usuario;
    private String Fecha_Registro_Tipo_Usuario;

    // Sector #02
    public Modelo_Tipo_Usuario(int ID_Tipo_Usuario, String Nombre_Tipo_Usuario, String Fecha_Registro_Tipo_Usuario) {
        this.ID_Tipo_Usuario = ID_Tipo_Usuario;
        this.Nombre_Tipo_Usuario = Nombre_Tipo_Usuario;
        this.Fecha_Registro_Tipo_Usuario = Fecha_Registro_Tipo_Usuario;
    }

    // Sector #03
    public Modelo_Tipo_Usuario() {
        this.ID_Tipo_Usuario = 0;
        this.Nombre_Tipo_Usuario = "";
        this.Fecha_Registro_Tipo_Usuario = "";
    }

    // Sector #04
    /**
     * @return the ID_Tipo_Usuario
     */
    public int getID_Tipo_Usuario() {
        return ID_Tipo_Usuario;
    }

    /**
     * @param ID_Tipo_Usuario the ID_Tipo_Usuario to set
     */
    public void setID_Tipo_Usuario(int ID_Tipo_Usuario) {
        this.ID_Tipo_Usuario = ID_Tipo_Usuario;
    }

    /**
     * @return the Nombre_Tipo_Usuario
     */
    public String getNombre_Tipo_Usuario() {
        return Nombre_Tipo_Usuario;
    }

    /**
     * @param Nombre_Tipo_Usuario the Nombre_Tipo_Usuario to set
     */
    public void setNombre_Tipo_Usuario(String Nombre_Tipo_Usuario) {
        this.Nombre_Tipo_Usuario = Nombre_Tipo_Usuario;
    }

    /**
     * @return the Fecha_Registro_Tipo_Usuario
     */
    public String getFecha_Registro_Tipo_Usuario() {
        return Fecha_Registro_Tipo_Usuario;
    }

    /**
     * @param Fecha_Registro_Tipo_Usuario the Fecha_Registro_Tipo_Usuario to set
     */
    public void setFecha_Registro_Tipo_Usuario(String Fecha_Registro_Tipo_Usuario) {
        this.Fecha_Registro_Tipo_Usuario = Fecha_Registro_Tipo_Usuario;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Tipo_Usuario{");
        sb.append("ID_Tipo_Usuario=").append(ID_Tipo_Usuario);
        sb.append(", Nombre_Tipo_Usuario=").append(Nombre_Tipo_Usuario);
        sb.append(", Fecha_Registro_Tipo_Usuario=").append(Fecha_Registro_Tipo_Usuario);
        sb.append('}');
        return sb.toString();
    }
}
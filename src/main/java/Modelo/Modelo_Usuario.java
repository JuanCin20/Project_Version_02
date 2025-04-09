/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Usuario {

    // Sector #01
    private int ID_Usuario;
    private int ID_Tipo_Usuario;
    private int DNI_Usuario;
    private String E_Mail_Usuario;
    private String Password_Usuario;
    private String Nombre_Usuario;
    private String Apellido_Usuario;
    private int Telefono_Usuario;
    private String Direccion_Usuario;
    private String Fecha_Nacimiento_Usuario;
    private boolean Estado_Usuario;
    private String Fecha_Registro_Usuario;

    // Sector #02
    public Modelo_Usuario(int ID_Usuario, int ID_Tipo_Usuario, int DNI_Usuario, String E_Mail_Usuario, String Password_Usuario, String Nombre_Usuario, String Apellido_Usuario, int Telefono_Usuario, String Direccion_Usuario, String Fecha_Nacimiento_Usuario, boolean Estado_Usuario, String Fecha_Registro_Usuario) {
        this.ID_Usuario = ID_Usuario;
        this.ID_Tipo_Usuario = ID_Tipo_Usuario;
        this.DNI_Usuario = DNI_Usuario;
        this.E_Mail_Usuario = E_Mail_Usuario;
        this.Password_Usuario = Password_Usuario;
        this.Nombre_Usuario = Nombre_Usuario;
        this.Apellido_Usuario = Apellido_Usuario;
        this.Telefono_Usuario = Telefono_Usuario;
        this.Direccion_Usuario = Direccion_Usuario;
        this.Fecha_Nacimiento_Usuario = Fecha_Nacimiento_Usuario;
        this.Estado_Usuario = Estado_Usuario;
        this.Fecha_Registro_Usuario = Fecha_Registro_Usuario;
    }

    // Sector #03
    public Modelo_Usuario() {
        this.ID_Usuario = 0;
        this.ID_Tipo_Usuario = 0;
        this.DNI_Usuario = 0;
        this.E_Mail_Usuario = "";
        this.Password_Usuario = "";
        this.Nombre_Usuario = "";
        this.Apellido_Usuario = "";
        this.Telefono_Usuario = 0;
        this.Direccion_Usuario = "";
        this.Fecha_Nacimiento_Usuario = "";
        this.Estado_Usuario = false;
        this.Fecha_Registro_Usuario = "";
    }

    // Sector #04
    /**
     * @return the ID_Usuario
     */
    public int getID_Usuario() {
        return ID_Usuario;
    }

    /**
     * @param ID_Usuario the ID_Usuario to set
     */
    public void setID_Usuario(int ID_Usuario) {
        this.ID_Usuario = ID_Usuario;
    }

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
     * @return the DNI_Usuario
     */
    public int getDNI_Usuario() {
        return DNI_Usuario;
    }

    /**
     * @param DNI_Usuario the DNI_Usuario to set
     */
    public void setDNI_Usuario(int DNI_Usuario) {
        this.DNI_Usuario = DNI_Usuario;
    }

    /**
     * @return the E_Mail_Usuario
     */
    public String getE_Mail_Usuario() {
        return E_Mail_Usuario;
    }

    /**
     * @param E_Mail_Usuario the E_Mail_Usuario to set
     */
    public void setE_Mail_Usuario(String E_Mail_Usuario) {
        this.E_Mail_Usuario = E_Mail_Usuario;
    }

    /**
     * @return the Password_Usuario
     */
    public String getPassword_Usuario() {
        return Password_Usuario;
    }

    /**
     * @param Password_Usuario the Password_Usuario to set
     */
    public void setPassword_Usuario(String Password_Usuario) {
        this.Password_Usuario = Password_Usuario;
    }

    /**
     * @return the Nombre_Usuario
     */
    public String getNombre_Usuario() {
        return Nombre_Usuario;
    }

    /**
     * @param Nombre_Usuario the Nombre_Usuario to set
     */
    public void setNombre_Usuario(String Nombre_Usuario) {
        this.Nombre_Usuario = Nombre_Usuario;
    }

    /**
     * @return the Apellido_Usuario
     */
    public String getApellido_Usuario() {
        return Apellido_Usuario;
    }

    /**
     * @param Apellido_Usuario the Apellido_Usuario to set
     */
    public void setApellido_Usuario(String Apellido_Usuario) {
        this.Apellido_Usuario = Apellido_Usuario;
    }

    /**
     * @return the Telefono_Usuario
     */
    public int getTelefono_Usuario() {
        return Telefono_Usuario;
    }

    /**
     * @param Telefono_Usuario the Telefono_Usuario to set
     */
    public void setTelefono_Usuario(int Telefono_Usuario) {
        this.Telefono_Usuario = Telefono_Usuario;
    }

    /**
     * @return the Direccion_Usuario
     */
    public String getDireccion_Usuario() {
        return Direccion_Usuario;
    }

    /**
     * @param Direccion_Usuario the Direccion_Usuario to set
     */
    public void setDireccion_Usuario(String Direccion_Usuario) {
        this.Direccion_Usuario = Direccion_Usuario;
    }

    /**
     * @return the Fecha_Nacimiento_Usuario
     */
    public String getFecha_Nacimiento_Usuario() {
        return Fecha_Nacimiento_Usuario;
    }

    /**
     * @param Fecha_Nacimiento_Usuario the Fecha_Nacimiento_Usuario to set
     */
    public void setFecha_Nacimiento_Usuario(String Fecha_Nacimiento_Usuario) {
        this.Fecha_Nacimiento_Usuario = Fecha_Nacimiento_Usuario;
    }

    /**
     * @return the Estado_Usuario
     */
    public boolean isEstado_Usuario() {
        return Estado_Usuario;
    }

    /**
     * @param Estado_Usuario the Estado_Usuario to set
     */
    public void setEstado_Usuario(boolean Estado_Usuario) {
        this.Estado_Usuario = Estado_Usuario;
    }

    /**
     * @return the Fecha_Registro_Usuario
     */
    public String getFecha_Registro_Usuario() {
        return Fecha_Registro_Usuario;
    }

    /**
     * @param Fecha_Registro_Usuario the Fecha_Registro_Usuario to set
     */
    public void setFecha_Registro_Usuario(String Fecha_Registro_Usuario) {
        this.Fecha_Registro_Usuario = Fecha_Registro_Usuario;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Usuario{");
        sb.append("ID_Usuario=").append(ID_Usuario);
        sb.append(", ID_Tipo_Usuario=").append(ID_Tipo_Usuario);
        sb.append(", DNI_Usuario=").append(DNI_Usuario);
        sb.append(", E_Mail_Usuario=").append(E_Mail_Usuario);
        sb.append(", Password_Usuario=").append(Password_Usuario);
        sb.append(", Nombre_Usuario=").append(Nombre_Usuario);
        sb.append(", Apellido_Usuario=").append(Apellido_Usuario);
        sb.append(", Telefono_Usuario=").append(Telefono_Usuario);
        sb.append(", Direccion_Usuario=").append(Direccion_Usuario);
        sb.append(", Fecha_Nacimiento_Usuario=").append(Fecha_Nacimiento_Usuario);
        sb.append(", Estado_Usuario=").append(Estado_Usuario);
        sb.append(", Fecha_Registro_Usuario=").append(Fecha_Registro_Usuario);
        sb.append('}');
        return sb.toString();
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Cliente {

    // Sector #01
    private int ID_Cliente;
    private int DNI_Cliente;
    private String Nombre_Cliente;
    private String Apellido_Cliente;
    private String Direccion_Cliente;
    private String Fecha_Nacimiento_Cliente;

    // Sector #02
    public Modelo_Cliente(int ID_Cliente, int DNI_Cliente, String Nombre_Cliente, String Apellido_Cliente, String Direccion_Cliente, String Fecha_Nacimiento_Cliente) {
        this.ID_Cliente = ID_Cliente;
        this.DNI_Cliente = DNI_Cliente;
        this.Nombre_Cliente = Nombre_Cliente;
        this.Apellido_Cliente = Apellido_Cliente;
        this.Direccion_Cliente = Direccion_Cliente;
        this.Fecha_Nacimiento_Cliente = Fecha_Nacimiento_Cliente;
    }

    // Sector #03
    public Modelo_Cliente() {
        this.ID_Cliente = 0;
        this.DNI_Cliente = 0;
        this.Nombre_Cliente = "";
        this.Apellido_Cliente = "";
        this.Direccion_Cliente = "";
        this.Fecha_Nacimiento_Cliente = "";
    }

    // Sector #04
    /**
     * @return the ID_Cliente
     */
    public int getID_Cliente() {
        return ID_Cliente;
    }

    /**
     * @param ID_Cliente the ID_Cliente to set
     */
    public void setID_Cliente(int ID_Cliente) {
        this.ID_Cliente = ID_Cliente;
    }

    /**
     * @return the DNI_Cliente
     */
    public int getDNI_Cliente() {
        return DNI_Cliente;
    }

    /**
     * @param DNI_Cliente the DNI_Cliente to set
     */
    public void setDNI_Cliente(int DNI_Cliente) {
        this.DNI_Cliente = DNI_Cliente;
    }

    /**
     * @return the Nombre_Cliente
     */
    public String getNombre_Cliente() {
        return Nombre_Cliente;
    }

    /**
     * @param Nombre_Cliente the Nombre_Cliente to set
     */
    public void setNombre_Cliente(String Nombre_Cliente) {
        this.Nombre_Cliente = Nombre_Cliente;
    }

    /**
     * @return the Apellido_Cliente
     */
    public String getApellido_Cliente() {
        return Apellido_Cliente;
    }

    /**
     * @param Apellido_Cliente the Apellido_Cliente to set
     */
    public void setApellido_Cliente(String Apellido_Cliente) {
        this.Apellido_Cliente = Apellido_Cliente;
    }

    /**
     * @return the Direccion_Cliente
     */
    public String getDireccion_Cliente() {
        return Direccion_Cliente;
    }

    /**
     * @param Direccion_Cliente the Direccion_Cliente to set
     */
    public void setDireccion_Cliente(String Direccion_Cliente) {
        this.Direccion_Cliente = Direccion_Cliente;
    }

    /**
     * @return the Fecha_Nacimiento_Cliente
     */
    public String getFecha_Nacimiento_Cliente() {
        return Fecha_Nacimiento_Cliente;
    }

    /**
     * @param Fecha_Nacimiento_Cliente the Fecha_Nacimiento_Cliente to set
     */
    public void setFecha_Nacimiento_Cliente(String Fecha_Nacimiento_Cliente) {
        this.Fecha_Nacimiento_Cliente = Fecha_Nacimiento_Cliente;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Cliente{");
        sb.append("ID_Cliente=").append(ID_Cliente);
        sb.append(", DNI_Cliente=").append(DNI_Cliente);
        sb.append(", Nombre_Cliente=").append(Nombre_Cliente);
        sb.append(", Apellido_Cliente=").append(Apellido_Cliente);
        sb.append(", Direccion_Cliente=").append(Direccion_Cliente);
        sb.append(", Fecha_Nacimiento_Cliente=").append(Fecha_Nacimiento_Cliente);
        sb.append('}');
        return sb.toString();
    }
}
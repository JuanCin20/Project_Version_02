/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Boleta_Venta {

    // Sector #01
    private int ID_Boleta_Venta;
    private int ID_Usuario;
    private int ID_Cliente;
    private double Total_Boleta_Venta;
    private String Fecha_Boleta_Venta;

    // Sector #02
    public Modelo_Boleta_Venta(int ID_Boleta_Venta, int ID_Usuario, int ID_Cliente, double Total_Boleta_Venta, String Fecha_Boleta_Venta) {
        this.ID_Boleta_Venta = ID_Boleta_Venta;
        this.ID_Usuario = ID_Usuario;
        this.ID_Cliente = ID_Cliente;
        this.Total_Boleta_Venta = Total_Boleta_Venta;
        this.Fecha_Boleta_Venta = Fecha_Boleta_Venta;
    }

    // Sector #03
    public Modelo_Boleta_Venta() {
        this.ID_Boleta_Venta = 0;
        this.ID_Usuario = 0;
        this.ID_Cliente = 0;
        this.Total_Boleta_Venta = 00.00;
        this.Fecha_Boleta_Venta = "";
    }

    // Sector #04
    /**
     * @return the ID_Boleta_Venta
     */
    public int getID_Boleta_Venta() {
        return ID_Boleta_Venta;
    }

    /**
     * @param ID_Boleta_Venta the ID_Boleta_Venta to set
     */
    public void setID_Boleta_Venta(int ID_Boleta_Venta) {
        this.ID_Boleta_Venta = ID_Boleta_Venta;
    }

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
     * @return the Total_Boleta_Venta
     */
    public double getTotal_Boleta_Venta() {
        return Total_Boleta_Venta;
    }

    /**
     * @param Total_Boleta_Venta the Total_Boleta_Venta to set
     */
    public void setTotal_Boleta_Venta(double Total_Boleta_Venta) {
        this.Total_Boleta_Venta = Total_Boleta_Venta;
    }

    /**
     * @return the Fecha_Boleta_Venta
     */
    public String getFecha_Boleta_Venta() {
        return Fecha_Boleta_Venta;
    }

    /**
     * @param Fecha_Boleta_Venta the Fecha_Boleta_Venta to set
     */
    public void setFecha_Boleta_Venta(String Fecha_Boleta_Venta) {
        this.Fecha_Boleta_Venta = Fecha_Boleta_Venta;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Boleta_Venta{");
        sb.append("ID_Boleta_Venta=").append(ID_Boleta_Venta);
        sb.append(", ID_Usuario=").append(ID_Usuario);
        sb.append(", ID_Cliente=").append(ID_Cliente);
        sb.append(", Total_Boleta_Venta=").append(Total_Boleta_Venta);
        sb.append(", Fecha_Boleta_Venta=").append(Fecha_Boleta_Venta);
        sb.append('}');
        return sb.toString();
    }
}
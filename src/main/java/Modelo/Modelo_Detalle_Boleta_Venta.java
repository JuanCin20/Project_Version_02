/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Detalle_Boleta_Venta {

    // Sector #01
    private int ID_Detalle_Boleta_Venta;
    private int ID_Boleta_Venta;
    private int ID_Producto;
    // Extra_Sector_A
    private String Nombre_Producto;
    private int Stock_Producto;
    // Extra_Sector_B
    private double Precio_Producto;
    private int Cantidad_Producto;
    private double Subtotal_Detalle_Boleta_Venta;
    private double Descuento_Detalle_Boleta_Venta;
    private double IGV_Detalle_Boleta_Venta;
    private double Total_Detalle_Boleta_Venta;

    // Sector #02
    public Modelo_Detalle_Boleta_Venta(int ID_Detalle_Boleta_Venta, int ID_Boleta_Venta, int ID_Producto, String Nombre_Producto, int Stock_Producto, double Precio_Producto, int Cantidad_Producto, double Subtotal_Detalle_Boleta_Venta, double Descuento_Detalle_Boleta_Venta, double IGV_Detalle_Boleta_Venta, double Total_Detalle_Boleta_Venta) {
        this.ID_Detalle_Boleta_Venta = ID_Detalle_Boleta_Venta;
        this.ID_Boleta_Venta = ID_Boleta_Venta;
        this.ID_Producto = ID_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Stock_Producto = Stock_Producto;
        this.Precio_Producto = Precio_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
        this.Subtotal_Detalle_Boleta_Venta = Subtotal_Detalle_Boleta_Venta;
        this.Descuento_Detalle_Boleta_Venta = Descuento_Detalle_Boleta_Venta;
        this.IGV_Detalle_Boleta_Venta = IGV_Detalle_Boleta_Venta;
        this.Total_Detalle_Boleta_Venta = Total_Detalle_Boleta_Venta;
    }

    // Sector #03
    public Modelo_Detalle_Boleta_Venta() {
        this.ID_Detalle_Boleta_Venta = 0;
        this.ID_Boleta_Venta = 0;
        this.ID_Producto = 0;
        this.Nombre_Producto = "";
        this.Stock_Producto = 0;
        this.Precio_Producto = 00.00;
        this.Cantidad_Producto = 0;
        this.Subtotal_Detalle_Boleta_Venta = 00.00;
        this.Descuento_Detalle_Boleta_Venta = 00.00;
        this.IGV_Detalle_Boleta_Venta = 00.00;
        this.Total_Detalle_Boleta_Venta = 00.00;
    }

    // Sector #04
    /**
     * @return the ID_Detalle_Boleta_Venta
     */
    public int getID_Detalle_Boleta_Venta() {
        return ID_Detalle_Boleta_Venta;
    }

    /**
     * @param ID_Detalle_Boleta_Venta the ID_Detalle_Boleta_Venta to set
     */
    public void setID_Detalle_Boleta_Venta(int ID_Detalle_Boleta_Venta) {
        this.ID_Detalle_Boleta_Venta = ID_Detalle_Boleta_Venta;
    }

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
     * @return the ID_Producto
     */
    public int getID_Producto() {
        return ID_Producto;
    }

    /**
     * @param ID_Producto the ID_Producto to set
     */
    public void setID_Producto(int ID_Producto) {
        this.ID_Producto = ID_Producto;
    }

    /**
     * @return the Nombre_Producto
     */
    public String getNombre_Producto() {
        return Nombre_Producto;
    }

    /**
     * @param Nombre_Producto the Nombre_Producto to set
     */
    public void setNombre_Producto(String Nombre_Producto) {
        this.Nombre_Producto = Nombre_Producto;
    }

    /**
     * @return the Stock_Producto
     */
    public int getStock_Producto() {
        return Stock_Producto;
    }

    /**
     * @param Stock_Producto the Stock_Producto to set
     */
    public void setStock_Producto(int Stock_Producto) {
        this.Stock_Producto = Stock_Producto;
    }

    /**
     * @return the Precio_Producto
     */
    public double getPrecio_Producto() {
        return Precio_Producto;
    }

    /**
     * @param Precio_Producto the Precio_Producto to set
     */
    public void setPrecio_Producto(double Precio_Producto) {
        this.Precio_Producto = Precio_Producto;
    }

    /**
     * @return the Cantidad_Producto
     */
    public int getCantidad_Producto() {
        return Cantidad_Producto;
    }

    /**
     * @param Cantidad_Producto the Cantidad_Producto to set
     */
    public void setCantidad_Producto(int Cantidad_Producto) {
        this.Cantidad_Producto = Cantidad_Producto;
    }

    /**
     * @return the Subtotal_Detalle_Boleta_Venta
     */
    public double getSubtotal_Detalle_Boleta_Venta() {
        return Subtotal_Detalle_Boleta_Venta;
    }

    /**
     * @param Subtotal_Detalle_Boleta_Venta the Subtotal_Detalle_Boleta_Venta to
     * set
     */
    public void setSubtotal_Detalle_Boleta_Venta(double Subtotal_Detalle_Boleta_Venta) {
        this.Subtotal_Detalle_Boleta_Venta = Subtotal_Detalle_Boleta_Venta;
    }

    /**
     * @return the Descuento_Detalle_Boleta_Venta
     */
    public double getDescuento_Detalle_Boleta_Venta() {
        return Descuento_Detalle_Boleta_Venta;
    }

    /**
     * @param Descuento_Detalle_Boleta_Venta the Descuento_Detalle_Boleta_Venta
     * to set
     */
    public void setDescuento_Detalle_Boleta_Venta(double Descuento_Detalle_Boleta_Venta) {
        this.Descuento_Detalle_Boleta_Venta = Descuento_Detalle_Boleta_Venta;
    }

    /**
     * @return the IGV_Detalle_Boleta_Venta
     */
    public double getIGV_Detalle_Boleta_Venta() {
        return IGV_Detalle_Boleta_Venta;
    }

    /**
     * @param IGV_Detalle_Boleta_Venta the IGV_Detalle_Boleta_Venta to set
     */
    public void setIGV_Detalle_Boleta_Venta(double IGV_Detalle_Boleta_Venta) {
        this.IGV_Detalle_Boleta_Venta = IGV_Detalle_Boleta_Venta;
    }

    /**
     * @return the Total_Detalle_Boleta_Venta
     */
    public double getTotal_Detalle_Boleta_Venta() {
        return Total_Detalle_Boleta_Venta;
    }

    /**
     * @param Total_Detalle_Boleta_Venta the Total_Detalle_Boleta_Venta to set
     */
    public void setTotal_Detalle_Boleta_Venta(double Total_Detalle_Boleta_Venta) {
        this.Total_Detalle_Boleta_Venta = Total_Detalle_Boleta_Venta;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Detalle_Boleta_Venta{");
        sb.append("ID_Detalle_Boleta_Venta=").append(ID_Detalle_Boleta_Venta);
        sb.append(", ID_Boleta_Venta=").append(ID_Boleta_Venta);
        sb.append(", ID_Producto=").append(ID_Producto);
        sb.append(", Nombre_Producto=").append(Nombre_Producto);
        sb.append(", Stock_Producto=").append(Stock_Producto);
        sb.append(", Precio_Producto=").append(Precio_Producto);
        sb.append(", Cantidad_Producto=").append(Cantidad_Producto);
        sb.append(", Subtotal_Detalle_Boleta_Venta=").append(Subtotal_Detalle_Boleta_Venta);
        sb.append(", Descuento_Detalle_Boleta_Venta=").append(Descuento_Detalle_Boleta_Venta);
        sb.append(", IGV_Detalle_Boleta_Venta=").append(IGV_Detalle_Boleta_Venta);
        sb.append(", Total_Detalle_Boleta_Venta=").append(Total_Detalle_Boleta_Venta);
        sb.append('}');
        return sb.toString();
    }
}
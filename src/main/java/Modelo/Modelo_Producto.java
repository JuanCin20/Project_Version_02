/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Producto {

    // Sector #01
    private int ID_Producto;
    private int ID_Categoria_Producto;
    private String Nombre_Categoria_Producto;
    private int ID_Marca_Producto;
    private String Nombre_Marca_Producto;
    private String Nombre_Producto;
    private int Stock_Producto;
    private double Precio_Producto;
    private String Descripcion_Producto;
    private boolean Estado_Producto;
    private String Fecha_Registro_Producto;

    // Sector #02
    public Modelo_Producto(int ID_Producto, int ID_Categoria_Producto, String Nombre_Categoria_Producto, int ID_Marca_Producto, String Nombre_Marca_Producto, String Nombre_Producto, int Stock_Producto, double Precio_Producto, String Descripcion_Producto, boolean Estado_Producto, String Fecha_Registro_Producto) {
        this.ID_Producto = ID_Producto;
        this.ID_Categoria_Producto = ID_Categoria_Producto;
        this.Nombre_Categoria_Producto = Nombre_Categoria_Producto;
        this.ID_Marca_Producto = ID_Marca_Producto;
        this.Nombre_Marca_Producto = Nombre_Marca_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Stock_Producto = Stock_Producto;
        this.Precio_Producto = Precio_Producto;
        this.Descripcion_Producto = Descripcion_Producto;
        this.Estado_Producto = Estado_Producto;
        this.Fecha_Registro_Producto = Fecha_Registro_Producto;
    }

    // Sector #03
    public Modelo_Producto() {
        this.ID_Producto = 0;
        this.ID_Categoria_Producto = 0;
        this.Nombre_Categoria_Producto = "";
        this.ID_Marca_Producto = 0;
        this.Nombre_Marca_Producto = "";
        this.Nombre_Producto = "";
        this.Stock_Producto = 0;
        this.Precio_Producto = 00.00;
        this.Descripcion_Producto = "";
        this.Estado_Producto = false;
        this.Fecha_Registro_Producto = "";
    }

    // Sector #04
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
     * @return the ID_Categoria_Producto
     */
    public int getID_Categoria_Producto() {
        return ID_Categoria_Producto;
    }

    /**
     * @param ID_Categoria_Producto the ID_Categoria_Producto to set
     */
    public void setID_Categoria_Producto(int ID_Categoria_Producto) {
        this.ID_Categoria_Producto = ID_Categoria_Producto;
    }

    /**
     * @return the Nombre_Categoria_Producto
     */
    public String getNombre_Categoria_Producto() {
        return Nombre_Categoria_Producto;
    }

    /**
     * @param Nombre_Categoria_Producto the Nombre_Categoria_Producto to set
     */
    public void setNombre_Categoria_Producto(String Nombre_Categoria_Producto) {
        this.Nombre_Categoria_Producto = Nombre_Categoria_Producto;
    }

    /**
     * @return the ID_Marca_Producto
     */
    public int getID_Marca_Producto() {
        return ID_Marca_Producto;
    }

    /**
     * @param ID_Marca_Producto the ID_Marca_Producto to set
     */
    public void setID_Marca_Producto(int ID_Marca_Producto) {
        this.ID_Marca_Producto = ID_Marca_Producto;
    }

    /**
     * @return the Nombre_Marca_Producto
     */
    public String getNombre_Marca_Producto() {
        return Nombre_Marca_Producto;
    }

    /**
     * @param Nombre_Marca_Producto the Nombre_Marca_Producto to set
     */
    public void setNombre_Marca_Producto(String Nombre_Marca_Producto) {
        this.Nombre_Marca_Producto = Nombre_Marca_Producto;
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
     * @return the Descripcion_Producto
     */
    public String getDescripcion_Producto() {
        return Descripcion_Producto;
    }

    /**
     * @param Descripcion_Producto the Descripcion_Producto to set
     */
    public void setDescripcion_Producto(String Descripcion_Producto) {
        this.Descripcion_Producto = Descripcion_Producto;
    }

    /**
     * @return the Estado_Producto
     */
    public boolean isEstado_Producto() {
        return Estado_Producto;
    }

    /**
     * @param Estado_Producto the Estado_Producto to set
     */
    public void setEstado_Producto(boolean Estado_Producto) {
        this.Estado_Producto = Estado_Producto;
    }

    /**
     * @return the Fecha_Registro_Producto
     */
    public String getFecha_Registro_Producto() {
        return Fecha_Registro_Producto;
    }

    /**
     * @param Fecha_Registro_Producto the Fecha_Registro_Producto to set
     */
    public void setFecha_Registro_Producto(String Fecha_Registro_Producto) {
        this.Fecha_Registro_Producto = Fecha_Registro_Producto;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Producto{");
        sb.append("ID_Producto=").append(ID_Producto);
        sb.append(", ID_Categoria_Producto=").append(ID_Categoria_Producto);
        sb.append(", Nombre_Categoria_Producto=").append(Nombre_Categoria_Producto);
        sb.append(", ID_Marca_Producto=").append(ID_Marca_Producto);
        sb.append(", Nombre_Marca_Producto=").append(Nombre_Marca_Producto);
        sb.append(", Nombre_Producto=").append(Nombre_Producto);
        sb.append(", Stock_Producto=").append(Stock_Producto);
        sb.append(", Precio_Producto=").append(Precio_Producto);
        sb.append(", Descripcion_Producto=").append(Descripcion_Producto);
        sb.append(", Estado_Producto=").append(Estado_Producto);
        sb.append(", Fecha_Registro_Producto=").append(Fecha_Registro_Producto);
        sb.append('}');
        return sb.toString();
    }
}
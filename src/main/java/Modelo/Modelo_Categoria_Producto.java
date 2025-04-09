/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Categoria_Producto {

    // Sector #01
    private int ID_Categoria_Producto;
    private String Nombre_Categoria_Producto;
    private String Descripcion_Categoria_Producto;
    private boolean Estado_Categoria_Producto;
    private String Fecha_Registro_Categoria_Producto;
    private int Product_Number;

    // Sector #02
    public Modelo_Categoria_Producto(int ID_Categoria_Producto, String Nombre_Categoria_Producto, String Descripcion_Categoria_Producto, boolean Estado_Categoria_Producto, String Fecha_Registro_Categoria_Producto, int Product_Number) {
        this.ID_Categoria_Producto = ID_Categoria_Producto;
        this.Nombre_Categoria_Producto = Nombre_Categoria_Producto;
        this.Descripcion_Categoria_Producto = Descripcion_Categoria_Producto;
        this.Estado_Categoria_Producto = Estado_Categoria_Producto;
        this.Fecha_Registro_Categoria_Producto = Fecha_Registro_Categoria_Producto;
        this.Product_Number = Product_Number;
    }

    // Sector #03
    public Modelo_Categoria_Producto() {
        this.ID_Categoria_Producto = 0;
        this.Nombre_Categoria_Producto = "";
        this.Descripcion_Categoria_Producto = "";
        this.Estado_Categoria_Producto = false;
        this.Fecha_Registro_Categoria_Producto = "";
        this.Product_Number = 0;
    }

    // Sector #04
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
     * @return the Descripcion_Categoria_Producto
     */
    public String getDescripcion_Categoria_Producto() {
        return Descripcion_Categoria_Producto;
    }

    /**
     * @param Descripcion_Categoria_Producto the Descripcion_Categoria_Producto
     * to set
     */
    public void setDescripcion_Categoria_Producto(String Descripcion_Categoria_Producto) {
        this.Descripcion_Categoria_Producto = Descripcion_Categoria_Producto;
    }

    /**
     * @return the Estado_Categoria_Producto
     */
    public boolean isEstado_Categoria_Producto() {
        return Estado_Categoria_Producto;
    }

    /**
     * @param Estado_Categoria_Producto the Estado_Categoria_Producto to set
     */
    public void setEstado_Categoria_Producto(boolean Estado_Categoria_Producto) {
        this.Estado_Categoria_Producto = Estado_Categoria_Producto;
    }

    /**
     * @return the Fecha_Registro_Categoria_Producto
     */
    public String getFecha_Registro_Categoria_Producto() {
        return Fecha_Registro_Categoria_Producto;
    }

    /**
     * @param Fecha_Registro_Categoria_Producto the
     * Fecha_Registro_Categoria_Producto to set
     */
    public void setFecha_Registro_Categoria_Producto(String Fecha_Registro_Categoria_Producto) {
        this.Fecha_Registro_Categoria_Producto = Fecha_Registro_Categoria_Producto;
    }

    /**
     * @return the Product_Number
     */
    public int getProduct_Number() {
        return Product_Number;
    }

    /**
     * @param Product_Number the Product_Number to set
     */
    public void setProduct_Number(int Product_Number) {
        this.Product_Number = Product_Number;
    }

    // Sector #05
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Modelo_Categoria_Producto{");
        sb.append("ID_Categoria_Producto=").append(ID_Categoria_Producto);
        sb.append(", Nombre_Categoria_Producto=").append(Nombre_Categoria_Producto);
        sb.append(", Descripcion_Categoria_Producto=").append(Descripcion_Categoria_Producto);
        sb.append(", Estado_Categoria_Producto=").append(Estado_Categoria_Producto);
        sb.append(", Fecha_Registro_Categoria_Producto=").append(Fecha_Registro_Categoria_Producto);
        sb.append(", Product_Number=").append(Product_Number);
        sb.append('}');
        return sb.toString();
    }
}
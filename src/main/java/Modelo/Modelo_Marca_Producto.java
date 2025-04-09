/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JuanCin20
 */
public class Modelo_Marca_Producto {

    // Sector #01
    private int ID_Marca_Producto;
    private String Nombre_Marca_Producto;
    private int Telefono_Marca_Producto;
    private String E_Mail_Marca_Producto;
    private String Direccion_Marca_Producto;
    private boolean Estado_Marca_Producto;
    private String Fecha_Registro_Marca_Producto;
    private int Product_Number;

    // Sector #02
    public Modelo_Marca_Producto(int ID_Marca_Producto, String Nombre_Marca_Producto, int Telefono_Marca_Producto, String E_Mail_Marca_Producto, String Direccion_Marca_Producto, boolean Estado_Marca_Producto, String Fecha_Registro_Marca_Producto, int Product_Number) {
        this.ID_Marca_Producto = ID_Marca_Producto;
        this.Nombre_Marca_Producto = Nombre_Marca_Producto;
        this.Telefono_Marca_Producto = Telefono_Marca_Producto;
        this.E_Mail_Marca_Producto = E_Mail_Marca_Producto;
        this.Direccion_Marca_Producto = Direccion_Marca_Producto;
        this.Estado_Marca_Producto = Estado_Marca_Producto;
        this.Fecha_Registro_Marca_Producto = Fecha_Registro_Marca_Producto;
        this.Product_Number = Product_Number;
    }

    // Sector #03
    public Modelo_Marca_Producto() {
        this.ID_Marca_Producto = 0;
        this.Nombre_Marca_Producto = "";
        this.Telefono_Marca_Producto = 0;
        this.E_Mail_Marca_Producto = "";
        this.Direccion_Marca_Producto = "";
        this.Estado_Marca_Producto = false;
        this.Fecha_Registro_Marca_Producto = "";
        this.Product_Number = 0;
    }

    // Sector #04
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
     * @return the Telefono_Marca_Producto
     */
    public int getTelefono_Marca_Producto() {
        return Telefono_Marca_Producto;
    }

    /**
     * @param Telefono_Marca_Producto the Telefono_Marca_Producto to set
     */
    public void setTelefono_Marca_Producto(int Telefono_Marca_Producto) {
        this.Telefono_Marca_Producto = Telefono_Marca_Producto;
    }

    /**
     * @return the E_Mail_Marca_Producto
     */
    public String getE_Mail_Marca_Producto() {
        return E_Mail_Marca_Producto;
    }

    /**
     * @param E_Mail_Marca_Producto the E_Mail_Marca_Producto to set
     */
    public void setE_Mail_Marca_Producto(String E_Mail_Marca_Producto) {
        this.E_Mail_Marca_Producto = E_Mail_Marca_Producto;
    }

    /**
     * @return the Direccion_Marca_Producto
     */
    public String getDireccion_Marca_Producto() {
        return Direccion_Marca_Producto;
    }

    /**
     * @param Direccion_Marca_Producto the Direccion_Marca_Producto to set
     */
    public void setDireccion_Marca_Producto(String Direccion_Marca_Producto) {
        this.Direccion_Marca_Producto = Direccion_Marca_Producto;
    }

    /**
     * @return the Estado_Marca_Producto
     */
    public boolean isEstado_Marca_Producto() {
        return Estado_Marca_Producto;
    }

    /**
     * @param Estado_Marca_Producto the Estado_Marca_Producto to set
     */
    public void setEstado_Marca_Producto(boolean Estado_Marca_Producto) {
        this.Estado_Marca_Producto = Estado_Marca_Producto;
    }

    /**
     * @return the Fecha_Registro_Marca_Producto
     */
    public String getFecha_Registro_Marca_Producto() {
        return Fecha_Registro_Marca_Producto;
    }

    /**
     * @param Fecha_Registro_Marca_Producto the Fecha_Registro_Marca_Producto to
     * set
     */
    public void setFecha_Registro_Marca_Producto(String Fecha_Registro_Marca_Producto) {
        this.Fecha_Registro_Marca_Producto = Fecha_Registro_Marca_Producto;
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
        sb.append("Modelo_Marca_Producto{");
        sb.append("ID_Marca_Producto=").append(ID_Marca_Producto);
        sb.append(", Nombre_Marca_Producto=").append(Nombre_Marca_Producto);
        sb.append(", Telefono_Marca_Producto=").append(Telefono_Marca_Producto);
        sb.append(", E_Mail_Marca_Producto=").append(E_Mail_Marca_Producto);
        sb.append(", Direccion_Marca_Producto=").append(Direccion_Marca_Producto);
        sb.append(", Estado_Marca_Producto=").append(Estado_Marca_Producto);
        sb.append(", Fecha_Registro_Marca_Producto=").append(Fecha_Registro_Marca_Producto);
        sb.append(", Product_Number=").append(Product_Number);
        sb.append('}');
        return sb.toString();
    }
}
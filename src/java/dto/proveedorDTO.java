/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author parisbastian
 */
public class proveedorDTO {
    
    private int idproveedor;
    private String nombre;
    private String datoscontacto;
    private String rubro;

    public proveedorDTO() {
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDatoscontacto() {
        return datoscontacto;
    }

    public void setDatoscontacto(String datoscontacto) {
        this.datoscontacto = datoscontacto;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }
    
    
    
}

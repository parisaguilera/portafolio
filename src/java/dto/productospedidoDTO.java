/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author parisbastian
 */
public class productospedidoDTO {
    
    private int idproductospedido;
    private String nombre;
    private int idfamilia;
    private Date fechavencimiento;
    private int idtipoproducto;
    private String marca;
    private String codigobarra;
    private String descripcion;
    private int cantidad;
    private int totalcompra;

    public productospedidoDTO() {
    }

    public int getIdproductospedido() {
        return idproductospedido;
    }

    public void setIdproductospedido(int idproductospedido) {
        this.idproductospedido = idproductospedido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdfamilia() {
        return idfamilia;
    }

    public void setIdfamilia(int idfamilia) {
        this.idfamilia = idfamilia;
    }

    public Date getFechavencimiento() {
        return fechavencimiento;
    }

    public void setFechavencimiento(Date fechavencimiento) {
        this.fechavencimiento = fechavencimiento;
    }

    public int getIdtipoproducto() {
        return idtipoproducto;
    }

    public void setIdtipoproducto(int idtipoproducto) {
        this.idtipoproducto = idtipoproducto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCodigobarra() {
        return codigobarra;
    }

    public void setCodigobarra(String codigobarra) {
        this.codigobarra = codigobarra;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getTotalcompra() {
        return totalcompra;
    }

    public void setTotalcompra(int totalcompra) {
        this.totalcompra = totalcompra;
    }
    
    
    
}

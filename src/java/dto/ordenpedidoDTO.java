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
public class ordenpedidoDTO {
    
    private int idordenpedido;
    private int idproveedor;
    private Date fecha;
    private int idproductospedido;

    public ordenpedidoDTO() {
    }

    public int getIdordenpedido() {
        return idordenpedido;
    }

    public void setIdordenpedido(int idordenpedido) {
        this.idordenpedido = idordenpedido;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIdproductospedido() {
        return idproductospedido;
    }

    public void setIdproductospedido(int idproductospedido) {
        this.idproductospedido = idproductospedido;
    }
    
    
}

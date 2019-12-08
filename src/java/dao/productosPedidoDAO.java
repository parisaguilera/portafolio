/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.productospedidoDTO;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface productosPedidoDAO extends BaseDAO<productospedidoDTO>{
    
    public ArrayList<productospedidoDTO> listarCategoria(int idfamilia);
    public ArrayList<productospedidoDTO> listarOrdenPedido(int idOrdenPedido);
    public int sacarFamilia(String rubro);
    
    public productospedidoDTO obtenerPorID(int idpropedidos);
    public String sacarMedida(int idfamilia);
    public String generarCodigoBarra(int idproveedor,int idfamilia,Date fechavencimiento,int idtipoproducto);
    
}

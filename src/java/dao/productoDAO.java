/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.productoDTO;
import java.sql.Date;
import java.util.ArrayList;

public interface productoDAO extends BaseDAO<productoDTO> {
    
        public ArrayList<productoDTO> listarTodos();
        public ArrayList<productoDTO> listarCategoria(int idfamilia);
        public productoDTO listarPorID(int idProducto);
        public boolean actualizar(String nombre,int pCompra,int pVenta,int idCategoria,String marca,Date sqlDate,String codigoBarra,String descripcion,int stock,int stockCri,int numId);
        public String idtonombre(int idfamilia);
        public String idproductotonombre(int idproducto);
        
        
        
        

}

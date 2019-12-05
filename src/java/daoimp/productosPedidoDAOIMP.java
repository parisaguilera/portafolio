/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.productosPedidoDAO;
import dto.productospedidoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class productosPedidoDAOIMP implements productosPedidoDAO{

    @Override
    public boolean agregar(productospedidoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<productospedidoDTO> listarCategoria(int idfamilia) {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM productospedido where IDFAMILIA = ?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idfamilia);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList< productospedidoDTO> lista = new ArrayList<>();
            while(rs.next()){
                productospedidoDTO producto = new  productospedidoDTO();
                producto.setIdproductospedido(rs.getInt("IDPRODUCTOSPEDIDO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setIdfamilia(rs.getInt("IDFAMILIA"));
                producto.setFechavencimiento(rs.getDate("FECHAVENCIMIENTO"));
                producto.setIdtipoproducto(rs.getInt("IDTIPOPRODUCTO"));
                producto.setMarca(rs.getString("MARCA"));
                producto.setCodigobarra(rs.getString("CODIGOBARRA"));
                producto.setDescripcion(rs.getString("DESCRIPCION"));
                producto.setCantidad(rs.getInt("CANTIDAD"));
                producto.setTotalcompra(rs.getInt("TOTALCOMPRA"));
                lista.add(producto);
            }
            
             return lista;
         } catch (SQLException e) {
            System.out.println("Error SQL al Listar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Listar : " + e.getMessage());
        }
        return null;    
    }

    @Override
    public int sacarFamilia(String rubro) {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT f.IDFAMILIA FROM FAMILIAPRODUCTO f JOIN PROVEEDOR p on(f.NOMBRE=p.RUBRO) WHERE f.NOMBRE=? AND p.RUBRO=?";
        try {
            PreparedStatement total = conexion.prepareStatement(query);
            total.setString(1, rubro);
            total.setString(2, rubro);
            ResultSet rs = total.executeQuery();
            
            if(rs.next()){
                return rs.getInt("IDFAMILIA");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL al sacar total: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al sacar total: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public productospedidoDTO obtenerPorID(int idpropedidos) {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM productospedido where IDPRODUCTOSPEDIDO = ?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idpropedidos);
            
            ResultSet rs = buscar.executeQuery();
            
           
            while(rs.next()){
                productospedidoDTO producto = new  productospedidoDTO();
                producto.setIdproductospedido(rs.getInt("IDPRODUCTOSPEDIDO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setIdfamilia(rs.getInt("IDFAMILIA"));
                producto.setFechavencimiento(rs.getDate("FECHAVENCIMIENTO"));
                producto.setIdtipoproducto(rs.getInt("IDTIPOPRODUCTO"));
                producto.setMarca(rs.getString("MARCA"));
                producto.setCodigobarra(rs.getString("CODIGOBARRA"));
                producto.setDescripcion(rs.getString("DESCRIPCION"));
                producto.setCantidad(rs.getInt("CANTIDAD"));
                producto.setTotalcompra(rs.getInt("TOTALCOMPRA"));
               return producto;
            }
            
             
         } catch (SQLException e) {
            System.out.println("Error SQL al obtener : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al obtener : " + e.getMessage());
        }
        return null; 
    }
    
}

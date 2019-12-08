/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.ordenPedidoDAO;
import dto.ordenpedidoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class ordenPedidoDAOIMP implements ordenPedidoDAO{

    @Override
    public boolean agregar(ordenpedidoDTO dto) {
        String query = "INSERT INTO ORDENPEDIDO (idordenpedido,IDPROVEEDOR,FECHA,IDPRODUCTOSPEDIDO,recepcion) VALUES(?,?,?,?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
            agregar.setInt(1, dto.getIdordenpedido());
            agregar.setInt(2, dto.getIdproveedor());
            agregar.setDate(3, dto.getFecha());
            agregar.setInt(4, dto.getIdproductospedido());
            agregar.setInt(5, dto.getRecepcion());
            if (agregar.executeUpdate()>0) {
                return true;            
            }        
        } catch (SQLException w) {
             System.out.println("Error SQL dao al agregar "+
                    w.getMessage());
         }catch(Exception e){
            System.out.println("Error dao al agregar "+
                    e.getMessage());
        }
        return false;    
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int nuevoIDordenPedido() {

             Connection conexion = Conexion.getConexion();
        String query = "SELECT idordenpedido FROM ordenpedido GROUP BY idordenpedido";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total+1;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public ArrayList<ordenpedidoDTO> listarTodosporOrden(int idordenpedido) {
       Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM ordenpedido WHERE IDORDENPEDIDO=?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idordenpedido);
            ResultSet rs = buscar.executeQuery();
             ArrayList<ordenpedidoDTO> lista = new ArrayList<>();
             
            while(rs.next()){
                ordenpedidoDTO orden = new ordenpedidoDTO();
                orden.setIdordenpedido(rs.getInt("IDORDENPEDIDO"));
                orden.setIdproveedor(rs.getInt("IDPROVEEDOR"));
                orden.setFecha(rs.getDate("FECHA"));
                orden.setIdproductospedido(rs.getInt("IDPRODUCTOSPEDIDO"));
                orden.setRecepcion(rs.getInt("RECEPCION"));
                lista.add(orden);
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
    public int totalOrdenes() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT idordenpedido FROM ordenpedido GROUP BY idordenpedido";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public ArrayList<ordenpedidoDTO> listarTodosAgrupados() {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT IDORDENPEDIDO, IDPROVEEDOR,FECHA,recepcion FROM ORDENPEDIDO GROUP BY IDORDENPEDIDO, IDPROVEEDOR,FECHA,recepcion ORDER BY IDORDENPEDIDO asc";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            ResultSet rs = buscar.executeQuery();
             ArrayList<ordenpedidoDTO> lista = new ArrayList<>();
             
            while(rs.next()){
                ordenpedidoDTO orden = new ordenpedidoDTO();
                orden.setIdordenpedido(rs.getInt("IDORDENPEDIDO"));
                orden.setIdproveedor(rs.getInt("IDPROVEEDOR"));
                orden.setFecha(rs.getDate("FECHA"));
                orden.setRecepcion(rs.getInt("RECEPCION"));
                lista.add(orden);
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
    public boolean aprobarOrden(int idOrdenPedido) {
           Connection conexion = Conexion.getConexion();
        String query = "UPDATE ORDENPEDIDO SET recepcion=1 WHERE idordenpedido=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);

            update.setInt(1, idOrdenPedido);
            update.executeUpdate();
            update.close();
                return true;
  
          } catch (SQLException e) {
            System.out.println("Error SQL al aprobar: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al aprobar: " + e.getMessage());
        }
        return false;
    }
    
}

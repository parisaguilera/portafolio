/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.recepcionPedidoDAO;
import dto.recepcionpedidoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author parisbastian
 */
public class recepcionPedidoDAOIMP implements recepcionPedidoDAO{

    @Override
    public boolean agregar(recepcionpedidoDTO dto) {
           String query = "INSERT INTO RECEPCIONPEDIDO (IDORDENPEDIDO,IDUSUARIO) VALUES(?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
            agregar.setInt(1, dto.getIdordenpedido());
            agregar.setInt(2, dto.getIdusuario());
    
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
    
}

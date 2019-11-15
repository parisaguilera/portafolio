/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.clienteDAO;
import dto.clienteDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author parisbastian
 */
public class clienteDAOIMP implements clienteDAO{

    @Override
    public boolean actualizarEstadoPAGADO (int idBoleta) {
        Connection conexion = Conexion.getConexion();
        String query = "UPDATE cliente SET estado = 0 WHERE idboleta=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);
            
            update.setInt(1,idBoleta);
            update.executeUpdate();
            update.close();

                return true;
  
          } catch (SQLException e) {
            System.out.println("Error SQL al Actualizar: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Actualizar: " + e.getMessage());
        }
        return false;

    }

    @Override
    public boolean agregar(clienteDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
   
    
}

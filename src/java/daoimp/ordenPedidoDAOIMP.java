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

/**
 *
 * @author parisbastian
 */
public class ordenPedidoDAOIMP implements ordenPedidoDAO{

    @Override
    public boolean agregar(ordenpedidoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
}

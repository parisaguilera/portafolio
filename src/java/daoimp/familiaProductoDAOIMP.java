/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.familiaProductoDAO;
import dto.familiaProductoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class familiaProductoDAOIMP implements familiaProductoDAO{

    @Override
    public ArrayList<familiaProductoDTO> listarTodos() {
    Connection conexion = Conexion.getConexion();
        String query = "select * from familiaproducto";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<familiaProductoDTO> lista = new ArrayList<>();
            while(rs.next()){
               familiaProductoDTO fam = new familiaProductoDTO();
                fam.setIdfamilia(rs.getInt("IDFAMILIA"));
                fam.setNombre(rs.getString("NOMBRE"));
                fam.setMedida(rs.getString("MEDIDA"));
                lista.add(fam);
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
    public boolean actualizar(int id, String nombre, String medida) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int nombreToId(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String idToNombre(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean agregar(familiaProductoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

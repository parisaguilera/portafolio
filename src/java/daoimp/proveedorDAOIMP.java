/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.proveedorDAO;
import dto.proveedorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class proveedorDAOIMP implements proveedorDAO{

    @Override
    public ArrayList<proveedorDTO> listarTodos() {
                Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM proveedor ORDER BY IDPROVEEDOR ASC";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            ResultSet rs = buscar.executeQuery();
             ArrayList<proveedorDTO> lista = new ArrayList<>();
            while(rs.next()){
                proveedorDTO proveedor = new proveedorDTO();
                proveedor.setIdproveedor(rs.getInt("IDPROVEEDOR"));
                proveedor.setNombre(rs.getString("NOMBRE"));
                proveedor.setDatoscontacto(rs.getString("DATOSCONTACTO"));
                proveedor.setRubro(rs.getString("RUBRO"));
                lista.add(proveedor);
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
    public boolean agregar(proveedorDTO dto) {
             String query = "INSERT INTO proveedor (NOMBRE,DATOSCONTACTO,RUBRO) VALUES(?,?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
            agregar.setString(1, dto.getNombre());
            agregar.setString(2, dto.getDatoscontacto());
            agregar.setString(3, dto.getRubro());
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
            Connection conexion = Conexion.getConexion();
        String query = "DELETE FROM proveedor WHERE IDPROVEEDOR= ?";
        
        try {
           
                PreparedStatement eliminar= conexion.prepareStatement(query);
                eliminar.setInt(1, id);

                eliminar.execute();

                return true;
      
         } catch (SQLException e) {
            System.out.println("Error SQL al Eliminar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Eliminar : " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean actualizar(String nombre, String datosContacto, String rubro,int id) {
           Connection conexion = Conexion.getConexion();
        String query = "UPDATE PROVEEDOR SET NOMBRE = ?, DATOSCONTACTO= ?,RUBRO=? WHERE IDPROVEEDOR=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);
            
            update.setString(1,nombre);
            update.setString(2,datosContacto);
            update.setString(3,rubro);
            update.setInt(4, id);
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
    
}

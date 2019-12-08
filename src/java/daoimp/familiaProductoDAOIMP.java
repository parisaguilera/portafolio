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
        String query = "select IDFAMILIA,NOMBRE,UPPER(MEDIDA) AS MEDIDA from familiaproducto ORDER BY idfamilia asc";
        
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
    public boolean actualizar(int idFamilia, String nombre, String medida) {
         Connection conexion = Conexion.getConexion();
        String query = "UPDATE FAMILIAPRODUCTO SET NOMBRE = ?, MEDIDA= ? WHERE IDFAMILIA=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);
            
            update.setString(1,nombre);
            update.setString(2,medida);
            update.setInt(3, idFamilia);
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
    public boolean agregar(familiaProductoDTO dto) {
        String query = "INSERT INTO FAMILIAPRODUCTO (NOMBRE,MEDIDA) VALUES(?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
            agregar.setString(1, dto.getNombre());
            agregar.setString(2, dto.getMedida());
    
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
        String query = "DELETE FROM FAMILIAPRODUCTO WHERE idfamilia= ?";
        
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
    public int cantProductosPorCategoria(int idfamilia) {
      Connection conexion = Conexion.getConexion();
        String query = "SELECT nvl(count(idfamilia),0) AS TOTAL FROM producto WHERE idfamilia=?";
        try {
            PreparedStatement total = conexion.prepareStatement(query);
            total.setInt(1, idfamilia);
            ResultSet rs = total.executeQuery();
            
            if(rs.next()){
                return rs.getInt("TOTAL");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL al sacar total: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al sacar total: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public boolean existe(String nombre) {
           String nombreCat = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT nombre FROM FAMILIAPRODUCTO WHERE nombre=?";
            PreparedStatement validar = conexion.prepareStatement(query);
            validar.setString(1, nombre);
            ResultSet rs = validar.executeQuery();
            while (rs.next()) {
                nombreCat = rs.getString("NOMBRE");
            }
            if (nombreCat != null) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException w) {
            System.out.println("Error SQL al ver si existe" + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al ver si existe " + e.getMessage());
        }
        return false;
    }

    @Override
    public String idtonombre(int idfamilia) {
              Connection conexion = Conexion.getConexion();
        String query = "SELECT nombre FROM FAMILIAPRODUCTO WHERE idfamilia=?";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setInt(1, idfamilia);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getString("NOMBRE");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar id a nombre: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar id a nombre: " + e.getMessage());
        }
        return null; 
    }

    @Override
    public String idtomedida(int idfamilia) {
Connection conexion = Conexion.getConexion();
        String query = "SELECT medida FROM FAMILIAPRODUCTO WHERE idfamilia=?";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setInt(1, idfamilia);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getString("MEDIDA");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar id a medida: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar id a medida: " + e.getMessage());
        }
        return null; 

    }
    
}

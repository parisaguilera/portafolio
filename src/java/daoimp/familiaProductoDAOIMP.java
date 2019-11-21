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
        String query = "select * from familiaproducto ORDER BY idfamilia asc";
        
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
}

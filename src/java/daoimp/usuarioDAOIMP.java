/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.usuarioDAO;
import dto.usuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author parisbastian
 */
public class usuarioDAOIMP implements usuarioDAO{

    @Override
    public usuarioDTO leerUsuario(String usuario) {
        usuarioDTO dto=null;
         try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT  *  FROM usuario WHERE nombre=?";
            PreparedStatement leer = conexion.prepareStatement(query);
            leer.setString(1,usuario);
            ResultSet rs = leer.executeQuery();
            while (rs.next()) {
                dto = new usuarioDTO();
                
                dto.setIdusuario(rs.getInt("IDUSUARIO"));
                dto.setNombre(rs.getString("NOMBRE"));
                dto.setCargo(rs.getString("CARGO"));
                dto.setContrasena(rs.getString("CONTRASENA"));
            }
            leer.close();
            conexion.close();
        } catch (SQLException w) {
            System.out.println("Error SQL al leer usuario " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al leer usuario" + e.getMessage());
        }
        return dto;
    }

    @Override
    public boolean validarUsuario(String usuario, String contrasena) {
        String usP = null;
        String contrP = null;
        
        try {

            Connection conexion = Conexion.getConexion();
            String query = "SELECT nombre,contrasena FROM usuario WHERE nombre=?";
            PreparedStatement validar = conexion.prepareStatement(query);
            validar.setString(1, usuario);
            ResultSet rs = validar.executeQuery();
            while (rs.next()) {
                usP = rs.getString("NOMBRE");
                contrP = rs.getString("CONTRASENA");
            }
            if (contrP.equalsIgnoreCase(contrasena)) {
                return true;
            }
        } catch (SQLException w) {
            System.out.println("Error SQL al validar login" + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al validar login " + e.getMessage());
        }
        return false;
    }
    
    @Override
    public boolean existe(String usuario) {
        String userP = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT nombre FROM usuario WHERE nombre=?";
            PreparedStatement validar = conexion.prepareStatement(query);
            validar.setString(1, usuario);
            ResultSet rs = validar.executeQuery();
            while (rs.next()) {
                userP = rs.getString("NOMBRE");
            }
            if (userP != null) {
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
    public boolean agregar(usuarioDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    
}

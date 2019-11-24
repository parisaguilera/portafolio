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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class clienteDAOIMP implements clienteDAO{


    @Override
    public boolean agregar(clienteDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<clienteDTO> listarTodos(String rut, int estado) {
         Connection conexion = Conexion.getConexion();
        String query =  "select idcliente, UPPER(nombre) as NOMBRE, contacto,sum(deuda) as deuda, rut,estado from cliente where "
                + "rut= ? and estado= ? "
                + "group by rut,nombre,contacto,idcliente,estado";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setString(1, rut);
            buscar.setInt(2, estado);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<clienteDTO> lista = new ArrayList<>();
            while(rs.next()){
                clienteDTO cliente = new clienteDTO();
                cliente.setIdcliente(rs.getInt("IDCLIENTE"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setContacto(rs.getString("CONTACTO"));
                cliente.setDeuda(rs.getInt("DEUDA"));
                cliente.setRut(rs.getString("RUT"));
                cliente.setEstado(rs.getInt("ESTADO"));
                lista.add(cliente);
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
    public ArrayList<clienteDTO> listarFiadosRechazados(String rut) {
         Connection conexion = Conexion.getConexion();
        String query =  "select idcliente, UPPER(nombre) as NOMBRE, contacto,deuda, rut,estado from cliente where "
                + "rut= ? and estado= 0 ";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setString(1, rut);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<clienteDTO> lista = new ArrayList<>();
            while(rs.next()){
                clienteDTO cliente = new clienteDTO();
                cliente.setIdcliente(rs.getInt("IDCLIENTE"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setContacto(rs.getString("CONTACTO"));
                cliente.setDeuda(rs.getInt("DEUDA"));
                cliente.setRut(rs.getString("RUT"));
                cliente.setEstado(rs.getInt("ESTADO"));
                lista.add(cliente);
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
    public int rutToId(String rut) {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT idcliente FROM cliente WHERE rut=? GROUP BY idcliente";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setString(1, rut);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getInt("IDCLIENTE");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar Rut a id: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar Rut a id:" + e.getMessage());
        }
        return 0; 
    }

    @Override
    public ArrayList<clienteDTO> listarTodosEstado(int estado) {
          Connection conexion = Conexion.getConexion();
        String query =  "select idboleta,rut,UPPER(nombre) as NOMBRE, contacto,deuda,estado from cliente WHERE estado=? ORDER BY IDBOLETA DESC";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, estado);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<clienteDTO> lista = new ArrayList<>();
            while(rs.next()){
                clienteDTO cliente = new clienteDTO();
                cliente.setIdboleta(rs.getInt("IDBOLETA"));
                cliente.setRut(rs.getString("RUT"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setContacto(rs.getString("CONTACTO"));
                cliente.setDeuda(rs.getInt("DEUDA"));
                cliente.setEstado(rs.getInt("ESTADO"));
                lista.add(cliente);
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
    public boolean actualizarEstado(int estado,int idBoleta) {
               Connection conexion = Conexion.getConexion();
        String query = "UPDATE CLIENTE SET ESTADO = ? WHERE IDBOLETA=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);

            update.setInt(1, estado);
              update.setInt(2, idBoleta);
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

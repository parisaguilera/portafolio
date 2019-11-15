/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.pagoFiadoDAO;
import dto.pagoFiadoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class pagoFiadoDAOIMP implements pagoFiadoDAO {

    @Override
    public ArrayList<pagoFiadoDTO> listarTodos(int idpago) {
           Connection conexion = Conexion.getConexion();
        String query = "select * from pagofiado where idpagofiado = ?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idpago);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<pagoFiadoDTO> lista = new ArrayList<>();
            while(rs.next()){
                pagoFiadoDTO fiado = new pagoFiadoDTO();
                fiado.setIdpagofiado(rs.getInt("IDPAGOFIADO"));
                fiado.setIdcliente(rs.getInt("IDCLIENTE"));
                fiado.setAbono(rs.getInt("ABONO"));
                fiado.setFechaabono(rs.getDate("FECHAABONO"));
                lista.add(fiado);
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
    public String idToNombre(int idcliente) {
             Connection conexion = Conexion.getConexion();
        String query = "select nombre from cliente where idcliente = ?";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setInt(1, idcliente);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getString("nombre");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar id a nombre: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar id a nombre: " + e.getMessage());
        }
        return null; 
    }

    @Override
    public boolean agregar(pagoFiadoDTO dto) {
String query = "Insert into pagofiado (IDpagofiado,IDcliente,ABONO,FECHAABONO) VALUES(?,?,?,to_date(sysdate,'DD/MM/RR'))";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
            agregar.setInt(1, dto.getIdpagofiado());
            agregar.setInt(2, dto.getIdcliente());
            agregar.setInt(3, dto.getAbono());
    
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
    public int deudaFiado(int idpagofiado) {
      Connection conexion = Conexion.getConexion();
        String query = "select sum(abono) as total from pagofiado where idpagofiado= ? group by idpagofiado,idcliente";
        try {
            PreparedStatement total = conexion.prepareStatement(query);
            total.setInt(1, idpagofiado);
            ResultSet rs = total.executeQuery();
            
            if(rs.next()){
                return rs.getInt("total");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL al sacar total: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al sacar total: " + e.getMessage());
        }
        return 0;
    }
    
}

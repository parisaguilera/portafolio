/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.boletaDAO;
import dto.boletaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author parisbastian
 */
public class boletaDAOIMP implements boletaDAO{

    @Override
    public int nuevoIDboleta() {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT idboleta FROM boleta GROUP BY idboleta";
        
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

    @Override
    public boolean agregar(boletaDTO dto) {
        String query = "INSERT INTO boleta (IDBOLETA,IDPRODUCTO,CANTIDAD,TOTAL) VALUES (?,?,?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
             agregar.setInt(1, dto.getIdboleta());
             agregar.setInt(2, dto.getIdproducto());
             agregar.setInt(3, dto.getCantidad());
             agregar.setInt(4, dto.getTotal());
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
    public int totalPorBoleta(int idBoleta) {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT sum(total) AS TOTAL FROM boleta WHERE idboleta=? GROUP BY idboleta";
        try {
            PreparedStatement total = conexion.prepareStatement(query);
            total.setInt(1, idBoleta);
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
    
}

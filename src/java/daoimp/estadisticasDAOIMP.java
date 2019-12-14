/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoimp;

import bd.Conexion;
import dao.estadisticasDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author parisbastian
 */
public class estadisticasDAOIMP implements estadisticasDAO{

    @Override
    public int cantidadProductos() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT idproducto FROM PRODUCTO";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadCategorias() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT IDFAMILIA FROM familiaproducto";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadClientes() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT idcliente FROM cliente GROUP BY idcliente,rut";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadFiados(int estado) {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT idcliente FROM cliente WHERE estado=? GROUP BY idcliente,rut";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, estado);
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadProveedores() {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT idproveedor FROM PROVEEDOR";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadOrdenes() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT IDORDENPEDIDO FROM ORDENPEDIDO GROUP BY IDORDENPEDIDO,idproveedor";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadVentasDirectas() {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT idcliente FROM cliente WHERE estado='3' GROUP BY idcliente,rut";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }

    @Override
    public int cantidadUsuarios(String rol) {
         Connection conexion = Conexion.getConexion();
        String query = "SELECT IDUSUARIO FROM USUARIO WHERE cargo=?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setString(1, rol);
            ResultSet rs = buscar.executeQuery();
            
           int total = 0;
                        while (rs.next()){
                          
                           total++;
                        }

            
             return total;
         } catch (SQLException e) {
            System.out.println("Error SQL al enumerar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al enumerar : " + e.getMessage());
        }
        return 0;  
    }
    
}

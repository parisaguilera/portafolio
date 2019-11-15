/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bd;

import java.sql.Connection;
import java.sql.DriverManager;
        
public class Conexion {
    
    //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ORACLEBD", "system", "oracle");
   public static Connection getConexion(){
       
   Connection connection = null;
    try{
        //en donde "test","test" en el usuario y contraseña de la base de datos
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ADMINALMACEN", "12345");
    }catch(Exception e){
        System.out.println(e);  
    }  
    return connection;   
    }
}
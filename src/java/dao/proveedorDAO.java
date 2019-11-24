/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.proveedorDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface  proveedorDAO extends BaseDAO<proveedorDTO> {
    
     public ArrayList<proveedorDTO> listarTodos();
     public boolean actualizar(String nombre,String datosContacto,String rubro,int id);
     
}

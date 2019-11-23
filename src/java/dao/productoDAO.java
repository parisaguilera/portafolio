/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.productoDTO;
import java.util.ArrayList;

public interface productoDAO extends BaseDAO<productoDTO> {
    
        public ArrayList<productoDTO> listarTodos();
        public ArrayList<productoDTO> listarCategoria(int idfamilia);
        public boolean actualizar(int id, String nombre, String medida);
        public String idtonombre(int idfamilia);
       

}

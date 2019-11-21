/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.familiaProductoDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface familiaProductoDAO extends BaseDAO<familiaProductoDTO>{
    
    
        public ArrayList<familiaProductoDTO> listarTodos();
        public int cantProductosPorCategoria(int idfamilia);
        public boolean actualizar(int id, String nombre, String medida);
        public boolean existe(String nombre);
    
}

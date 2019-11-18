/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.clienteDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface clienteDAO extends BaseDAO<clienteDTO>{
    
    public ArrayList<clienteDTO> listarTodos(String rut, int estado);

}

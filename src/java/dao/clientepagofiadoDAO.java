/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.clientepagofiadoDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface clientepagofiadoDAO extends BaseDAO<clientepagofiadoDTO>{
    
    public ArrayList<clientepagofiadoDTO> listarTodos(String rut);
    
}

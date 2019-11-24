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
    
    public ArrayList<clienteDTO> listarFiadosRechazados(String rut);
    
    public ArrayList<clienteDTO> listarTodos(String rut, int estado);

    public ArrayList<clienteDTO> listarTodosEstado(int estado);
    
    public boolean actualizarEstado(int estado,int idBoleta);
    
    public int rutToId(String rut);

}

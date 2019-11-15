/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.pagoFiadoDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface pagoFiadoDAO extends BaseDAO<pagoFiadoDTO>{
    
    public ArrayList<pagoFiadoDTO> listarTodos(int idpago);
    public String idToNombre(int idcliente);
    public int deudaFiado(int idpagofiado);
    
}

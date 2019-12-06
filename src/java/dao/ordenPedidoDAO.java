/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ordenpedidoDTO;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public interface ordenPedidoDAO extends BaseDAO<ordenpedidoDTO>{
    
     public ArrayList<ordenpedidoDTO> listarTodosAgrupados();
    public ArrayList<ordenpedidoDTO> listarTodosporOrden(int idordenpedido);
    public int nuevoIDordenPedido();
    public int totalOrdenes();
}

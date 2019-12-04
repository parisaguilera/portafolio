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
   
    //->fichacliente.jsp
    //Este array es para listar la ficha cliente
    public ArrayList<clienteDTO> listarFicha();
    public ArrayList<clienteDTO> listarFichaRut(String rut);
    public ArrayList<clienteDTO> listarTodosFicha(String rut, int estado);
    public clienteDTO clienteFicha(String rut);
    
    public boolean actualizarEstado(int estado,int idBoleta);
    
    public int rutToId(String rut);
    
    //registrar venta
    public boolean existeRut(String rut);

    //carrito
    public int nuevoIDcliente();
    public String rutAnombre(String rut);
    public String rutAcontacto(String rut);
    public int rutAID(String rut);
}

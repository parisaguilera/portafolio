/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class listaProductosCarrito {
    
    private ArrayList<productoDTO> lista = new ArrayList<productoDTO>();
    
    
    public void agregarProducto(productoDTO pro){
        
        lista.add(pro);
    }
    
    public ArrayList<productoDTO> getLista(){
        
        return lista;
    }
    
    
    public int size(){
        
    return lista.size();
    }
    
    
    
    
}

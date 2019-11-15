/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author parisbastian
 */
public interface BaseDAO<T> {
      public boolean agregar(T dto);
      public boolean eliminar(int id);
    
}

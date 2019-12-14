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
public interface estadisticasDAO {
      public int cantidadProductos();
      public int cantidadCategorias();
      public int cantidadClientes();
      public int cantidadFiados(int estado);
      public int cantidadProveedores();
      public int cantidadOrdenes();
      public int cantidadVentasDirectas();
      public int cantidadUsuarios(String rol);
      
}

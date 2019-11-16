/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.usuarioDTO;

/**
 *
 * @author parisbastian
 */
public interface usuarioDAO extends BaseDAO<usuarioDTO>{
   
    public usuarioDTO leerUsuario(String usuario);
    public boolean validarUsuario(String usuario, String contrasena);
    public boolean existe(String usuario);
    
    
}

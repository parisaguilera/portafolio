package daoimp;

import bd.Conexion;
import dao.productoDAO;
import dto.productoDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class productoDAOIMP implements productoDAO{

    @Override
    public ArrayList<productoDTO> listarTodos() {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM producto ORDER BY IDPRODUCTO desc";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            ResultSet rs = buscar.executeQuery();
             ArrayList<productoDTO> lista = new ArrayList<>();
            while(rs.next()){
                productoDTO producto = new productoDTO();
                producto.setIdproducto(rs.getInt("IDPRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPreciocompra(rs.getInt("PRECIOCOMPRA"));
                producto.setPrecioventa(rs.getInt("PRECIOVENTA"));
                producto.setIdfamilia(rs.getInt("IDFAMILIA"));
                producto.setMarca(rs.getString("MARCA"));
                producto.setFechavencimiento(rs.getDate("FECHAVENCIMIENTO"));
                producto.setCodigobarra(rs.getString("CODIGOBARRA"));
                producto.setDescripcion(rs.getString("DESCRIPCION"));
                producto.setStock(rs.getInt("STOCK"));
                producto.setStockcritico(rs.getInt("STOCKCRITICO"));
                lista.add(producto);
            }
            
             return lista;
         } catch (SQLException e) {
            System.out.println("Error SQL al Listar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Listar : " + e.getMessage());
        }
        return null;    
    }

    @Override
    public ArrayList<productoDTO> listarCategoria(int idfamilia) {
       Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM producto where IDFAMILIA = ?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idfamilia);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<productoDTO> lista = new ArrayList<>();
            while(rs.next()){
                productoDTO producto = new productoDTO();
                producto.setIdproducto(rs.getInt("IDPRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPreciocompra(rs.getInt("PRECIOCOMPRA"));
                producto.setPrecioventa(rs.getInt("PRECIOVENTA"));
                producto.setIdfamilia(rs.getInt("IDFAMILIA"));
                producto.setMarca(rs.getString("MARCA"));
                producto.setFechavencimiento(rs.getDate("FECHAVENCIMIENTO"));
                producto.setCodigobarra(rs.getString("CODIGOBARRA"));
                producto.setDescripcion(rs.getString("DESCRIPCION"));
                producto.setStock(rs.getInt("STOCK"));
                producto.setStockcritico(rs.getInt("STOCKCRITICO"));
                lista.add(producto);
            }
            
             return lista;
         } catch (SQLException e) {
            System.out.println("Error SQL al Listar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Listar : " + e.getMessage());
        }
        return null;    
    }

    @Override
    public boolean agregar(productoDTO dto) {
        String query = "INSERT INTO producto (NOMBRE,PRECIOCOMPRA,PRECIOVENTA,IDFAMILIA,MARCA,FECHAVENCIMIENTO,CODIGOBARRA,DESCRIPCION,STOCK,STOCKCRITICO) VALUES (?,?,?,?,?,?,?,?,?,?)";
       
        try (Connection conexion = Conexion.getConexion()){
            PreparedStatement agregar = conexion.prepareStatement(query);
             agregar.setString(1, dto.getNombre());
             agregar.setInt(2, dto.getPreciocompra());
             agregar.setInt(3, dto.getPrecioventa());
             agregar.setInt(4, dto.getIdfamilia());
             agregar.setString(5, dto.getMarca());
             agregar.setDate(6, dto.getFechavencimiento());
             agregar.setString(7, dto.getCodigobarra());
             agregar.setString(8, dto.getDescripcion());
             agregar.setInt(9, dto.getStock());
             agregar.setInt(10, dto.getStockcritico());
            if (agregar.executeUpdate()>0) {
                return true;            
            }        
        } catch (SQLException w) {
             System.out.println("Error SQL dao al agregar "+
                    w.getMessage());
         }catch(Exception e){
            System.out.println("Error dao al agregar "+
                    e.getMessage());
        }
        return false;    
    }

    @Override
    public boolean eliminar(int id) {
            Connection conexion = Conexion.getConexion();
        String query = "DELETE FROM PRODUCTO WHERE IDPRODUCTO= ?";
        
        try {
           
                PreparedStatement eliminar= conexion.prepareStatement(query);
                eliminar.setInt(1, id);

                eliminar.execute();

                return true;
      
         } catch (SQLException e) {
            System.out.println("Error SQL al Eliminar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Eliminar : " + e.getMessage());
        }
        return false;
    }

    @Override
    public String idtonombre(int idfamilia) {
                     Connection conexion = Conexion.getConexion();
        String query = "SELECT F.NOMBRE FROM FAMILIAPRODUCTO F JOIN PRODUCTO P ON (F.IDFAMILIA=P.IDFAMILIA) "
                + "WHERE P.IDFAMILIA=?";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setInt(1, idfamilia);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getString("NOMBRE");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar id a nombre: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar id a nombre: " + e.getMessage());
        }
        return null; 
    }

    @Override
    public boolean actualizar(String nombre, int pCompra, int pVenta, int idCategoria, String marca, Date sqlDate, String codigoBarra, String descripcion, int stock, int stockCri, int numId) {
              Connection conexion = Conexion.getConexion();
        String query = "UPDATE PRODUCTO SET NOMBRE = ?,PRECIOCOMPRA= ?,PRECIOVENTA= ?,IDFAMILIA= ?,MARCA= ?,FECHAVENCIMIENTO= ?,CODIGOBARRA= ?,DESCRIPCION= ?,STOCK= ?,STOCKCRITICO= ? WHERE IDPRODUCTO=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);
            
            update.setString(1,nombre);
            update.setInt(2,pCompra);
            update.setInt(3, pVenta);
            update.setInt(4, idCategoria);
            update.setString(5, marca);
            update.setDate(6, sqlDate);
            update.setString(7, codigoBarra);
            update.setString(8, descripcion);
            update.setInt(9, stock);
            update.setInt(10, stockCri);
            update.setInt(11, numId);
            update.executeUpdate();
            update.close();
          
            
                return true;
  
          } catch (SQLException e) {
            System.out.println("Error SQL al Actualizar: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Actualizar: " + e.getMessage());
        }
        return false;
    }

    @Override
    public productoDTO listarPorID(int idProducto) {
              Connection conexion = Conexion.getConexion();
        String query = "SELECT * FROM producto WHERE IDPRODUCTO = ?";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setInt(1, idProducto);
            
            ResultSet rs = buscar.executeQuery();
            
             productoDTO producto = new productoDTO();
            while(rs.next()){
                producto.setIdproducto(rs.getInt("IDPRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPreciocompra(rs.getInt("PRECIOCOMPRA"));
                producto.setPrecioventa(rs.getInt("PRECIOVENTA"));
                producto.setIdfamilia(rs.getInt("IDFAMILIA"));
                producto.setMarca(rs.getString("MARCA"));
                producto.setFechavencimiento(rs.getDate("FECHAVENCIMIENTO"));
                producto.setCodigobarra(rs.getString("CODIGOBARRA"));
                producto.setDescripcion(rs.getString("DESCRIPCION"));
                producto.setStock(rs.getInt("STOCK"));
                producto.setStockcritico(rs.getInt("STOCKCRITICO"));
            }
            
             return producto;
         } catch (SQLException e) {
            System.out.println("Error SQL al Listar : " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Listar : " + e.getMessage());
        }
        return null;  
    }

    @Override
    public String idproductotonombre(int idproducto) {
        Connection conexion = Conexion.getConexion();
        String query = "SELECT nombre FROM producto WHERE idproducto=?";
        try {
            PreparedStatement aNombre = conexion.prepareStatement(query);
            aNombre.setInt(1, idproducto);
            ResultSet rs = aNombre.executeQuery();
            
            if(rs.next()){
                return rs.getString("NOMBRE");
            }
            
          } catch (SQLException e) {
            System.out.println("Error SQL pasar id a nombre: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al pasar id a nombre: " + e.getMessage());
        }
        return null; 
    }

    @Override
    public boolean existeProducto(String nombre, int idfamilia) {
       
       String nombreP = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = " SELECT NOMBRE FROM producto WHERE nombre=? AND IDFAMILIA=?";
            PreparedStatement validar = conexion.prepareStatement(query);
            validar.setString(1, nombre);
            validar.setInt(2, idfamilia);
            ResultSet rs = validar.executeQuery();
            while (rs.next()) {
                nombreP = rs.getString("NOMBRE");
            }
            if (nombreP != null) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException w) {
            System.out.println("Error SQL al ver si existe" + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al ver si existe " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean actualizarStockActual(int cantidad, String nombre, int idfamilia) {
               Connection conexion = Conexion.getConexion();
        String query = "UPDATE producto SET stock=stock+? WHERE nombre=? AND IDFAMILIA=?";
        try {
            PreparedStatement update = conexion.prepareStatement(query);
            update.setInt(1, cantidad);
            update.setString(2, nombre);
            update.setInt(3, idfamilia);
            update.executeUpdate();
            update.close();
          
            
                return true;
  
          } catch (SQLException e) {
            System.out.println("Error SQL al Actualizar: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error al Actualizar: " + e.getMessage());
        }
        return false;
    }
                
    
}

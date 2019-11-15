package daoimp;

import bd.Conexion;
import dao.productoDAO;
import dto.productoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class productoDAOIMP implements productoDAO{

    @Override
    public ArrayList<productoDTO> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
                producto.setIdtipoproducto(rs.getInt("IDTIPOPRODUCTO"));
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
    public boolean actualizar(int id, String nombre, String medida) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean agregar(productoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

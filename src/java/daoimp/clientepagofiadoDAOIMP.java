
package daoimp;

import bd.Conexion;
import dao.clientepagofiadoDAO;
import dto.clientepagofiadoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author parisbastian
 */
public class clientepagofiadoDAOIMP implements clientepagofiadoDAO{

    @Override
    public ArrayList<clientepagofiadoDTO> listarTodos(String rut) {
        
         Connection conexion = Conexion.getConexion();
        String query = "select pf.idpagofiado,c.rut,c.nombre,c.deuda, sum(pf.abono),c.estado from cliente c join pagofiado pf on(c.idcliente=pf.idcliente) where c.rut= ? and c.idpagofiado=pf.idpagofiado group by pf.idpagofiado, c.rut,c.nombre,c.deuda,c.estado order by pf.idpagofiado asc";
        
        try {
            PreparedStatement buscar= conexion.prepareStatement(query);
            buscar.setString(1, rut);
            
            ResultSet rs = buscar.executeQuery();
            
             ArrayList<clientepagofiadoDTO> lista = new ArrayList<>();
            while(rs.next()){
                clientepagofiadoDTO cliente = new clientepagofiadoDTO();
                cliente.setIdpagofiado(rs.getInt("IDPAGOFIADO"));
                cliente.setRut(rs.getString("RUT"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setDeuda(rs.getInt("DEUDA"));
                cliente.setAbono(rs.getInt("SUM(PF.ABONO)"));
                cliente.setEstado(rs.getInt("ESTADO"));
                lista.add(cliente);
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
    public boolean agregar(clientepagofiadoDTO dto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

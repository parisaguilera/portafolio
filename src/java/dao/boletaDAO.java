
package dao;

import dto.boletaDTO;
import java.util.ArrayList;

public interface boletaDAO extends BaseDAO<boletaDTO>{
    
    public int nuevoIDboleta();
    public int totalPorBoleta(int idBoleta);
     public ArrayList<boletaDTO> listarTodosporIDBOLETA(int idboleta);
    
  
}





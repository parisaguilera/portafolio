
package dao;

import dto.boletaDTO;

public interface boletaDAO extends BaseDAO<boletaDTO>{
    
    public int nuevoIDboleta();
    public int totalPorBoleta(int idBoleta);
}





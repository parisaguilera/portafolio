
package dto;

import java.sql.Date;

/**
 *
 * @author IDpagofiado,IDcliente,FECHAABONO,ABONO
 */
public class pagoFiadoDTO {
    
    private int idpagofiado;
    private int idcliente;
    private Date fechaabono;
    private int abono;

    public pagoFiadoDTO() {
    }

    public int getIdpagofiado() {
        return idpagofiado;
    }

    public void setIdpagofiado(int idpagofiado) {
        this.idpagofiado = idpagofiado;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public Date getFechaabono() {
        return fechaabono;
    }

    public void setFechaabono(Date fechaabono) {
        this.fechaabono = fechaabono;
    }

    public int getAbono() {
        return abono;
    }

    public void setAbono(int abono) {
        this.abono = abono;
    }
    
    
    
}

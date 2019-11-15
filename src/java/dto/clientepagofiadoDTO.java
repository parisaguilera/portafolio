
package dto;

/**
 *
 * @author parisbastian
 */
public class clientepagofiadoDTO {
    
    private int idpagofiado;
    private String rut;
    private String nombre;
    private int deuda;
    private int abono;
    private int estado;

    public clientepagofiadoDTO() {
    }

    public int getIdpagofiado() {
        return idpagofiado;
    }

    public void setIdpagofiado(int idpagofiado) {
        this.idpagofiado = idpagofiado;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDeuda() {
        return deuda;
    }

    public void setDeuda(int deuda) {
        this.deuda = deuda;
    }

    public int getAbono() {
        return abono;
    }

    public void setAbono(int abono) {
        this.abono = abono;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
    
}

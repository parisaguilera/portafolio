package dto;

/**
 *
 * @author IDCLIENTE,RUT,NOMBRE,CONTACTO,IDBOLETA,IDPAGOFIADO,DEUDA,ESTADO
 */
public class clienteDTO {
    
    private int idcliente;
    private String rut;
    private String nombre;
    private String contacto;
    private int idboleta;
    private int idpagofiado;
    private int deuda;
    private int estado;

    public clienteDTO() {
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
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

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public int getIdboleta() {
        return idboleta;
    }

    public void setIdboleta(int idboleta) {
        this.idboleta = idboleta;
    }

    public int getIdpagofiado() {
        return idpagofiado;
    }

    public void setIdpagofiado(int idpagofiado) {
        this.idpagofiado = idpagofiado;
    }

    public int getDeuda() {
        return deuda;
    }

    public void setDeuda(int deuda) {
        this.deuda = deuda;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
   
    
}

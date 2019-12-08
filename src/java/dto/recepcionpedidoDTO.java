
package dto;

/**
 *
 * @author parisbastian
 */
public class recepcionpedidoDTO {
    
    private int idrecepcionpedido;
    private int idordenpedido;
    private int idusuario;

    public recepcionpedidoDTO() {
    }

    public int getIdrecepcionpedido() {
        return idrecepcionpedido;
    }

    public void setIdrecepcionpedido(int idrecepcionpedido) {
        this.idrecepcionpedido = idrecepcionpedido;
    }

    public int getIdordenpedido() {
        return idordenpedido;
    }

    public void setIdordenpedido(int idordenpedido) {
        this.idordenpedido = idordenpedido;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
  
}

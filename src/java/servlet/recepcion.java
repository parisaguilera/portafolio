/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.ordenPedidoDAOIMP;
import daoimp.productoDAOIMP;
import daoimp.productosPedidoDAOIMP;
import daoimp.recepcionPedidoDAOIMP;
import dto.productoDTO;
import dto.productospedidoDTO;
import dto.recepcionpedidoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parisbastian
 */
public class recepcion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            
            
              if (request.getParameter("aceptarOrden") != null){
                  
                  int idOrdenPedido = Integer.parseInt(request.getParameter("idorden"));
                  int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                  int idProveedor = Integer.parseInt(request.getParameter("idProv"));
                  
                  //set metodos recepcion y productos pedido
                  recepcionPedidoDAOIMP rec = new recepcionPedidoDAOIMP();
                  productosPedidoDAOIMP pro = new productosPedidoDAOIMP();
                  ordenPedidoDAOIMP orden = new ordenPedidoDAOIMP();
                  productoDAOIMP proLocal = new productoDAOIMP();
                  
                  //set DTOs
                  productospedidoDTO producto= new productospedidoDTO();
                  recepcionpedidoDTO recepcion= new recepcionpedidoDTO();
                 
                  //desde ahora se haran las acciones
                  //creando la recepcion
                  recepcion.setIdordenpedido(idOrdenPedido);
                  recepcion.setIdusuario(idUsuario);
                  //agregando la recepcion
                  rec.agregar(recepcion);
                
                  //LO IMPORTANTE AHORA:
                  //**agregaremos los productos pedidos a la tabla PRODUCTOS**
                  
                  //buscamos los productos de la orden y los cargamos en un array
                  
                  ArrayList<productospedidoDTO> listaAcargar = pro.listarOrdenPedido(idOrdenPedido);
                  
                  
                  //ahora cargamos los productos a cargar en PRODUCTOS
                 for (productospedidoDTO dto : listaAcargar) { 
                     //creamos un objeto productoLocal para cargar los productos del pedido
                     //PD1: EL PRECIO TOTAL SERA DIVIDO ENTRE LA CANTIDAD PARA SACAR EL ""PRECIO COMPRA""
                     int precioCompra = ((dto.getTotalcompra())/(dto.getCantidad()));
                     //PD2: EL "PRECIO VENTA" SERA EL 60% MAYOR AL COMPRADO POR UNIDAD para obtener ganancias
                     double ganancia = 0.6;
                     double precioVenta =(precioCompra+(precioCompra*ganancia));
                     //PD3: Stock critico siempre seran 2
                     //PD4: SI EXISTE SOLO SE LE AGREGARA LA CANTIDAD
                     if(proLocal.existeProducto(dto.getNombre(), dto.getIdfamilia())==true){
                         //aqui si existia, por ende solo se le agrega stock
                     proLocal.actualizarStockActual(dto.getCantidad(),dto.getNombre(), dto.getIdfamilia());
                     
                     }else{
                         productoDTO productoLocal = new productoDTO();
                         int idFamilia =dto.getIdfamilia();
                         int idTipo =dto.getIdfamilia();
                         //generar codigo de barra
                         String codBarra = pro.generarCodigoBarra(idProveedor, idFamilia, dto.getFechavencimiento(), idTipo);
                         //set dto
                         productoLocal.setNombre(dto.getNombre());
                         productoLocal.setPreciocompra(precioCompra);
                         productoLocal.setPrecioventa((int) precioVenta);
                         productoLocal.setIdfamilia(idFamilia);
                         productoLocal.setMarca(dto.getMarca());
                         productoLocal.setFechavencimiento(dto.getFechavencimiento());
                         productoLocal.setCodigobarra(codBarra);
                         productoLocal.setDescripcion(dto.getDescripcion());
                         productoLocal.setStock(dto.getCantidad());
                         productoLocal.setStockcritico(2);
                         //agregamos el productoLocal a la tabla producto
                         proLocal.agregar(productoLocal);  
                     }           
                }
                  
                    //actualizar el estado de la orden a ACEPTADA
                  orden.aprobarOrden(idOrdenPedido);
                  request.setAttribute("mensaje", "Se actualizo correctamente el inventario de PRODUCTOS");
                  request.getRequestDispatcher("/paginas/admin/recepcion.jsp").forward(request, response);
              
              
              }else if (request.getParameter("verOrden") != null){
              
              int idOrdenPedido = Integer.parseInt(request.getParameter("idorden"));
              String nombre = request.getParameter("nombre");
              String rubro = request.getParameter("rubro");
               request.setAttribute("idorden",idOrdenPedido);
               request.setAttribute("nombre",nombre);
               request.setAttribute("rubro",rubro);
                
              request.getRequestDispatcher("/paginas/admin/historialrecepcion.jsp").forward(request, response);
              
              }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.boletaDAOIMP;
import daoimp.clienteDAOIMP;
import daoimp.productoDAOIMP;
import dto.boletaDTO;
import dto.clienteDTO;
import dto.productoCarroDTO;
import dto.productoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author parisbastian
 */
public class carro extends HttpServlet {

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
            
            
            String rut = request.getParameter("rut");
            request.setAttribute("rut",rut);
            
            clienteDAOIMP cliente = new clienteDAOIMP();
            boolean existe = cliente.existeRut(rut);

            HttpSession sesion = request.getSession();
            ArrayList<productoCarroDTO> lista = (ArrayList) sesion.getAttribute("carrito");
           
                 // estado 3 = pago sin fiado
                 // estado 2 = PENDIENTE
                 // estado 1 = aceptado
                 // estado 0 = rechazado
                if(request.getParameter("eliminarProducto")!= null){ 
                         int idProducto = Integer.parseInt(request.getParameter("idPro"));
                         productoCarroDTO eliminar = new productoCarroDTO();
                        
                    for (productoCarroDTO dto : lista) { 
                                if(idProducto == dto.getIdproducto()){
                                    eliminar=dto;

                                        
                                }
                 }   
                     lista.remove(eliminar);
                     System.out.println(rut);
                     if(existe==false){
                                                    String nombre = request.getParameter("nombreClienteE");
                                                    String contacto = request.getParameter("contactoClienteE");
                                                   request.setAttribute("nombreNuevo",nombre);
                                                    request.setAttribute("contactoNuevo",contacto);
                                                    System.out.println(nombre+" eliminar"+contacto);
                                     }  
                     request.setAttribute("carrito",lista);
                     request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);
                     
                 }else if(request.getParameter("actualizarCantidad")!= null){
                 int cantProducto = Integer.parseInt(request.getParameter("numCan"));
                 int idProducto = Integer.parseInt(request.getParameter("idPro"));
                 
                 for (productoCarroDTO dto : lista) { 
                                if(idProducto == dto.getIdproducto()){
                                    dto.setCantidad(cantProducto);
                                   
                                    int precioVenta = dto.getPrecioventa();
                                    dto.setTotal(cantProducto*precioVenta);
                                 
                                    
                                  
                                    
                                }
                 }
                  if(existe==false){
                      String nombre = request.getParameter("nombreClienteA");
                       String contacto = request.getParameter("contactoClienteA");
                      request.setAttribute("nombreNuevo",nombre);
                       request.setAttribute("contactoNuevo",contacto);
                                           System.out.println(nombre + contacto);

                                     }
                    request.setAttribute("carrito",lista);
                      request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);
            
                }else if(request.getParameter("finalizarVenta") != null){
                
                    
                
                boletaDAOIMP generandoBoleta = new boletaDAOIMP();
                productoDAOIMP prodLocal = new productoDAOIMP();
                int idBoleta=generandoBoleta.nuevoIDboleta();

                 for (productoCarroDTO dto : lista) { 
                        int idpro= dto.getIdproducto();
                        int cant= dto.getCantidad();
                        boletaDTO boleta = new boletaDTO();
                          boleta.setIdboleta(idBoleta);
                          boleta.setIdproducto(idpro);
                          boleta.setCantidad(cant);
                          boleta.setTotal(dto.getTotal());
                          
                         generandoBoleta.agregar(boleta);
                         //actualizar stock del producto seleccionado
                         prodLocal.restarAlStockActual(cant, dto.getIdproducto());
                                    
                }
                 if(existe==false){
                     
                            //NUEVOS CLIENTES-->
                          String nombre = request.getParameter("nombreClienteF");
                          String contacto = request.getParameter("contactoClienteF");
                          System.out.println("PASANDO POR AQUI NUEVO CLIENTE: "+ nombre+contacto);
                          int idCliente= cliente.nuevoIDcliente();
                          clienteDTO cli = new clienteDTO();
                          cli.setIdcliente(idCliente);
                          cli.setNombre(nombre);
                          cli.setContacto(contacto);
                          cli.setIdboleta(idBoleta);
                          int total=generandoBoleta.totalPorBoleta(idBoleta);
                          cli.setDeuda(total);
                          cli.setRut(rut);
                          
                          if(request.getParameter("checkFiado") != null){
                              
                                cli.setEstado(2);
                                int tipoBoleta = 2;
                                request.setAttribute("tipoBoleta",tipoBoleta);

                                }else{
                                int tipoBoleta = 3;
                                request.setAttribute("tipoBoleta",tipoBoleta);
                                cli.setEstado(3); 
                          
                          }
                          cliente.agregar(cli);
                          
                              request.setAttribute("idboleta",idBoleta);
                              request.setAttribute("nombre",nombre);
                              request.setAttribute("rut",rut);
                              
                              
                              
                   }else{
                            //CLIENTE YA REGISTRADO -->
                            clienteDTO cli = new clienteDTO();
                            String nombre=cliente.rutAnombre(rut);
                            String contacto=cliente.rutAcontacto(rut);
                            int idCliente= cliente.rutAID(rut);
                            
                            cli.setIdcliente(idCliente);
                            cli.setNombre(nombre);
                            cli.setContacto(contacto);
                            cli.setIdboleta(idBoleta);
                            int total=generandoBoleta.totalPorBoleta(idBoleta);
                            cli.setDeuda(total);
                            cli.setRut(rut);
                            
                            if(request.getParameter("checkFiado") != null){
                                
                                    cli.setEstado(2);
                                     int tipoBoleta = 2;
                                    request.setAttribute("tipoBoleta",tipoBoleta);

                                    }else{

                                    cli.setEstado(3); 
                                     int tipoBoleta = 3;
                                    request.setAttribute("tipoBoleta",tipoBoleta);
                            } 
                            
                             cliente.agregar(cli);
                             request.setAttribute("idboleta",idBoleta);
                             request.setAttribute("nombre",nombre);
                             request.setAttribute("rut",rut);
                           
                 }
                 lista.clear();
                 request.getRequestDispatcher("/paginas/admin/carrofinalizado.jsp").forward(request, response);
                 
            }else if(request.getParameter("idPro")!=""){

                    int idProducto = Integer.parseInt(request.getParameter("idPro"));

                        if(idProducto!=0){
                            
                            
                               for (productoCarroDTO dto : lista) { 
                                if(idProducto == dto.getIdproducto()){
                                    request.setAttribute("mensaje", "Ya agregaste ese Producto!");
                                    request.setAttribute("carrito",lista);
                                    request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);
                                    
                                }
                               }
                            
                               
                                                    
                                                    productoDTO producto = new productoDTO();
                                                   productoCarroDTO proCarro = new productoCarroDTO();

                                                   productoDAOIMP pro = new productoDAOIMP();
                                                  
                                                 
                                                   System.out.println("el id del producto: "+idProducto);
                                                   producto = pro.listarPorID(idProducto);
                                                   proCarro.setIdproducto(producto.getIdproducto());
                                                   proCarro.setNombre(producto.getNombre());
                                                   proCarro.setPreciocompra(producto.getPreciocompra());
                                                   proCarro.setPrecioventa(producto.getPrecioventa());
                                                   proCarro.setIdfamilia(producto.getIdfamilia());
                                                   proCarro.setMarca(producto.getMarca());
                                                   proCarro.setFechavencimiento(producto.getFechavencimiento());
                                                   proCarro.setCodigobarra(producto.getCodigobarra());
                                                   proCarro.setDescripcion(producto.getDescripcion());
                                                   proCarro.setStock(producto.getStock());
                                                   proCarro.setStockcritico(producto.getStockcritico());
                                                   proCarro.setCantidad(1);
                                                   proCarro.setTotal(1*producto.getPrecioventa());
                                                 
                                                  lista.add(proCarro);
                                                  
                                                   request.setAttribute("carrito",lista);
                                                                            if(existe==false){
                                                                                
                                                                                  String nombre = request.getParameter("nombreCliente");
                                                                                  String contacto = request.getParameter("contactoCliente");
                                                                                  System.out.println(contacto+nombre);
                                                                                  request.setAttribute("nombreNuevo",nombre);
                                                                                  request.setAttribute("contactoNuevo",contacto);
                                                                            }
                                                   request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);


                        }else{
                        request.setAttribute("mensaje", "Producto NO existe");
                        }
            }else{
                  if(existe==false){
                   String nombre = request.getParameter("nombreCliente");
                  String contacto = request.getParameter("contactoCliente");
                   request.setAttribute("nombreNuevo",nombre);
                    request.setAttribute("contactoNuevo",contacto);
                                                                            }
            request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);
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

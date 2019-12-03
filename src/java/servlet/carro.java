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
import dto.listaProductosCarrito;
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
            
            listaProductosCarrito datos =null;
            
             String rut = request.getParameter("rut");
            request.setAttribute("rut",rut);
            
            clienteDAOIMP cliente = new clienteDAOIMP();
            boolean existe = cliente.existeRut(rut);

            HttpSession sesion = request.getSession();
            ArrayList<productoDTO> lista = (ArrayList) sesion.getAttribute("carrito");
            
            
            if(request.getParameter("finalizarVenta") != null){
                
                boletaDAOIMP generandoBoleta = new boletaDAOIMP();
                int idBoleta=generandoBoleta.nuevoIDboleta();
                int cantidad=1;

                 for (productoDTO dto : lista) { 
                        boletaDTO boleta = new boletaDTO();
                          boleta.setIdboleta(idBoleta);
                          boleta.setIdproducto(dto.getIdproducto());
                          boleta.setCantidad(cantidad);
                          boleta.setTotal((dto.getPrecioventa())*cantidad);
                         generandoBoleta.agregar(boleta);
                                    
                }
                 if(existe==false){
                          String nombre = request.getParameter("nombreCliente");
                          String contacto = request.getParameter("contactoCliente");
                          clienteDTO cli = new clienteDTO();
                          
                          System.out.println(nombre);
                          System.out.println(contacto);
                          int idCliente= cliente.nuevoIDcliente();
                          cli.setIdcliente(idCliente);
                          cli.setNombre(nombre);
                          cli.setContacto(contacto);
                          cli.setIdboleta(idBoleta);
                          int total=generandoBoleta.totalPorBoleta(idBoleta);
                          cli.setDeuda(total);
                          cli.setRut(rut);
                          cli.setEstado(3);      
                          cliente.agregar(cli);
                          
                            request.setAttribute("nombreNuevo",nombre);
                              request.setAttribute("contactoNuevo",contacto);
                   }else{
                            clienteDTO cli = new clienteDTO();
                            int idCliente= cliente.nuevoIDcliente();
                            cli.setIdcliente(idCliente);
                            String nombre=cliente.rutAnombre(rut);
                            String contacto=cliente.rutAcontacto(rut);
                            cli.setNombre(nombre);
                            cli.setContacto(contacto);
                            cli.setIdboleta(idBoleta);
                            int total=generandoBoleta.totalPorBoleta(idBoleta);
                            cli.setDeuda(total);
                            cli.setRut(rut);
                            cli.setEstado(3);  
                            
                            cliente.agregar(cli);
                           
                 }
                
                 
                 
                 request.getRequestDispatcher("/paginas/admin/finalizarcarro.jsp").forward(request, response);
                 
            }else if(request.getParameter("idPro")!=""){

                    int idProducto = Integer.parseInt(request.getParameter("idPro"));

                        if(idProducto!=0){
                            
                            
                               for (productoDTO dto : lista) { 
                                if(idProducto == dto.getIdproducto()){
                                    request.setAttribute("mensaje", "Ya agregaste ese Producto!");
                                    request.setAttribute("carrito",lista);
                                    request.getRequestDispatcher("/paginas/admin/ventarut.jsp").forward(request, response);
                                    
                                }
                               }
                            
                               

                                                    productoDTO producto = new productoDTO();
                                                   productoDAOIMP pro = new productoDAOIMP();


                                                   producto = pro.listarPorID(idProducto);

                                                  lista.add(producto);

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

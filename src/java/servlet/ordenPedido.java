/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.productosPedidoDAOIMP;
import dto.ordenpedidoDTO;
import dto.productospedidoDTO;
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
public class ordenPedido extends HttpServlet {

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
            
             String nombreProveedor = request.getParameter("selOrden");
             int idProducto = Integer.parseInt(request.getParameter("idproducto"));
             int idProveedor = Integer.parseInt(request.getParameter("idProv"));
               request.setAttribute("idPro",idProveedor);
                request.setAttribute("selOrden",nombreProveedor);
             productosPedidoDAOIMP pro = new productosPedidoDAOIMP();
             
             HttpSession sesion = request.getSession();
             
             ArrayList<productospedidoDTO> listaOrden = (ArrayList) sesion.getAttribute("listaOrden");
             
              if(request.getParameter("agregarProducto") != null){
                  
                    
                    productospedidoDTO producto = new productospedidoDTO();
                    
                    producto= pro.obtenerPorID(idProducto);
                    
                  
                    listaOrden.add(producto);
                    request.setAttribute("listaOrden",listaOrden);
                    System.out.println(listaOrden.size());
                    request.getRequestDispatcher("/paginas/admin/orden.jsp").forward(request, response);
              
              }else if(request.getParameter("eliminarProducto") != null){
                  
                  int index= Integer.parseInt(request.getParameter("indexLista"));
                  index=index -1;
                  
                  listaOrden.remove(index);

                 
     
                    request.setAttribute("listaOrden",listaOrden);
                    System.out.println(listaOrden.size());
                    request.getRequestDispatcher("/paginas/admin/orden.jsp").forward(request, response);
              
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

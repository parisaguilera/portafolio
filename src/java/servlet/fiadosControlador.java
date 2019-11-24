/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.clienteDAOIMP;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parisbastian
 */
public class fiadosControlador extends HttpServlet {

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
            
           clienteDAOIMP cliente = new clienteDAOIMP();
        //condificon para boton en estado de pendiente
           if (request.getParameter("aceptarFiadoPen") != null){
               
                // estado 3 = pago sin fiado
                 // estado 2 = PENDIENTE
                 // estado 1 = aceptado
                 // estado 0 = rechazado
               int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
               
               cliente.actualizarEstado(1, idBoleta);
               request.setAttribute("mensaje", "Fiado PENDIENTE pasa a ACEPTADO");
               request.getRequestDispatcher("/paginas/admin/fiados.jsp").forward(request, response);
           
           }else if (request.getParameter("rechazarFiadoPen") != null){
               
               int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
               
               cliente.actualizarEstado(0, idBoleta);
               request.setAttribute("mensaje", "Fiado PENDIENTE pasa a RECHAZADO");
               request.getRequestDispatcher("/paginas/admin/fiados.jsp").forward(request, response);
               
           }
           //condicion para boton en estado rechazado
           else if (request.getParameter("aceptarFiadoRe") != null){
               
               int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
               
               cliente.actualizarEstado(1, idBoleta);
               request.setAttribute("mensaje", "Fiado RECHAZADO pasa a ACEPTADO");
               request.getRequestDispatcher("/paginas/admin/fiados.jsp").forward(request, response);
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

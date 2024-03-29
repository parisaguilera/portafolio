/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.clienteDAOIMP;
import daoimp.pagoFiadoDAOIMP;
import dto.clienteDTO;
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
public class deudas extends HttpServlet {

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
            
             if (request.getParameter("buscar") != null){
                 // estado 3 = pago sin fiado
                 // estado 2 = PENDIENTE
                 // estado 1 = aceptado
                 // estado 0 = rechazado
                 clienteDAOIMP deuda = new clienteDAOIMP();
                
           String rut = request.getParameter("txtRut");
            //-> PARA SABER EL TOTAL ABONADO
                 pagoFiadoDAOIMP abonado = new pagoFiadoDAOIMP();
           int idcliente=deuda.rutToId(rut);
           int deudaFiado = abonado.deudaFiado(idcliente);
           //-> finalizar saber total abonado
           deuda.listarTodosFicha(rut, deudaFiado);
            ArrayList<clienteDTO> deudasAceptadas = deuda.listarTodos(rut,1);
            ArrayList<clienteDTO> deudasPendientes = deuda.listarTodosFicha(rut,2);
            ArrayList<clienteDTO> deudasRechazadas = deuda.listarTodosFicha(rut,0);
            
                 System.out.println(deudasPendientes.size());
                 //enviamos el total abonado
            request.setAttribute("deudaFiado", deudaFiado);
            request.setAttribute("deudasAceptadas", deudasAceptadas);
            request.setAttribute("deudasRechazadas", deudasRechazadas);
             request.setAttribute("deudasPendientes", deudasPendientes);
            request.setAttribute("rut", rut);
           request.getRequestDispatcher("/paginas/deudas.jsp").forward(request, response);
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

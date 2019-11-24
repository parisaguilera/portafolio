/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.proveedorDAOIMP;
import dto.proveedorDTO;
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
public class proveedorControlador extends HttpServlet {

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
               proveedorDTO proveedor = new proveedorDTO();
               proveedorDAOIMP prov = new proveedorDAOIMP();
               if (request.getParameter("agregarProveedor") != null){
                    
                    String nombre= request.getParameter("txtNombre").trim();
                    String datosContacto= "+569"+request.getParameter("txtContacto").trim();
                    String rubro= request.getParameter("txtRubro").trim();
                    
                    proveedor.setNombre(nombre);
                    proveedor.setDatoscontacto(datosContacto);
                    proveedor.setRubro(rubro);
                    prov.agregar(proveedor);
                    request.setAttribute("mensaje", "Proveedor registrado Correctamente");
                    request.getRequestDispatcher("/paginas/admin/proveedor.jsp").forward(request, response);
              
               
               } else if (request.getParameter("eliminarProveedor") != null){
                   
                         int id = Integer.parseInt(request.getParameter("numId"));
                         prov.eliminar(id);
                         request.setAttribute("mensaje", "Proveedor Eliminado Correctamente");
                        request.getRequestDispatcher("/paginas/admin/proveedor.jsp").forward(request, response);
                         
               } else if(request.getParameter("editarProveedor") != null){
                   
                        int id =Integer.parseInt(request.getParameter("numId"));
                        String nombre= request.getParameter("txtNombre").trim();
                        String datosContacto= "+569"+request.getParameter("txtContacto").trim();
                        String rubro= request.getParameter("txtRubro").trim();

                        proveedor.setNombre(nombre);
                        proveedor.setDatoscontacto(datosContacto);
                        proveedor.setRubro(rubro);
                        prov.actualizar(nombre, datosContacto, rubro, id);
                        request.setAttribute("mensaje", "Proveedor Editado Correctamente");
                        request.getRequestDispatcher("/paginas/admin/proveedor.jsp").forward(request, response);
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
